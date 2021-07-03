ItemRepository <- {
    CHARACTER_ID_COLUMN = "character_id",
    STORAGE_ID_COLUMN = "storage_id",
    GROUND_ID_COLUMN = "ground_id",

    function findAllPlayerItems(ownerId) {
        print("ItemRepository.findAllPlayerItems, "+ ownerId.tostring())
        local connection = Mysql.connection()
        local items = queryAllPlayerItems(connection, ownerId)
        Mysql.close(connection)
        print("ItemRepository.findAllPlayerItems items retrieved, " + ownerId.tostring() + " ,items=" + ArrayUtils.printArray(items))
        return items
    }

    function create(item) {
        local connection = Mysql.connection()
        local saveSuccessful = executeCreateQuery(connection, item)
        Mysql.close(connection)
        return saveSuccessful
    }

    // private
    function queryAllPlayerItems(connection, ownerId) {
        print("ItemRepository.queryAllPlayerItems, " + ownerId.tostring())
        local queryResult = mysql_query(connection, findAllPlayerItemsQuery(ownerId.value))

        if (queryResult) {
            print("ItemRepository.queryAllPlayerItems, query done. Result rows count: " + mysql_num_rows(queryResult));
            local items = fetchAllItems([], queryResult, ownerId)
            mysql_free_result(queryResult);
            return items
        }
        else {
            print(mysql_error(connection))
            print("Error ID: " + mysql_errno(connection))
            return null
        }
    }

    function fetchAllItems(acc, resultHandler, ownerId) {
        local row = mysql_fetch_assoc(resultHandler);
        if (!row) {
            return acc
        } else {
            local item = Item(row["instance"], row["amount"], ownerId);
            print("ItemRepository.fetchAllItems fetched " + item.tostring());
            acc.push(item);
            return fetchAllItems(acc, resultHandler, ownerId);
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

    function findAllPlayerItemsQuery(characterId) {
        return format("SELECT `instance`, `amount` FROM items WHERE character_id = %d", characterId)
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