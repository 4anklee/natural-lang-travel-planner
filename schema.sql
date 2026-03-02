-- Enable foreign key enforcement in SQLite
PRAGMA foreign_keys = ON;

-- =========================
-- 1. City
-- =========================
CREATE TABLE City (
    city_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    country TEXT NOT NULL,
    avg_daily_food_cost REAL NOT NULL,
    avg_daily_transport_cost REAL NOT NULL
);

-- =========================
-- 2. Hotel
-- =========================
CREATE TABLE Hotel (
    hotel_id INTEGER PRIMARY KEY AUTOINCREMENT,
    city_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    price_per_night REAL NOT NULL,
    rating REAL NOT NULL CHECK (rating >= 0 AND rating <= 5),
    FOREIGN KEY (city_id) REFERENCES City(city_id) ON DELETE CASCADE
);

-- =========================
-- 3. Flight
-- =========================
CREATE TABLE Flight (
    flight_id INTEGER PRIMARY KEY AUTOINCREMENT,
    origin_city TEXT NOT NULL,
    destination_city_id INTEGER NOT NULL,
    price REAL NOT NULL,
    departure_date TEXT NOT NULL,   -- Stored as ISO format: YYYY-MM-DD
    return_date TEXT NOT NULL,
    FOREIGN KEY (destination_city_id) REFERENCES City(city_id) ON DELETE CASCADE
);

-- =========================
-- 4. Attraction
-- =========================
CREATE TABLE Attraction (
    attraction_id INTEGER PRIMARY KEY AUTOINCREMENT,
    city_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    category TEXT NOT NULL,
    price REAL NOT NULL,
    FOREIGN KEY (city_id) REFERENCES City(city_id) ON DELETE CASCADE
);

-- =========================
-- 5. TripOption
-- =========================
CREATE TABLE TripOption (
    trip_id INTEGER PRIMARY KEY AUTOINCREMENT,
    city_id INTEGER NOT NULL,
    duration_days INTEGER NOT NULL CHECK (duration_days > 0),
    recommended_hotel_id INTEGER NOT NULL,
    estimated_attraction_budget REAL NOT NULL,
    FOREIGN KEY (city_id) REFERENCES City(city_id) ON DELETE CASCADE,
    FOREIGN KEY (recommended_hotel_id) REFERENCES Hotel(hotel_id) ON DELETE CASCADE
);