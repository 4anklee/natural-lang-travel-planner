package main

import (
	"database/sql"
	"encoding/json"
)

func QueryToJSON(db *sql.DB, query string, maxRows int) (string, error) {
	rows, err := db.Query(query)
	if err != nil {
		return "", err
	}
	defer rows.Close()

	cols, err := rows.Columns()
	if err != nil {
		return "", err
	}

	results := make([]map[string]any, 0)
	count := 0

	for rows.Next() {
		if count >= maxRows {
			break
		}
		count++

		vals := make([]any, len(cols))
		valPtrs := make([]any, len(cols))
		for i := range vals {
			valPtrs[i] = &vals[i]
		}

		if err := rows.Scan(valPtrs...); err != nil {
			return "", err
		}

		rowMap := map[string]any{}
		for i, c := range cols {
			v := vals[i]
			// Convert []byte -> string for SQLite text fields
			if b, ok := v.([]byte); ok {
				rowMap[c] = string(b)
			} else {
				rowMap[c] = v
			}
		}
		results = append(results, rowMap)
	}

	if err := rows.Err(); err != nil {
		return "", err
	}

	out, _ := json.MarshalIndent(results, "", "  ")
	return string(out), nil
}
