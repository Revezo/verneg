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
        callEvent("onPlayerAuthenticate", player.serverId)
        sendMessageToAll(0, 255, 0, player.username + " connected with the server.")        
    }

    function registerPlayer(pid, username) {
        local registeredPlayer = AccountRepository.registerPlayer(pid, username)
        if (registeredPlayer) {
            registeredPlayer.authenticate()
            PlayerList.insert(registeredPlayer)
            callEvent("onPlayerRegister", registeredPlayer.serverId)
            sendMessageToAll(0, 255, 0, registeredPlayer.username + " connected with the server.")
        } else {
            kick(pid, "Registration failed")
        }
    }
}
