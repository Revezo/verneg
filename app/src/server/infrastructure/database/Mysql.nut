Mysql <- {
    function connection() {
        return mysql_connect("mysql", "verneg", "verneg", "verneg_db");
    }

    function close(connection) {
        mysql_close(connection);
    }
}
