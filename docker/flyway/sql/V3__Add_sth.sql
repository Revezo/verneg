CREATE TABLE items (
    id INT NOT NULL AUTO_INCREMENT,
    `game_id` VARCHAR(255) NOT NULL,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `uuid` VARCHAR(50) NOT NULL UNIQUE, 
    `storage_type` VARCHAR(50) NOT NULL,
    PRIMARY KEY(id),
    INDEX(`game_id`),
    UNIQUE(`uuid`)
);

CREATE TABLE characters_items (
    id INT NOT NULL AUTO_INCREMENT,
    item_id INT NOT NULL UNIQUE,
    character_id INT,
    storage_id INT,
    pos_x INT,
    pos_y INT,
    pos_z INT,
    PRIMARY KEY(id),
    FOREIGN KEY (item_id) REFERENCES items(id)
);
