package main

import (
	"regexp"
	"strings"
)

var sqlBlock = regexp.MustCompile("(?is)```sql\\s*(.*?)\\s*```")

func ExtractSQL(s string) string {
	s = strings.TrimSpace(s)
	if m := sqlBlock.FindStringSubmatch(s); len(m) == 2 {
		return strings.TrimSpace(m[1])
	}
	// If no code block, return raw
	return s
}

func LooksSafeSelect(sql string) bool {
	s := strings.TrimSpace(strings.ToLower(sql))

	// only allow SELECT / WITH (CTE that ends in SELECT)
	if !(strings.HasPrefix(s, "select") || strings.HasPrefix(s, "with")) {
		return false
	}

	// block obvious write operations
	bad := []string{"insert ", "update ", "delete ", "drop ", "alter ", "create ", "pragma ", "attach ", "detach "}
	for _, b := range bad {
		if strings.Contains(s, b) {
			return false
		}
	}
	return true
}
