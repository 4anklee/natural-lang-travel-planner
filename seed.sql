-- =========================
-- Insert Cities (50)
-- =========================
INSERT INTO City (name, country, avg_daily_food_cost, avg_daily_transport_cost)
VALUES
('Denver', 'USA', 45, 20),
('Los Angeles', 'USA', 65, 30),
('New York', 'USA', 80, 35),
('Paris', 'France', 75, 25),
('Tokyo', 'Japan', 70, 30),
('Mexico City', 'Mexico', 40, 15),
('London', 'UK', 78, 28),
('Rome', 'Italy', 55, 18),
('Barcelona', 'Spain', 50, 16),
('Bangkok', 'Thailand', 25, 8),
('Sydney', 'Australia', 70, 25),
('Dubai', 'UAE', 60, 22),
('Istanbul', 'Turkey', 30, 10),
('Seoul', 'South Korea', 45, 15),
('Berlin', 'Germany', 48, 18),
('Amsterdam', 'Netherlands', 55, 14),
('San Francisco', 'USA', 85, 32),
('Chicago', 'USA', 60, 25),
('Toronto', 'Canada', 55, 22),
('Vancouver', 'Canada', 58, 20),
('Singapore', 'Singapore', 50, 18),
('Hong Kong', 'China', 55, 12),
('Buenos Aires', 'Argentina', 30, 10),
('Lima', 'Peru', 28, 8),
('Cairo', 'Egypt', 20, 6),
('Marrakech', 'Morocco', 22, 7),
('Cape Town', 'South Africa', 35, 12),
('Lisbon', 'Portugal', 40, 12),
('Prague', 'Czech Republic', 35, 10),
('Vienna', 'Austria', 55, 18),
('Munich', 'Germany', 58, 20),
('Athens', 'Greece', 40, 14),
('Dublin', 'Ireland', 60, 20),
('Edinburgh', 'UK', 55, 18),
('Reykjavik', 'Iceland', 90, 30),
('Oslo', 'Norway', 85, 28),
('Stockholm', 'Sweden', 70, 22),
('Copenhagen', 'Denmark', 72, 24),
('Helsinki', 'Finland', 65, 20),
('Warsaw', 'Poland', 30, 10),
('Budapest', 'Hungary', 28, 9),
('Zurich', 'Switzerland', 95, 30),
('Kyoto', 'Japan', 60, 22),
('Mumbai', 'India', 20, 5),
('Bali', 'Indonesia', 22, 6),
('Hanoi', 'Vietnam', 18, 5),
('Kuala Lumpur', 'Malaysia', 25, 8),
('Rio de Janeiro', 'Brazil', 35, 12),
('Havana', 'Cuba', 25, 8),
('Cancun', 'Mexico', 50, 18);

