function onPlayerAuthenticate(pid) {
    spawnPlayer(pid);
    local playerPosition = PlayerPositionRepository.lastPosition(getPlayerName(pid));
    setPlayerPosition(pid, playerPosition.x, playerPosition.y, playerPosition.z);
    setPlayerAngle(pid, playerPosition.angle)
}

function onPlayerRespawn(pid) {
    spawnPlayer(pid);
    // TODO set default position
}

function onPlayerPositionSave(pid, x, y, z, angle) {
    if (AccountAuthentication.isAuthenticated(pid)) {
        PlayerPositionRepository.saveLastPosition(getPlayerName(pid), Position(x, y, z, angle))
    }
}

local function playerPosition(id) {
    local playerPosition = getPlayerPosition(id)
    return Position(playerPosition.x, playerPosition.y, playerPosition.z, getPlayerAngle(id))
}

local TEN_MINUTES_IN_MILIS = 600000
setTimer(function() {
    print("POSITION TIMER")
    for (local id = 0; id < getMaxSlots(); id++) {
        if (isPlayerConnected(id) && AccountAuthentication.isAuthenticated(id)) {
            print("saving position of player with id: " + id)
            local playerName = getPlayerName(id)
            PlayerPositionRepository.saveLastPosition(getPlayerName(id), playerPosition(id))
            print("saved position of player with id: " + id)
        }
    }
}, TEN_MINUTES_IN_MILIS, 0);
addEventHandler("onPlayerAuthenticate", onPlayerAuthenticate)
addEventHandler("onPlayerRegister", onPlayerAuthenticate)
addEventHandler("onPlayerRespawn", onPlayerRespawn)
addEventHandler("onPlayerPositionSave", onPlayerPositionSave)