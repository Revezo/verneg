CREATE TABLE items (
    id INT NOT NULL AUTO_INCREMENT,
    instance VARCHAR(255) NOT NULL,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    amount INT,
    character_id INT,
    storage_id INT,
    ground_id INT,
    x FLOAT,
    y FLOAT,
    z FLOAT,
    PRIMARY KEY(id),
    INDEX(`instance`),
    FOREIGN KEY (character_id) REFERENCES characters(id) 
);