-- =========================
-- Insert Hotels (100)
-- =========================
INSERT INTO Hotel (city_id, name, price_per_night, rating)
VALUES
-- Denver (1)
(1, 'Denver Budget Inn', 95, 3.9),
(1, 'Rocky Mountain Hotel', 160, 4.5),
-- Los Angeles (2)
(2, 'LA Comfort Stay', 180, 4.2),
(2, 'Sunset Luxury Suites', 320, 4.8),
-- New York (3)
(3, 'NYC Central Hotel', 250, 4.3),
(3, 'Manhattan Grand', 400, 4.7),
-- Paris (4)
(4, 'Paris Central Stay', 210, 4.6),
(4, 'Eiffel Luxury Palace', 380, 4.9),
-- Tokyo (5)
(5, 'Tokyo Business Hotel', 150, 4.4),
(5, 'Shinjuku Premium Stay', 300, 4.8),
-- Mexico City (6)
(6, 'Centro Budget Hotel', 85, 4.1),
(6, 'Chapultepec Suites', 140, 4.5),
-- London (7)
(7, 'Kings Cross Lodge', 170, 4.0),
(7, 'Westminster Luxury Hotel', 350, 4.7),
-- Rome (8)
(8, 'Trastevere Inn', 120, 4.2),
(8, 'Colosseum Grand Hotel', 280, 4.6),
-- Barcelona (9)
(9, 'Gothic Quarter Hostel', 90, 3.8),
(9, 'La Rambla Premium', 250, 4.5),
-- Bangkok (10)
(10, 'Khao San Budget Stay', 35, 3.7),
(10, 'Riverside Bangkok Hotel', 110, 4.6),
-- Sydney (11)
(11, 'Sydney Harbour Inn', 180, 4.3),
(11, 'Opera House Grand', 350, 4.8),
-- Dubai (12)
(12, 'Dubai City Hotel', 150, 4.2),
(12, 'Burj View Luxury Resort', 450, 4.9),
-- Istanbul (13)
(13, 'Sultanahmet Budget Stay', 55, 4.0),
(13, 'Bosphorus Palace Hotel', 180, 4.7),
-- Seoul (14)
(14, 'Myeongdong Guesthouse', 70, 3.9),
(14, 'Gangnam Premium Hotel', 200, 4.6),
-- Berlin (15)
(15, 'Berlin Mitte Hostel', 65, 3.8),
(15, 'Brandenburg Gate Hotel', 190, 4.5),
-- Amsterdam (16)
(16, 'Canal District Inn', 130, 4.1),
(16, 'Dam Square Luxury Hotel', 280, 4.7),
-- San Francisco (17)
(17, 'Fishermans Wharf Lodge', 200, 4.0),
(17, 'Union Square Grand', 380, 4.7),
-- Chicago (18)
(18, 'Loop Budget Hotel', 130, 3.9),
(18, 'Magnificent Mile Suites', 280, 4.6),
-- Toronto (19)
(19, 'Downtown Toronto Inn', 140, 4.1),
(19, 'CN Tower View Hotel', 260, 4.5),
-- Vancouver (20)
(20, 'Gastown Budget Stay', 120, 4.0),
(20, 'Stanley Park Hotel', 250, 4.6),
-- Singapore (21)
(21, 'Little India Lodge', 100, 4.0),
(21, 'Marina Bay Sands View', 350, 4.8),
-- Hong Kong (22)
(22, 'Kowloon Budget Hotel', 90, 3.8),
(22, 'Victoria Peak Suites', 300, 4.7),
-- Buenos Aires (23)
(23, 'San Telmo Hostel', 40, 3.9),
(23, 'Recoleta Grand Hotel', 130, 4.5),
-- Lima (24)
(24, 'Miraflores Budget Inn', 45, 4.0),
(24, 'Lima Luxury Resort', 150, 4.6),
-- Cairo (25)
(25, 'Giza View Budget Hotel', 30, 3.7),
(25, 'Nile Palace Hotel', 120, 4.5),
-- Marrakech (26)
(26, 'Medina Riad Budget', 35, 4.1),
(26, 'Royal Marrakech Palace', 160, 4.7),
-- Cape Town (27)
(27, 'Long Street Hostel', 50, 3.8),
(27, 'Table Mountain Hotel', 200, 4.6),
-- Lisbon (28)
(28, 'Alfama Guesthouse', 75, 4.0),
(28, 'Belem Luxury Hotel', 200, 4.6),
-- Prague (29)
(29, 'Old Town Budget Stay', 55, 4.0),
(29, 'Prague Castle Hotel', 170, 4.5),
-- Vienna (30)
(30, 'Vienna Central Inn', 110, 4.1),
(30, 'Schonbrunn Palace Hotel', 280, 4.7),
-- Munich (31)
(31, 'Munich City Hostel', 80, 3.9),
(31, 'Marienplatz Grand', 250, 4.6),
-- Athens (32)
(32, 'Plaka Budget Stay', 60, 3.9),
(32, 'Acropolis View Hotel', 190, 4.5),
-- Dublin (33)
(33, 'Temple Bar Inn', 120, 4.0),
(33, 'St Stephens Green Hotel', 260, 4.6),
-- Edinburgh (34)
(34, 'Royal Mile Hostel', 90, 3.8),
(34, 'Edinburgh Castle Hotel', 230, 4.5),
-- Reykjavik (35)
(35, 'Reykjavik City Hostel', 140, 3.9),
(35, 'Northern Lights Hotel', 320, 4.6),
-- Oslo (36)
(36, 'Oslo Budget Lodge', 130, 3.8),
(36, 'Fjord View Grand Hotel', 300, 4.5),
-- Stockholm (37)
(37, 'Gamla Stan Inn', 110, 4.0),
(37, 'Stockholm Waterfront Hotel', 270, 4.6),
-- Copenhagen (38)
(38, 'Nyhavn Budget Hotel', 120, 4.0),
(38, 'Tivoli Grand Hotel', 290, 4.7),
-- Helsinki (39)
(39, 'Helsinki Central Hostel', 95, 3.9),
(39, 'Senate Square Hotel', 230, 4.5),
-- Warsaw (40)
(40, 'Old Town Warsaw Inn', 50, 4.0),
(40, 'Warsaw Royal Hotel', 140, 4.5),
-- Budapest (41)
(41, 'Buda Castle Hostel', 40, 4.0),
(41, 'Danube Palace Hotel', 150, 4.6),
-- Zurich (42)
(42, 'Zurich Budget Stay', 160, 3.9),
(42, 'Lake Zurich Grand Hotel', 400, 4.7),
-- Kyoto (43)
(43, 'Kyoto Traditional Ryokan', 130, 4.4),
(43, 'Gion Luxury Hotel', 280, 4.8),
-- Mumbai (44)
(44, 'Colaba Budget Inn', 30, 3.8),
(44, 'Taj Mumbai Grand', 180, 4.7),
-- Bali (45)
(45, 'Ubud Budget Villa', 35, 4.1),
(45, 'Seminyak Beach Resort', 150, 4.7),
-- Hanoi (46)
(46, 'Old Quarter Hostel', 20, 3.9),
(46, 'Hoan Kiem Luxury Hotel', 100, 4.5),
-- Kuala Lumpur (47)
(47, 'Bukit Bintang Budget', 40, 3.9),
(47, 'KLCC Tower View Hotel', 130, 4.6),
-- Rio de Janeiro (48)
(48, 'Copacabana Hostel', 45, 3.8),
(48, 'Ipanema Grand Hotel', 200, 4.6),
-- Havana (49)
(49, 'Old Havana Casa', 35, 4.0),
(49, 'Malecon Luxury Hotel', 120, 4.4),
-- Cancun (50)
(50, 'Cancun Downtown Inn', 80, 3.9),
(50, 'Cancun Beach Resort', 250, 4.7);

