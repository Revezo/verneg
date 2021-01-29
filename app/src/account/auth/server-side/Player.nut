class Player {
    username = null
    authenticated = null

    constructor() {
        clear()
    }

    function authenticate(username) {
        this.username = username
        this.authenticated = true
    }

    function isAuthenticated() {
        return authenticated
    }

    function clear() {
        username = null
        authenticated = null
    }
};