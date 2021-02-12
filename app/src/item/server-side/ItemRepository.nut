ItemRepository <- {
    CHARACTER_ID_COLUMN = "character_id",
    STORAGE_ID_COLUMN = "storage_id",
    GROUND_ID_COLUMN = "ground_id",

    function find(itemInstance, playerName) {
        local connection = Mysql.connection()
        local player = find(connection, serverId, playerName)
        Mysql.close(connection)
        return player
    }

    function create(item) {
        local connection = Mysql.connection()
        local saveSuccessful = executeCreateQuery(connection, item)
        Mysql.close(connection)
        return saveSuccessful
    }

    function moveItem(item) {
        local connection = Mysql.connection()
        local saveSuccessful = save(connection, serverId, playerName)
        if (!saveSuccessful) {
            Mysql.close(connection)
            return false    
        }
        return findPlayer(serverId, playerName)
    }

    // private
    function find(connection, serverId, playerName) {
        local result = mysql_query(connection, findPlayerQuery(playerName))
        if (result) {
            local row_assoc = mysql_fetch_assoc(result)
            mysql_free_result(result)

            if (row_assoc) {
                print("row_assoc: " + row_assoc["id"] + "|" + row_assoc["name"])
                return Player(serverId, row_assoc["id"], row_assoc["name"])
            } else {
                return null
            }
        } else {
            print(mysql_error(connection))
            print("Error ID: " + mysql_errno(connection))
            return null
        }
    }

    function executeCreateQuery(connection, item) {
        local result = mysql_query(connection, createItemQuery(item))
        local mysqlErrorId = mysql_errno(connection)
        if (mysqlErrorId != 0) {
            print(mysql_error(connection))
            print("Error ID: " + mysql_errno(connection))
            return false
        }
        return true
    }

    function findPlayerQuery(playerName) {
        return format("SELECT * FROM characters where `name` = '%s'", playerName)
    }

    function createItemQuery(item) {
        return format("INSERT INTO items(`instance`, `amount`, `%s`) VALUES ('%s', '%d', '%d')", determinePlaceId(item.placeId), item.instance, item.amount, item.placeId.value)
    }
    
    function determinePlaceId(placeId) {
        if (placeId instanceof OwnerId) {
            return CHARACTER_ID_COLUMN
        } else if (placeId instanceof StorageId) {
            return STORAGE_ID_COLUMN
        } else if (placeId instanceof GroundId) {
            return GROUND_ID_COLUMN
        }
    }
}