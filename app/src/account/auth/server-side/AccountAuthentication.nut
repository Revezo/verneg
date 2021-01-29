AccountAuthentication <- {

    function authenticate(pid) {
        local username = getPlayerName(pid)
        if (!PlayerList.isConnected(username)) {
            PlayerList.get(pid).authenticate(username)
            callEvent("onPlayerAuthenticate", pid)
            sendMessageToAll(0, 255, 0, getPlayerName(pid) + " connected with the server.")
        } else {
            kick(pid, "Player with that username is already connected")
        }
    
    }

    function isAuthenticated(pid) {
        return PlayerList.get(pid).isAuthenticated()
    }

}
