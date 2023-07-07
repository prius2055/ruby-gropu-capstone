CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  author VARCHAR(255),
  publish_date DATE,
  archived BOOLEAN
);

