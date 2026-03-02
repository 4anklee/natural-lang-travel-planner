package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strings"

	"github.com/joho/godotenv"
)

func main() {
	if err := godotenv.Load(); err != nil {
		log.Println("No .env file found; falling back to environment variables")
	}

	InitOpenAI()

	db, err := InitDB()
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	schema, err := os.ReadFile("./schema.sql")
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println("Natural Language Travel Query System (type 'exit' to quit)")
	in := bufio.NewReader(os.Stdin)

	for {
		fmt.Print("\n> ")
		q, _ := in.ReadString('\n')
		q = strings.TrimSpace(q)
		if q == "" {
			continue
		}
		if strings.EqualFold(q, "exit") {
			break
		}

		// 1) GPT → SQL
		sqlText, err := GenerateSQL(q, string(schema))
		if err != nil {
			fmt.Println("Error generating SQL:", err)
			continue
		}

		sqlText = ExtractSQL(sqlText)

		// Safety: only allow SELECT queries
		if !LooksSafeSelect(sqlText) {
			fmt.Println("Blocked unsafe SQL. Model returned:\n", sqlText)
			continue
		}

		fmt.Println("\n--- SQL ---")
		fmt.Println(sqlText)

		// 2) Run SQL
		rowsJSON, err := QueryToJSON(db, sqlText, 100) // limit rows returned to GPT
		if err != nil {
			fmt.Println("DB error:", err)
			continue
		}

		// 3) GPT → final answer streamed to stdout
		fmt.Println("\n--- Answer ---")
		if err := GenerateAnswer(q, sqlText, rowsJSON); err != nil {
			fmt.Println("Error generating answer:", err)
			continue
		}
		fmt.Println() // newline after streamed output
	}
}
