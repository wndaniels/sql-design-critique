-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

-- CREATE TABLE songs
-- (
--   id SERIAL PRIMARY KEY,
--   title TEXT NOT NULL,
--   duration_in_seconds INTEGER NOT NULL,
--   release_date DATE NOT NULL,
--   artists TEXT[] NOT NULL,
--   album TEXT NOT NULL,
--   producers TEXT[] NOT NULL
-- );

-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name TEXT[] NOT NULL
);

CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  name TEXT[] NOT NULL
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  artist_id INT REFERENCES artists,
  release_date DATE NOT NULL
);

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  artist_id INT REFERENCES artists NOT NULL,
  album_id INT REFERENCES albums,
  producer_id INT REFERENCES producers
);

INSERT INTO artists (name)
  VALUES
  ('{"Hanson"}'),
  ('{"Queen"}'),
  ('{"Mariah Cary", "Boyz II Men"}'),
  ('{"Lady Gaga", "Bradley Cooper"}'),
  ('{"Nickelback"}'),
  ('{"Jay Z", "Alicia Keys"}'),
  ('{"Katy Perry", "Juicy J"}'),
  ('{"Maroon 5", "Christina Aguilera"}'),
  ('{"Avril Lavigne"}'),
  ('{"Destiny''s Child"}'),
  ('{"Various Artists"}');

INSERT INTO producers (name)
  VALUES
  ('{"Dust Borthers", "Stephen Lironi"}'),
  ('{"Roy Thomas Baker"}'),
  ('{"Walter Afanasieff"}'),
  ('{"Benjamin Rice"}'),
  ('{"Rick Parashar"}'),
  ('{"Al Shux"}'),
  ('{"Max Martin", "Cirkut"}'),
  ('{"Shellback", "Benny Blanco"}'),
  ('{"The Matrix"}'),
  ('{"Darkchild"}');

INSERT INTO albums (name, artist_id, release_date)
  VALUES
  ('Middle of Nowhere', 1, '1997-04-15'),
  ('A Night at the Opera', 2, '1975-10-31'),
  ('Daydream', 3, '1995-11-14'),
  ('A Star Is Born', 11,'2018-09-27'),
  ('Silver Side Up', 5, '2001-08-21'),
  ('The Blueprint 3', 6, '2009-10-20'),
  ('Prism', 7, '2013-12-17'),
  ('Hands All Over', 8, '2011-06-21'),
  ('Let Go', 9, '2002-05-14'),
  ('The Writing''s on the Wall', 10, '1999-11-07');

INSERT INTO songs (title, duration_in_seconds, artist_id, album_id, producer_id)
  VALUES
  ('MMMBop', 238, 1, 1, 1),
  ('Bohemian Rhapsody', 355, 2, 2, 2),
  ('One Sweet Day', 282, 3, 3, 3),
  ('Shallow', 216, 4, 4, 4),
  ('How You Remind Me', 223, 5, 5, 5),
  ('New York State of Mind', 276, 6, 6, 6),
  ('Dark Horse', 215, 7, 7, 7),
  ('Moves Like Jagger', 201, 8, 8, 8),
  ('Complicated', 244, 9, 9, 9),
  ('Say My Name', 240, 10, 10, 10);