-- =========================
-- Insert Flights (60 - From Salt Lake City)
-- =========================
INSERT INTO Flight (origin_city, destination_city_id, price, departure_date, return_date)
VALUES
-- June trips
('Salt Lake City', 1, 150, '2025-06-01', '2025-06-04'),
('Salt Lake City', 2, 220, '2025-06-05', '2025-06-08'),
('Salt Lake City', 3, 300, '2025-06-10', '2025-06-13'),
('Salt Lake City', 4, 750, '2025-06-01', '2025-06-04'),
('Salt Lake City', 5, 900, '2025-06-03', '2025-06-06'),
('Salt Lake City', 6, 200, '2025-06-15', '2025-06-18'),
('Salt Lake City', 7, 680, '2025-06-02', '2025-06-05'),
('Salt Lake City', 8, 720, '2025-06-08', '2025-06-11'),
('Salt Lake City', 9, 650, '2025-06-12', '2025-06-15'),
('Salt Lake City', 10, 850, '2025-06-05', '2025-06-08'),
('Salt Lake City', 11, 1100, '2025-06-10', '2025-06-13'),
('Salt Lake City', 12, 950, '2025-06-07', '2025-06-10'),
('Salt Lake City', 13, 780, '2025-06-14', '2025-06-17'),
('Salt Lake City', 14, 870, '2025-06-01', '2025-06-04'),
('Salt Lake City', 15, 620, '2025-06-09', '2025-06-12'),
('Salt Lake City', 16, 680, '2025-06-11', '2025-06-14'),
('Salt Lake City', 17, 180, '2025-06-03', '2025-06-06'),
('Salt Lake City', 18, 200, '2025-06-07', '2025-06-10'),
('Salt Lake City', 19, 280, '2025-06-12', '2025-06-15'),
('Salt Lake City', 20, 310, '2025-06-05', '2025-06-08'),
('Salt Lake City', 21, 950, '2025-06-08', '2025-06-11'),
('Salt Lake City', 22, 880, '2025-06-14', '2025-06-17'),
('Salt Lake City', 23, 700, '2025-06-06', '2025-06-09'),
('Salt Lake City', 24, 650, '2025-06-10', '2025-06-13'),
('Salt Lake City', 25, 820, '2025-06-01', '2025-06-04'),
-- Non-June trips
('Salt Lake City', 1, 170, '2025-07-01', '2025-07-04'),
('Salt Lake City', 4, 720, '2025-05-01', '2025-05-04'),
('Salt Lake City', 2, 190, '2025-07-10', '2025-07-13'),
('Salt Lake City', 3, 280, '2025-08-01', '2025-08-04'),
('Salt Lake City', 5, 850, '2025-07-15', '2025-07-18'),
('Salt Lake City', 7, 640, '2025-08-05', '2025-08-08'),
('Salt Lake City', 8, 690, '2025-07-20', '2025-07-23'),
('Salt Lake City', 9, 600, '2025-09-01', '2025-09-04'),
('Salt Lake City', 10, 780, '2025-08-10', '2025-08-13'),
('Salt Lake City', 11, 1050, '2025-07-05', '2025-07-08'),
('Salt Lake City', 12, 900, '2025-09-15', '2025-09-18'),
('Salt Lake City', 13, 720, '2025-10-01', '2025-10-04'),
('Salt Lake City', 14, 820, '2025-08-20', '2025-08-23'),
('Salt Lake City', 15, 580, '2025-09-05', '2025-09-08'),
('Salt Lake City', 16, 650, '2025-07-25', '2025-07-28'),
('Salt Lake City', 17, 160, '2025-08-01', '2025-08-04'),
('Salt Lake City', 18, 180, '2025-09-10', '2025-09-13'),
('Salt Lake City', 19, 250, '2025-10-05', '2025-10-08'),
('Salt Lake City', 20, 290, '2025-07-12', '2025-07-15'),
('Salt Lake City', 21, 900, '2025-08-15', '2025-08-18'),
('Salt Lake City', 22, 830, '2025-09-20', '2025-09-23'),
('Salt Lake City', 23, 660, '2025-10-10', '2025-10-13'),
('Salt Lake City', 24, 600, '2025-07-08', '2025-07-11'),
('Salt Lake City', 25, 780, '2025-08-25', '2025-08-28'),
('Salt Lake City', 26, 700, '2025-06-20', '2025-06-23'),
('Salt Lake City', 27, 1200, '2025-07-01', '2025-07-04'),
('Salt Lake City', 28, 650, '2025-06-25', '2025-06-28'),
('Salt Lake City', 29, 620, '2025-08-01', '2025-08-04'),
('Salt Lake City', 30, 680, '2025-09-01', '2025-09-04'),
('Salt Lake City', 31, 660, '2025-10-01', '2025-10-04'),
('Salt Lake City', 32, 740, '2025-06-18', '2025-06-21'),
('Salt Lake City', 43, 920, '2025-06-22', '2025-06-25'),
('Salt Lake City', 44, 860, '2025-07-10', '2025-07-13'),
('Salt Lake City', 45, 950, '2025-08-05', '2025-08-08'),
('Salt Lake City', 48, 720, '2025-09-12', '2025-09-15');

