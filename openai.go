package main

import (
	"bufio"
	"bytes"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"os"
	"time"
)

var httpClient = &http.Client{Timeout: 30 * time.Second}

type ChatReq struct {
	Model       string `json:"model"`
	Messages    []struct {
		Role    string `json:"role"`
		Content string `json:"content"`
	} `json:"messages"`
	Temperature float64 `json:"temperature,omitempty"`
	MaxTokens   int     `json:"max_tokens,omitempty"`
	Stream      bool    `json:"stream,omitempty"`
}

func chat(model string, messages [][2]string, maxTokens int) (string, error) {
	apiKey := os.Getenv("OPENAI_API_KEY")
	if apiKey == "" {
		return "", fmt.Errorf("OPENAI_API_KEY not set")
	}

	reqBody := ChatReq{Model: model, Temperature: 0, MaxTokens: maxTokens}
	for _, m := range messages {
		reqBody.Messages = append(reqBody.Messages, struct {
			Role    string `json:"role"`
			Content string `json:"content"`
		}{Role: m[0], Content: m[1]})
	}

	b, _ := json.Marshal(reqBody)
	req, _ := http.NewRequest("POST", "https://api.openai.com/v1/chat/completions", bytes.NewBuffer(b))
	req.Header.Set("Authorization", "Bearer "+apiKey)
	req.Header.Set("Content-Type", "application/json")

	resp, err := httpClient.Do(req)
	if err != nil {
		return "", err
	}
	defer resp.Body.Close()

	var result map[string]any
	if err := json.NewDecoder(resp.Body).Decode(&result); err != nil {
		return "", err
	}

	choices, ok := result["choices"].([]any)
	if !ok || len(choices) == 0 {
		return "", fmt.Errorf("no choices returned")
	}
	msg := choices[0].(map[string]any)["message"].(map[string]any)
	return msg["content"].(string), nil
}

func chatStream(model string, messages [][2]string, w io.Writer) error {
	apiKey := os.Getenv("OPENAI_API_KEY")
	if apiKey == "" {
		return fmt.Errorf("OPENAI_API_KEY not set")
	}

	reqBody := ChatReq{Model: model, Temperature: 0, Stream: true}
	for _, m := range messages {
		reqBody.Messages = append(reqBody.Messages, struct {
			Role    string `json:"role"`
			Content string `json:"content"`
		}{Role: m[0], Content: m[1]})
	}

	b, _ := json.Marshal(reqBody)
	req, _ := http.NewRequest("POST", "https://api.openai.com/v1/chat/completions", bytes.NewBuffer(b))
	req.Header.Set("Authorization", "Bearer "+apiKey)
	req.Header.Set("Content-Type", "application/json")

	resp, err := httpClient.Do(req)
	if err != nil {
		return err
	}
	defer resp.Body.Close()

	scanner := bufio.NewScanner(resp.Body)
	for scanner.Scan() {
		line := scanner.Text()
		if line == "" || line == "data: [DONE]" {
			continue
		}
		if len(line) > 6 && line[:6] == "data: " {
			var chunk struct {
				Choices []struct {
					Delta struct {
						Content string `json:"content"`
					} `json:"delta"`
				} `json:"choices"`
			}
			if err := json.Unmarshal([]byte(line[6:]), &chunk); err != nil {
				continue
			}
			if len(chunk.Choices) > 0 {
				fmt.Fprint(w, chunk.Choices[0].Delta.Content)
			}
		}
	}
	return scanner.Err()
}

func GenerateSQL(question, schema string) (string, error) {
	sys := `You translate English questions into SQLite SELECT queries.

Rules:
- Output ONLY SQL (no explanations).
- Use only these tables/columns from the schema.
- Only SELECT queries. No INSERT/UPDATE/DELETE/PRAGMA/DDL.
- If the user asks for "June", filter departure_date LIKE '2025-06%'.`

	user := fmt.Sprintf("Schema:\n%s\n\nQuestion:\n%s", schema, question)

	return chat("gpt-4.1-nano", [][2]string{
		{"system", sys},
		{"user", user},
	}, 300)
}

func GenerateAnswer(question, sqlText, rowsJSON string) error {
	sys := `You are a helpful travel assistant. Answer in plain English.
If there are 0 rows, say you couldn't find any matches in the database and suggest a different query.
Be concise: 2-5 sentences max.`

	user := fmt.Sprintf(
		"User question:\n%s\n\nSQL used:\n%s\n\nQuery results (JSON rows):\n%s\n\nAnswer the user:",
		question, sqlText, rowsJSON,
	)

	return chatStream("gpt-4.1-nano", [][2]string{
		{"system", sys},
		{"user", user},
	}, os.Stdout)
}
