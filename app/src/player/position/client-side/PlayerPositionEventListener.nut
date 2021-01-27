local function exitHandler() {
    local playerPosition = getPlayerPosition(heroId)
    sendEventToServer("onPlayerPositionSave", [heroId, playerPosition.x, playerPosition.y, playerPosition.z])
}

addEventHandler("onExit", exitHandler)