-- =========================
-- Insert Attractions (100)
-- =========================
INSERT INTO Attraction (city_id, name, category, price)
VALUES
-- Denver (1)
(1, 'Rocky Mountain National Park Tour', 'Nature', 50),
(1, 'Denver Art Museum', 'Museum', 25),
(1, 'Red Rocks Amphitheatre Tour', 'Entertainment', 30),
(1, 'Denver Zoo', 'Nature', 22),
-- Los Angeles (2)
(2, 'Universal Studios', 'Theme Park', 120),
(2, 'Hollywood Walk Tour', 'Tour', 35),
(2, 'Getty Center', 'Museum', 0),
(2, 'Santa Monica Pier', 'Entertainment', 15),
-- New York (3)
(3, 'Statue of Liberty', 'Landmark', 30),
(3, 'Metropolitan Museum of Art', 'Museum', 25),
(3, 'Central Park Bike Tour', 'Nature', 40),
(3, 'Broadway Show', 'Entertainment', 150),
-- Paris (4)
(4, 'Eiffel Tower Tour', 'Landmark', 40),
(4, 'Louvre Museum', 'Museum', 35),
(4, 'Seine River Cruise', 'Tour', 25),
(4, 'Versailles Day Trip', 'Historical', 50),
-- Tokyo (5)
(5, 'Tokyo Skytree', 'Landmark', 30),
(5, 'Meiji Shrine Tour', 'Cultural', 20),
(5, 'Tsukiji Fish Market Tour', 'Food', 45),
(5, 'Akihabara Electronics Tour', 'Shopping', 10),
-- Mexico City (6)
(6, 'Teotihuacan Pyramids', 'Historical', 45),
(6, 'Frida Kahlo Museum', 'Museum', 15),
(6, 'Xochimilco Floating Gardens', 'Nature', 25),
(6, 'Lucha Libre Wrestling Show', 'Entertainment', 20),
-- London (7)
(7, 'Tower of London', 'Historical', 35),
(7, 'British Museum', 'Museum', 0),
(7, 'London Eye', 'Landmark', 30),
(7, 'West End Theatre Show', 'Entertainment', 80),
-- Rome (8)
(8, 'Colosseum Tour', 'Historical', 40),
(8, 'Vatican Museums', 'Museum', 35),
(8, 'Trevi Fountain Walking Tour', 'Tour', 15),
(8, 'Roman Forum', 'Historical', 25),
-- Barcelona (9)
(9, 'Sagrada Familia', 'Landmark', 30),
(9, 'Park Guell', 'Nature', 15),
(9, 'La Boqueria Market Tour', 'Food', 20),
(9, 'Gothic Quarter Walking Tour', 'Tour', 25),
-- Bangkok (10)
(10, 'Grand Palace', 'Historical', 15),
(10, 'Wat Pho Temple', 'Cultural', 8),
(10, 'Floating Market Tour', 'Tour', 20),
(10, 'Thai Cooking Class', 'Food', 35),
-- Sydney (11)
(11, 'Sydney Opera House Tour', 'Landmark', 40),
(11, 'Bondi to Coogee Walk', 'Nature', 0),
(11, 'Taronga Zoo', 'Nature', 45),
(11, 'Sydney Harbour Bridge Climb', 'Adventure', 150),
-- Dubai (12)
(12, 'Burj Khalifa Observation', 'Landmark', 50),
(12, 'Desert Safari', 'Adventure', 80),
(12, 'Dubai Mall Aquarium', 'Entertainment', 35),
(12, 'Gold Souk Tour', 'Shopping', 0),
-- Istanbul (13)
(13, 'Hagia Sophia', 'Historical', 20),
(13, 'Grand Bazaar Tour', 'Shopping', 0),
(13, 'Bosphorus Cruise', 'Tour', 25),
(13, 'Topkapi Palace', 'Historical', 18),
-- Seoul (14)
(14, 'Gyeongbokgung Palace', 'Historical', 8),
(14, 'Bukchon Hanok Village', 'Cultural', 0),
(14, 'Myeongdong Street Food Tour', 'Food', 30),
(14, 'DMZ Tour', 'Historical', 65),
-- Berlin (15)
(15, 'Brandenburg Gate Tour', 'Landmark', 0),
(15, 'Berlin Wall Memorial', 'Historical', 0),
(15, 'Museum Island Pass', 'Museum', 22),
(15, 'Reichstag Building Tour', 'Historical', 0),
-- Amsterdam (16)
(16, 'Anne Frank House', 'Historical', 16),
(16, 'Van Gogh Museum', 'Museum', 20),
(16, 'Canal Cruise', 'Tour', 18),
(16, 'Rijksmuseum', 'Museum', 22),
-- San Francisco (17)
(17, 'Alcatraz Island Tour', 'Historical', 45),
(17, 'Golden Gate Bridge Walk', 'Landmark', 0),
(17, 'Fishermans Wharf Tour', 'Tour', 20),
(17, 'Cable Car Ride', 'Tour', 8),
-- Chicago (18)
(18, 'Art Institute of Chicago', 'Museum', 25),
(18, 'Millennium Park', 'Landmark', 0),
(18, 'Architecture River Cruise', 'Tour', 45),
(18, 'Willis Tower Skydeck', 'Landmark', 28),
-- Toronto (19)
(19, 'CN Tower', 'Landmark', 40),
(19, 'Royal Ontario Museum', 'Museum', 20),
-- Vancouver (20)
(20, 'Stanley Park Seawall', 'Nature', 0),
(20, 'Capilano Suspension Bridge', 'Nature', 55),
-- Singapore (21)
(21, 'Gardens by the Bay', 'Nature', 28),
(21, 'Sentosa Island', 'Entertainment', 40),
-- Hong Kong (22)
(22, 'Victoria Peak Tram', 'Landmark', 12),
(22, 'Big Buddha Lantau Island', 'Cultural', 0),
-- Buenos Aires (23)
(23, 'La Boca Tango Show', 'Entertainment', 30),
(23, 'Recoleta Cemetery Tour', 'Historical', 0),
-- Lima (24)
(24, 'Machu Picchu Day Trip', 'Historical', 120),
(24, 'Lima Food Tour', 'Food', 45),
-- Cairo (25)
(25, 'Pyramids of Giza', 'Historical', 20),
(25, 'Egyptian Museum', 'Museum', 12),
-- Marrakech (26)
(26, 'Jemaa el-Fnaa Tour', 'Cultural', 0),
(26, 'Majorelle Garden', 'Nature', 10),
-- Cape Town (27)
(27, 'Table Mountain Cable Car', 'Nature', 25),
(27, 'Robben Island Tour', 'Historical', 35),
-- Lisbon (28)
(28, 'Belem Tower', 'Historical', 10),
(28, 'Alfama Tram Ride', 'Tour', 5),
-- Prague (29)
(29, 'Prague Castle', 'Historical', 15),
(29, 'Charles Bridge Walk', 'Landmark', 0),
-- Vienna (30)
(30, 'Schonbrunn Palace', 'Historical', 22),
(30, 'Vienna State Opera', 'Entertainment', 60),
-- Kyoto (43)
(43, 'Fushimi Inari Shrine', 'Cultural', 0),
(43, 'Bamboo Grove Walk', 'Nature', 0),
(43, 'Kinkaku-ji Golden Pavilion', 'Cultural', 8),
(43, 'Traditional Tea Ceremony', 'Cultural', 35);

