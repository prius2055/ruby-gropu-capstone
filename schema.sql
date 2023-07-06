CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  genre VARCHAR(255),
  author VARCHAR(255),
  source VARCHAR(255),
  label_id VARCHAR(255),
  publish_date INTEGER,
  archived BOOLEAN
);