package main

import (
	"context"
	"fmt"
	"os"

	"github.com/openai/openai-go/v3"
)

var client openai.Client

func InitOpenAI() {
	client = openai.NewClient()
}

func GenerateSQL(question, schema string) (string, error) {
	sys := `You translate English questions into SQLite SELECT queries.

Rules:
- Output ONLY SQL (no explanations).
- Use only these tables/columns from the schema.
- Only SELECT queries. No INSERT/UPDATE/DELETE/PRAGMA/DDL.
- If the user asks for "June", filter departure_date LIKE '2025-06%'.`

	user := fmt.Sprintf("Schema:\n%s\n\nQuestion:\n%s", schema, question)

	completion, err := client.Chat.Completions.New(context.TODO(), openai.ChatCompletionNewParams{
		Model:       "gpt-4.1-nano",
		Temperature: openai.Float(0),
		MaxTokens:   openai.Int(300),
		Messages: []openai.ChatCompletionMessageParamUnion{
			openai.SystemMessage(sys),
			openai.UserMessage(user),
		},
	})
	if err != nil {
		return "", err
	}

	if len(completion.Choices) == 0 {
		return "", fmt.Errorf("no choices returned")
	}
	return completion.Choices[0].Message.Content, nil
}

func GenerateAnswer(question, sqlText, rowsJSON string) error {
	sys := `You are a helpful travel assistant. Answer in plain English.
If there are 0 rows, say you couldn't find any matches in the database and suggest a different query.
Be concise: 2-5 sentences max.`

	user := fmt.Sprintf(
		"User question:\n%s\n\nSQL used:\n%s\n\nQuery results (JSON rows):\n%s\n\nAnswer the user:",
		question, sqlText, rowsJSON,
	)

	stream := client.Chat.Completions.NewStreaming(context.TODO(), openai.ChatCompletionNewParams{
		Model:       "gpt-4.1-nano",
		Temperature: openai.Float(0),
		Messages: []openai.ChatCompletionMessageParamUnion{
			openai.SystemMessage(sys),
			openai.UserMessage(user),
		},
	})

	for stream.Next() {
		chunk := stream.Current()
		if len(chunk.Choices) > 0 {
			fmt.Fprint(os.Stdout, chunk.Choices[0].Delta.Content)
		}
	}
	return stream.Err()
}
