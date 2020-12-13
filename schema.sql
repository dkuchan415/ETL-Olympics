CREATE TABLE games (
	id INT PRIMARY KEY,
	Year INT,
	City TEXT,
	Season TEXT
);

CREATE TABLE events (
	id INT PRIMARY KEY,
	Sport TEXT,
	Event TEXT,
	Season TEXT
);

CREATE TABLE athlete_info (
	ID INT PRIMARY KEY,
	Name TEXT,
	Sex TEXT
);

CREATE TABLE athlete_event (
	ID INT,
	FOREIGN KEY (ID) REFERENCES athlete_info(ID),
	Age INT,
	Height INT,
	Weight FLOAT,
	NOC TEXT,
	Event TEXT,
	games_id INT,
	FOREIGN KEY (games_id) REFERENCES games(id),
	Medal TEXT
);

CREATE TABLE country (
	country_code TEXT PRIMARY KEY,
	region TEXT,
	country_name TEXT,
	noc_code TEXT,
	team TEXT,	
	income TEXT
);

CREATE TABLE population (
	population_id INT,
	country_code TEXT,
	pop_year INT,
	population INT
);








