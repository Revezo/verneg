function findOne() {
    print("FIND ONE")
    local handler = mysql_connect("mysql", "verneg", "verneg", "verneg_db");
    print(handler)
    if (handler) {
        print("handler set")
        local result = mysql_query(handler, "SELECT * FROM characters");

        if (result) {
            print("Query done " + mysql_num_rows(result));
            local row = mysql_fetch_row(result);
            if (row) {
                foreach(val in row) {
                    print(type(val) + " " + val);
                }
            }

            mysql_free_result(result);
        } else {
            print(mysql_error(handler));
            print("Error ID: " + mysql_errno(handler));
        }

        result = mysql_query(handler, "SELECT * FROM characters");

        if (result) {
            print("Query done " + mysql_num_fields(result));
            local row_assoc = mysql_fetch_assoc(result);
            if (row_assoc) {
                print(row_assoc["name"] + " " + row_assoc["uuid"]);
            }

            mysql_free_result(result);
        } else {
            print(mysql_error(handler));
            print("Error ID: " + mysql_errno(handler));
        }

        mysql_close(handler);
    }

}

addEventHandler("onInit", findOne)