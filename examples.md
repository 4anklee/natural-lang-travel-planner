# Examples

Six additional example queries demonstrating the system's capabilities.

## Example 1

**Question:** "What cities are in Japan?"

**SQL:**

```sql
SELECT name FROM City WHERE country = 'Japan';
```

**Response:** In Japan, some cities include Tokyo and Kyoto. If you're interested in more cities, you might want to try a broader search.

---

## Example 2

**Question:** "Find me hotels under $100 per night with a rating above 4"

**SQL:**

```sql
SELECT * FROM Hotel WHERE price_per_night < 100 AND rating > 4;
```

**Response:** Here are some hotels under $100 per night with a rating above 4: Centro Budget Hotel ($85), Medina Riad Budget ($35), and Ubud Budget Villa ($35). Would you like more options or details about these hotels?

---

## Example 3

**Question:** "What is the total cost of a 5-day trip to Paris including hotel and food?"

**SQL:**

```sql
SELECT 
    (h.price_per_night * 5) + (c.avg_daily_food_cost * 5) AS total_cost
FROM 
    City c
JOIN 
    Hotel h ON h.city_id = (SELECT city_id FROM City WHERE name = 'Paris')
WHERE 
    c.name = 'Paris';
```

**Response:** The total cost for a 5-day trip to Paris, including hotel and food, is between $1,425 and $2,275. The exact amount depends on your hotel and food choices.

---

## Example 4

**Question:** "Show me all attractions in Tokyo that are free"

**SQL:**

```sql
SELECT * FROM Attraction WHERE city_id = (SELECT city_id FROM City WHERE name = 'Tokyo') AND price = 0;
```

**Response:** I couldn't find any free attractions in Tokyo in the database. You might want to try a different query or check for attractions with different criteria.

---

## Example 5

**Question:** "Which city has the lowest daily food cost?"

**SQL:**

```sql
SELECT name, country, avg_daily_food_cost
FROM City
ORDER BY avg_daily_food_cost ASC
LIMIT 1;
```

**Response:** Hanoi in Vietnam has the lowest daily food cost at $18.

---

## Example 6

**Question:** "Find flights departing in June that cost less than $500"

**SQL:**

```sql
SELECT * FROM Flight WHERE departure_date LIKE '2025-06%' AND price < 500;
```

**Response:** I found several flights in June under $500 from Salt Lake City. They range in price from $150 to $300, with departure dates between June 1 and June 12. Would you like to see options to a specific destination or on certain dates?
