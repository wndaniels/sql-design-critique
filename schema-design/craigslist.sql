DROP DATABASE craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db;

CREATE TABLE region (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(15) UNIQUE NOT NULL,
    password VARCHAR(20) UNIQUE NOT NULL,
    perferred_reg INT REFERENCES region
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    content TEXT,
    user_id INT REFERENCES users NOT NULL,
    reg_id INT REFERENCES region NOT NULL,
    cat_id INT REFERENCES categories NOT NULL
);


INSERT INTO region (name)
    VALUES
    ('US'),
    ('Canada'),
    ('Europe'),
    ('Asia/Pacific/Middle East'),
    ('Oceania'),
    ('Latin America'),
    ('Africa');

INSERT INTO categories (name)
    VALUES
    ('Community'),
    ('Services'),
    ('Discussion Forums'),
    ('Housing'),
    ('For Sale'),
    ('Jobs'),
    ('Gigs'),
    ('Resumes');

INSERT INTO users (username, password, perferred_reg)
    VALUES
    ('clrblnd', 'yupp1234', 1),
    ('afraidtoforget', '1234yuppP', 4),
    ('fromwherewevan', 'WEownTHisHOUSe', 6);

INSERT INTO posts (title, content, user_id, reg_id, cat_id)
    VALUES
    ('Hello World', 'DO YOU LIKE TO CODE?', 1, 1, 6),
    ('1984 Volkswagen Westfalia', 'Check out this killer van!', 3, 3, 5);