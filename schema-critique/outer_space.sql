-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

-- CREATE TABLE planets
-- (
--   id SERIAL PRIMARY KEY,
--   name TEXT NOT NULL,
--   orbital_period_in_years FLOAT NOT NULL,
--   orbits_around TEXT NOT NULL,
--   galaxy TEXT NOT NULL,
--   moons TEXT[]
-- );

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');

CREATE TABLE planets (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE galaxy (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name TEXT[] NOT NULL
);

CREATE TABLE orbital_point (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE orbit (
  id SERIAL PRIMARY KEY,
  planet_id INT REFERENCES planets,
  orbital_years FLOAT NOT NULL,
  orbits_around INT REFERENCES orbital_point,
  galaxy_id INT REFERENCES galaxy,
  moon_id INT REFERENCES moons
);

INSERT INTO planets (name)
  VALUES
  ('Earth'),
  ('Mars'),
  ('Venus'),
  ('Neptune'),
  ('Proxima Centauri b'),
  ('Gliese 876 b');

INSERT INTO galaxy (name)
  VALUES
  ('Milky Way');

INSERT INTO moons (name)
  VALUES
  ('{"The Moon"}'),
  ('{"Phobos", "Deimos"}'),
  ('{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}');

INSERT INTO orbital_point (name)
  VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');

INSERT INTO orbit (planet_id, orbital_years, orbits_around, galaxy_id, moon_id)
  VALUES
  (1, 1.00, 1, 1, 1),
  (2, 1.88, 1, 1, 2),
  (3, 0.62, 1, 1, NULL),
  (4, 164.8, 1, 1, 3),
  (5, 0.03, 2, 1, NULL),
  (6, 0.23, 3, 1, NULL);
