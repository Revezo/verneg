function onPlayerJoin(pid) {
    spawnPlayer(pid);
    local playerPosition = PlayerPositionRepository.lastPosition(getPlayerName(pid));
    setPlayerPosition(pid, playerPosition.x, playerPosition.y, playerPosition.z);
}

function onPlayerPositionSave(pid, x, y, z) {
    PlayerPositionRepository.saveLastPosition(getPlayerName(pid), Position(x, y, z))
}
addEventHandler("onPlayerJoin", onPlayerJoin)
addEventHandler("onPlayerPositionSave", onPlayerPositionSave)