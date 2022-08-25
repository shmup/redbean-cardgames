CREATE TABLE IF NOT EXISTS suit (
        suitId INTEGER PRIMARY KEY,
        suitName TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS card (
        cardId INTEGER PRIMARY KEY,
        suitId INTEGER NOT NULL,
        cardRank INTEGER NOT NULL,
        FOREIGN KEY(suitId) REFERENCES suit(suitId)
);

CREATE TABLE IF NOT EXISTS zone (
        zoneid integer PRIMARY KEY,
        zoneName text NOT NULL
);

CREATE TABLE IF NOT EXISTS game (
        gameId INTEGER PRIMARY KEY,
        cardId INTEGER NOT NULL,
        zoneId INTEGER NOT NULL,
        FOREIGN KEY(cardId) REFERENCES card(cardId),
        FOREIGN KEY(zoneId) REFERENCES zone(zoneId)
);

INSERT INTO suit(suitName) VALUES('club');
INSERT INTO suit(suitName) VALUES('diamond');
INSERT INTO suit(suitName) VALUES('heart');
INSERT INTO suit(suitName) VALUES('spade');

INSERT INTO card(suitId, cardRank) VALUES(15, 1);
