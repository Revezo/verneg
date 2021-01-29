function onPlayerJoin(pid) {
    print(getPlayerName(pid) + " Joined")
    AccountAuthentication.authenticate(pid)
}

function onPlayerDisconnect(pid, reason) {
    PlayerList.get(pid).clear();

    switch (reason) {
        case DISCONNECTED:
            sendMessageToAll(255, 0, 0, getPlayerName(pid) + " disconnected from the server.");
            break;

        case LOST_CONNECTION:
            sendMessageToAll(255, 0, 0, getPlayerName(pid) + " lost connection with the server.");
            break;

        case HAS_CRASHED:
            sendMessageToAll(255, 0, 0, getPlayerName(pid) + " has crashed.");
            break;
    }

    print("Instance: " + getPlayerInstance(pid));
}

addEventHandler("onPlayerJoin", onPlayerJoin)
addEventHandler("onPlayerDisconnect", onPlayerDisconnect);
