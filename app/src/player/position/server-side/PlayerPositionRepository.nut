PlayerPositionRepository <- {

    function lastPosition(playerName) {
        local connection = Mysql.connection()
        local playerPosition = extractPosition(connection, playerName)
        Mysql.close(connection)
        return playerPosition;
    }

    function saveLastPosition(playerName, position) {
        local connection = Mysql.connection()
        local playerPosition = savePosition(connection, playerName, position)
        Mysql.close(connection)
        return playerPosition;
    }

    // private
    function extractPosition(connection, playerName) {
        local result = mysql_query(connection, lastPositionQuery(playerName))
        if (result) {
            local row_assoc = mysql_fetch_assoc(result)
            mysql_free_result(result)

            if (row_assoc) {
                return Position(row_assoc["pos_x"], row_assoc["pos_y"], row_assoc["pos_z"], row_assoc["angle"])
            } else {
                return Position(0, 0, 0, 0)
            }
        } else {
            print(mysql_error(connection))
            print("Error ID: " + mysql_errno(connection))
            return Position(0, 0, 0, 0)
        }
    }

    function savePosition(connection, playerName, position) {
        local result = mysql_query(connection, saveLastPositionQuery(playerName, position))
        local mysqlErrorId = mysql_errno(connection)
        if (mysqlErrorId != 0) {
            print(mysql_error(connection))
            print("Error ID: " + mysql_errno(connection))
        }
    }

    function lastPositionQuery(playerName) {
        return format("SELECT * FROM characters_positions pos JOIN characters ch ON ch.id = pos.character_id WHERE ch.`name` = '%s'", playerName)
    }

    function saveLastPositionQuery(playerName, position) {
        return format("INSERT INTO characters_positions(character_id, pos_x, pos_y, pos_z, angle) " +
        "SELECT id, %d, %d, %d, %d FROM characters WHERE `name`='%s' LIMIT 1 ", position.x, position.y, position.z, position.angle, playerName) +
        format("ON DUPLICATE KEY UPDATE pos_x=%d, pos_y=%d, pos_z=%d, angle=%d", position.x, position.y, position.z, position.angle)
    }
}