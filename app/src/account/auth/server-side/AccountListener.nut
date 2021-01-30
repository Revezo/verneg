function onPlayerJoin(pid) {
    print(getPlayerName(pid) + " Joined")
    AccountAuthentication.authenticateId(pid)
}

function onPlayerDisconnect(pid, reason) {
    local username = getPlayerName(pid)
    PlayerList.remove(pid)

    switch (reason) {
        case DISCONNECTED:
            sendMessageToAll(255, 0, 0, username + " disconnected from the server.");
            break;

        case LOST_CONNECTION:
            sendMessageToAll(255, 0, 0, username + " lost connection with the server.");
            break;

        case HAS_CRASHED:
            sendMessageToAll(255, 0, 0, username + " has crashed.");
            break;
    }

    print("Instance: " + getPlayerInstance(pid));
}

addEventHandler("onPlayerJoin", onPlayerJoin)
addEventHandler("onPlayerDisconnect", onPlayerDisconnect);