-- =========================
-- Insert TripOption (50)
-- =========================
INSERT INTO TripOption (city_id, duration_days, recommended_hotel_id, estimated_attraction_budget)
VALUES
-- 3-day options
(1, 3, 1, 100),
(2, 3, 3, 150),
(3, 3, 5, 120),
(4, 3, 7, 150),
(5, 3, 9, 120),
(6, 3, 11, 90),
(7, 3, 13, 130),
(8, 3, 15, 110),
(9, 3, 17, 100),
(10, 3, 19, 60),
(11, 3, 21, 130),
(12, 3, 23, 140),
(13, 3, 25, 70),
(14, 3, 27, 80),
(15, 3, 29, 50),
(16, 3, 31, 90),
(17, 3, 33, 100),
(18, 3, 35, 80),
(19, 3, 37, 80),
(20, 3, 39, 70),
(21, 3, 41, 90),
(22, 3, 43, 60),
(23, 3, 45, 50),
(24, 3, 47, 70),
(25, 3, 49, 50),
-- 5-day options
(1, 5, 2, 180),
(2, 5, 4, 250),
(3, 5, 6, 200),
(4, 5, 8, 220),
(5, 5, 10, 200),
(6, 5, 12, 150),
(7, 5, 14, 210),
(8, 5, 16, 180),
(9, 5, 18, 160),
(10, 5, 20, 100),
(11, 5, 22, 220),
(12, 5, 24, 230),
(13, 5, 26, 120),
(14, 5, 28, 140),
(15, 5, 30, 80),
(16, 5, 32, 150),
(17, 5, 34, 170),
(18, 5, 36, 140),
(19, 5, 38, 130),
(20, 5, 40, 120),
(21, 5, 42, 150),
(22, 5, 44, 100),
(23, 5, 46, 80),
(24, 5, 48, 120),
(25, 5, 50, 80);