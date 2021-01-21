local function playerMessage(pid, message) {
    print(getPlayerName(pid) + " said: " + message);

    local sender_pos = getPlayerPosition(pid);

    for (local i = 0; i < getMaxSlots(); ++i) {
        if (isPlayerConnected(i) && isPlayerSpawned(i)) {
            local pos = getPlayerPosition(i);

            local distance = getDistance3d(sender_pos.x, sender_pos.y, sender_pos.z, pos.x, pos.y, pos.z);
            print("distance: " + distance);
            if (distance <= MAX_DISTANCE) {
                local colourSaturation = 255 - distance*0.1;
                sendPlayerMessageToPlayer(pid, i, colourSaturation.tointeger(), colourSaturation.tointeger(), colourSaturation.tointeger(), message);
            }
        }
    }
}