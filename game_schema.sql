CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  author VARCHAR(255),
  publish_date DATE,
  archived BOOLEAN
);

CREATE TABLE game(
    id SERIAL PRIMARY KEY,
    multiplayer BOOLEAN,
    last_played_at DATE
);