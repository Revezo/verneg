CREATE TABLE characters (
    id INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `uuid` VARCHAR(50) NOT NULL,
    PRIMARY KEY(id),
    UNIQUE(`name`),
    UNIQUE(`uuid`)
);

CREATE TABLE characters_positions (
    id INT NOT NULL AUTO_INCREMENT,
    character_id INT NOT NULL,
    pos_x BIGINT NOT NULL,
    pos_y BIGINT NOT NULL,
    pos_z BIGINT NOT NULL,
    angle INT NOT NULL,
    PRIMARY KEY(id),
    UNIQUE(character_id)
);
