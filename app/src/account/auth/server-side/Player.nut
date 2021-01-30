class Player {
    serverId = null
    databaseId = null
    username = null
    authenticated = null

    constructor(serverId, databaseId, username) {
        this.serverId = serverId
        this.databaseId = databaseId
        this.username = username
        this.authenticated = false   
    }

    function authenticate() {
        this.authenticated = true
    }

    function isAuthenticated() {
        return authenticated
    }
}