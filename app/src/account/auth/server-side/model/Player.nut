class Player {
    characterId = null
    authenticated = null

    constructor(characterId) {
        this.characterId = characterId
        this.authenticated = false   
    }

    function authenticate() {
        this.authenticated = true
    }

    function isAuthenticated() {
        return authenticated
    }
}