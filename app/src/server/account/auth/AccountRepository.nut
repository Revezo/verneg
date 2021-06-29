AccountRepository <- {
    
    function findPlayer(serverId, playerName) {
        local connection = Mysql.connection()
        local player = find(connection, serverId, playerName)
        Mysql.close(connection)
        return player
    }

    function registerPlayer(serverId, playerName) {
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
                print("CharacterId >dbId|serverId|name:" + row_assoc["id"] + "|" + serverId + "|" + row_assoc["name"])
                local characterId = CharacterId(row_assoc["id"], serverId, row_assoc["name"])
                return Player(characterId)
            } else {
                return null
            }
        } else {
            print(mysql_error(connection))
            print("Error ID: " + mysql_errno(connection))
            return null
        }
    }

    function save(connection, serverId, playerName) {
        local result = mysql_query(connection, savePlayerQuery(playerName))
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

    function savePlayerQuery(playerName) {
        return format("INSERT INTO characters(`name`, `uuid`) VALUES ('%s', UUID())", playerName)
    }
}