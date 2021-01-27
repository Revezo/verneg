DROP TABLE IF EXISTS users_characters;
DROP TABLE IF EXISTS characters_positions;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS characters;

CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `uuid` VARCHAR(50) NOT NULL,
    PRIMARY KEY(id),
    UNIQUE(`name`),
    UNIQUE(`uuid`)
);

CREATE TABLE characters (
    id INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `uuid` VARCHAR(50) NOT NULL,
    PRIMARY KEY(id),
    UNIQUE(`name`),
    UNIQUE(`uuid`)
);

CREATE TABLE users_characters (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    character_id INT NOT NULL,
    PRIMARY KEY(id),
    UNIQUE(user_id, character_id)
);

CREATE TABLE characters_positions (
    id INT NOT NULL AUTO_INCREMENT,
    character_id INT NOT NULL,
    pos_x FLOAT NOT NULL,
    pos_y FLOAT NOT NULL,
    pos_z FLOAT NOT NULL,
    PRIMARY KEY(id),
    UNIQUE(character_id)
);

INSERT INTO characters(id, name, uuid) VALUES (1, "reveso", UUID());
INSERT INTO characters(id, name, uuid) VALUES (2, "user", UUID());
INSERT INTO characters_positions(character_id, pos_x, pos_y, pos_z) VALUES (1, 100, 0, 0);
INSERT INTO characters_positions(character_id, pos_x, pos_y, pos_z) VALUES (2, 200, 0, 50);