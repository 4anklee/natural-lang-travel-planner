# Natural Language Travel Planner

A CLI tool that lets you query a travel database using plain English. It translates your questions into SQL using OpenAI, runs the query against a local SQLite database, and returns a natural language answer.

![Schema Diagram](assets/schemas.jpg)

## Setup

### Prerequisites

- Go 1.21+
- An [OpenAI API key](https://platform.openai.com/api-keys)

### Installation

1. Clone the repo:

```bash
git clone https://github.com/yourusername/natural-lang-travel-planner.git
cd natural-lang-travel-planner
```

1. Install dependencies:

```bash
go mod tidy
```

1. Set up the database:

```bash
sqlite3 travel.db < schema.sql
sqlite3 travel.db < seed.sql
```

1. Configure your API key:

```bash
cp .env.example .env
```

Then edit `.env` and add your OpenAI API key.

## Usage

```bash
go run .
```

Then type a question in plain English:

```
Natural Language Travel Query System (type 'exit' to quit)

> What are the cheapest flights to Tokyo?

--- SQL ---
SELECT * FROM Flight WHERE destination_city_id = (SELECT city_id FROM City WHERE name = 'Tokyo') ORDER BY price ASC LIMIT 20;

--- Answer ---
The cheapest flight to Tokyo costs $450, departing on 2025-06-15 with a return on 2025-06-22.
```

Type `exit` to quit.

## Sample: Successful Query

> **Question:** "Which city has the lowest daily food cost?"

```sql
SELECT name, country, avg_daily_food_cost
FROM City
ORDER BY avg_daily_food_cost ASC
LIMIT 1;
```

> **Answer:** Hanoi in Vietnam has the lowest daily food cost at $18.

The model correctly identified the right column, applied ordering, and limited to one result.

## Sample: Failed Query

> **Question:** "Show me all attractions in Tokyo that are free"

```sql
SELECT * FROM Attraction WHERE city_id = (SELECT city_id FROM City WHERE name = 'Tokyo') AND price = 0;
```

> **Answer:** I couldn't find any free attractions in Tokyo in the database. You might want to try a different query or check for attractions with different criteria.

The SQL was technically correct, but the database had no attractions with `price = 0`. This shows the model generates valid SQL but can't know what data actually exists.

## Prompting Strategies

Based on the paper [How to Prompt LLMs for Text-to-SQL](https://arxiv.org/abs/2305.11853), we experimented with the following strategies:

1. **Zero-shot prompting** — We provide the schema and question with no examples. This is our current approach. The model generates correct SQL for straightforward queries (joins, filters, aggregations) but occasionally hallucinates columns or misinterprets ambiguous questions.

2. **Instruction-based prompting** — We add explicit rules in the system prompt (e.g., "Output ONLY SQL", "Only SELECT queries", date format hints). This noticeably reduced formatting issues and prevented the model from returning explanations alongside SQL.

3. **Few-shot prompting** — This strategy includes example question-SQL pairs in the prompt so the model can learn the expected format. We did not implement this, but it would likely improve accuracy on complex multi-join queries where the model needs to see how tables relate.

**Observations:** Adding schema-aware instructions (strategy 2) made the biggest difference — without them, the model would sometimes wrap SQL in markdown or add commentary. Zero-shot worked surprisingly well for simple queries but struggled with multi-join questions.

## Project Structure

```
├── main.go        # Entry point and REPL loop
├── openai.go      # OpenAI API calls (SQL generation + answer streaming)
├── db.go          # SQLite database initialization
├── query.go       # Executes SQL and converts results to JSON
├── helpers.go     # SQL extraction and safety checks
├── schema.sql     # Database schema
├── seed.sql       # Sample travel data
└── assets/        # Diagrams and images
```
