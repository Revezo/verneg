AccountAuthentication <- {

    function authenticateId(pid) {
        local username = getPlayerName(pid)
        if (PlayerList.isDuplicate(pid, username)) {
            kick(pid, "Player with that username is already connected")
            return
        }

        local player = AccountRepository.findPlayer(pid, username)
        if (player) {
            authenticatePlayer(player)
        } else {
            registerPlayer(pid, username)
        }
    }

    function isAuthenticated(pid) {
        return PlayerList.get(pid).isAuthenticated()
    }

    // private
    function authenticatePlayer(player) {
        player.authenticate()
        PlayerList.insert(player)
        callEvent("onPlayerAuthenticate", player.characterId.serverId)
        sendMessageToAll(0, 255, 0, player.characterId.name + " connected with the server.")        
    }

    function registerPlayer(pid, username) {
        local registeredPlayer = AccountRepository.registerPlayer(pid, username)
        if (registeredPlayer) {
            registeredPlayer.authenticate()
            PlayerList.insert(registeredPlayer)
            print("registered player: " + registeredPlayer.characterId.serverId + "|" +  registeredPlayer.characterId.databaseId + "|" +  registeredPlayer.characterId.name)
            callEvent("onPlayerRegister", registeredPlayer.characterId.serverId)
            sendMessageToAll(0, 255, 0, registeredPlayer.characterId.name + " connected with the server.")
        } else {
            kick(pid, "Registration failed")
        }
    }
}
