DROP DATABASE soccer_league_db;

CREATE DATABASE soccer_league_db;

\c soccer_league_db;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    city TEXT UNIQUE NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    current_team INT REFERENCES teams
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT[] UNIQUE NOT NULL
);

CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    home_team INT REFERENCES teams NOT NULL,
    away_team INT REFERENCES teams NOT NULL,
    location TEXT NOT NULL,
    match_date DATE NOT NULL,
    season_id INT REFERENCES season NOT NULL,
    head_ref_id INT REFERENCES referees NOT NULL,
    asst_ref_id INT REFERENCES referees
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INT REFERENCES players,
    match_id INT REFERENCES matches
);

CREATE TABLE results (
    id SERIAL PRIMARY KEY,
    team_id INT REFERENCES teams,
    match_id INT REFERENCES matches
);

INSERT INTO teams (name, city)
    VALUES
    ('Atlanta United', 'Atlanta, GA'),
    ('FC Dallas', 'Dallas, TX'),
    ('Nashville SC', 'Nashville, TN'),
    ('New York Red Bulls', 'New York City, NY'),
    ('Orlando City', 'Orlando, FL'),
    ('Philadelphia Union', 'Philadelphia, PA'),
    ('Real Salt Lake', 'Salt Lake City, UT'),
    ('Seattle Sounders FC', 'Seattle, WA');

INSERT INTO players (name, current_team)
    VALUES
    ('Josef Martinez', 1),
    ('Jesus Ferreira', 2),
    ('Hany Mukhtar', 3),
    ('Patryk Kilmala', 4),
    ('Pedro Gallese', 5),
    ('Jack McGlynn', 6),
    ('David Ochoa', 7),
    ('Raul Ruidiaz', 8);

INSERT INTO referees (name)
    VALUES
    ('{"Alan Kelly"}'),
    ('{"Allen Chapman"}'),
    ('{"Frank Anderson", "Joe Fletcher"}'),
    ('{"Adam Wienckowski", "Jeremy Hanson"}'),
    ('{"Ian Anderson", "Eric Weisbrod"}'),
    ('{"Brian Dunn", "Corey Rockwell"}');

INSERT INTO season (start_date, end_date)
    VALUES
    ('2016-03-06', '2016-12-10'),
    ('2017-03-03', '2017-12-09'),
    ('2018-03-03', '2018-12-08'),
    ('2019-03-02', '2019-10-06');

INSERT INTO matches (home_team, away_team, location, match_date, season_id, head_ref_id, asst_ref_id)
    VALUES
    (1, 8, 'Seattle, WA', '2016-05-13', 1, 1, 3),
    (3, 2, 'Nashville, TN', '2017-03-20', 2, 2, 4),
    (5, 6, 'Orlando, FL', '2018-05-25', 3, 1, 5),
    (3, 7, 'Salt Lake City, UT', '2019-08-30', 4, 2, 6);

INSERT INTO goals (player_id, match_id)
    VALUES
    (8, 1),
    (3, 2),
    (5, 3),
    (7, 4);

INSERT INTO results (team_id, match_id)
    VALUES
    (1, 1),
    (2, 2),
    (6, 3),
    (3, 4);
