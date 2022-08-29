CREATE TABLE
  IF NOT EXISTS zone (id integer PRIMARY KEY, zoneName text NOT NULL);

CREATE TABLE
  IF NOT EXISTS suit (id INTEGER PRIMARY KEY, suitName TEXT NOT NULL);

CREATE TABLE
  IF NOT EXISTS card (
    id INTEGER PRIMARY KEY,
    cardRank INTEGER NOT NULL,
    suitId INTEGER NOT NULL,
    FOREIGN KEY (suitId) REFERENCES suit (id)
  );

CREATE TABLE
  IF NOT EXISTS game_state (
    id INTEGER PRIMARY KEY,
    cardId INTEGER NOT NULL,
    zoneId INTEGER NOT NULL,
    FOREIGN KEY (cardId) REFERENCES card (id),
    FOREIGN KEY (zoneId) REFERENCES zone (id)
  );

INSERT INTO
  suit (suitName)
VALUES
  ('club');

INSERT INTO
  suit (suitName)
VALUES
  ('diamond');

INSERT INTO
  suit (suitName)
VALUES
  ('heart');

INSERT INTO
  suit (suitName)
VALUES
  ('spade');

INSERT INTO
  zone (zoneName)
VALUES
  ('talon');

INSERT INTO
  zone (zoneName)
VALUES
  ('foundation');

INSERT INTO
  zone (zoneName)
VALUES
  ('foundation');

INSERT INTO
  zone (zoneName)
VALUES
  ('foundation');

INSERT INTO
  zone (zoneName)
VALUES
  ('foundation');

INSERT INTO
  zone (zoneName)
VALUES
  ('tableu');

INSERT INTO
  zone (zoneName)
VALUES
  ('tableu');

INSERT INTO
  zone (zoneName)
VALUES
  ('tableu');

INSERT INTO
  zone (zoneName)
VALUES
  ('tableu');

INSERT INTO
  card (cardRank, suitId)
VALUES
  (1, 1);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (2, 1);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (3, 1);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (4, 1);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (5, 1);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (6, 1);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (7, 1);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (8, 1);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (9, 1);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (10, 1);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (11, 1);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (12, 1);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (13, 1);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (1, 2);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (2, 2);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (3, 2);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (4, 2);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (5, 2);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (6, 2);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (7, 2);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (8, 2);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (9, 2);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (10, 2);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (11, 2);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (12, 2);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (13, 2);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (1, 3);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (2, 3);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (3, 3);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (4, 3);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (5, 3);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (6, 3);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (7, 3);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (8, 3);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (9, 3);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (10, 3);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (11, 3);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (12, 3);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (13, 3);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (1, 4);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (2, 4);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (3, 4);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (4, 4);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (5, 4);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (6, 4);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (7, 4);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (8, 4);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (9, 4);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (10, 4);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (11, 4);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (12, 4);

INSERT INTO
  card (cardRank, suitId)
VALUES
  (13, 4);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (1, 1);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (2, 1);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (3, 1);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (4, 3);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (5, 4);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (6, 5);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (3, 2);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (7, 2);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (8, 2);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (9, 2);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (10, 2);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (11, 2);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (12, 2);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (13, 2);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (14, 2);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (15, 3);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (16, 3);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (17, 3);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (18, 3);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (19, 3);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (20, 3);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (21, 3);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (22, 3);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (23, 4);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (24, 4);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (25, 5);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (26, 5);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (27, 5);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (28, 6);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (29, 6);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (30, 7);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (31, 7);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (32, 8);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (33, 8);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (34, 8);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (35, 8);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (36, 8);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (37, 8);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (38, 8);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (39, 8);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (40, 8);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (41, 8);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (42, 8);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (43, 8);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (44, 8);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (45, 8);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (46, 8);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (47, 8);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (48, 8);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (49, 8);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (50, 8);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (51, 8);

INSERT INTO
  game_state (cardId, zoneId)
VALUES
  (52, 8);
