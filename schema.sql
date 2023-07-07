CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  genre VARCHAR(255),
  author VARCHAR(255),
  source VARCHAR(255),
  label_id VARCHAR(255),
  publish_date INTEGER,
  archived BOOLEAN
);

CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  genre VARCHAR(255),
  author VARCHAR(255),
  source VARCHAR(255),
  label_id VARCHAR(255),
  publish_date VARCHAR(255),
  archived VARCHAR(255),
  publisher VARCHAR(255),
  cover_state VARCHAR(255),
);

CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  color VARCHAR(255),
);

-- Create the music_albums table
CREATE TABLE music_albums (
    id SERIAL PRIMARY KEY,
    publish_date DATE NOT NULL,
    on_spotify BOOLEAN DEFAULT FALSE,
    archived BOOLEAN DEFAULT FALSE,
    genre_id INT REFERENCES genres(id),
    author_id INT REFERENCES authors(id),
    label_id INT REFERENCES labels(id)
)
;

-- Create the genres table
CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
