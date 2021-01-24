local MAX_DISTANCE = 1500;

local function playerMessage(pid, text) {
    local sender_pos = getPlayerPosition(pid);

    for (local i = 0; i < getMaxSlots(); ++i) {
        if (isPlayerConnected(i) && isPlayerSpawned(i)) {
            local pos = getPlayerPosition(i);

            local distance = getDistance3d(sender_pos.x, sender_pos.y, sender_pos.z, pos.x, pos.y, pos.z);
            print("distance: " + distance);
            if (distance <= MAX_DISTANCE) {
                // local power = (distance / 300).tointeger();
                // local rgb = 255 * pow(0.85, power);
                // sendPlayerMessageToPlayer(pid, i, distance, message);
                sendEventToClient(i, "onInCharacterMessage", [pid, distance, text]);
            }
        }
    }
}

local function chatCommandHandler(pid, cmd, params) {
    switch (cmd) {
        case "me":
            meChat(pid, params);
            break;
        case "do":
            doChat(pid, params);
            break;
        case "b":
            localOocChat(pid, params);
            break;
        case "bo":
            globalOocChat(pid, params);
            break;
    }
}

function meChat(pid, text) {
    local sender_pos = getPlayerPosition(pid);
    for (local i = 0; i < getMaxSlots(); ++i) {
        if (isPlayerConnected(i) && isPlayerSpawned(i)) {
            local pos = getPlayerPosition(i);

            local distance = getDistance3d(sender_pos.x, sender_pos.y, sender_pos.z, pos.x, pos.y, pos.z);
            print("distance: " + distance);
            if (distance <= MAX_DISTANCE) {
                sendEventToClient(i, "onMeMessage", [pid, distance, text]);
            }
        }
    }
}

function doChat(pid, text) {
    local sender_pos = getPlayerPosition(pid);
    for (local i = 0; i < getMaxSlots(); ++i) {
        if (isPlayerConnected(i) && isPlayerSpawned(i)) {
            local pos = getPlayerPosition(i);

            local distance = getDistance3d(sender_pos.x, sender_pos.y, sender_pos.z, pos.x, pos.y, pos.z);
            if (distance <= MAX_DISTANCE) {
                sendEventToClient(i, "onDoMessage", [pid, text]);
            }
        }
    }
}

function localOocChat(pid, text) {
    local sender_pos = getPlayerPosition(pid);
    for (local i = 0; i < getMaxSlots(); ++i) {
        if (isPlayerConnected(i) && isPlayerSpawned(i)) {
            local pos = getPlayerPosition(i);
            local distance = getDistance3d(sender_pos.x, sender_pos.y, sender_pos.z, pos.x, pos.y, pos.z);
            if (distance <= MAX_DISTANCE) {
                sendEventToClient(i, "onLocalOocMessage", [pid, text]);
            }
        }
    }
}

function globalOocChat(pid, text) {
    local sender_pos = getPlayerPosition(pid);
    for (local i = 0; i < getMaxSlots(); ++i) {
        if (isPlayerConnected(i) && isPlayerSpawned(i)) {
            local pos = getPlayerPosition(i);
            local distance = getDistance3d(sender_pos.x, sender_pos.y, sender_pos.z, pos.x, pos.y, pos.z);
            if (distance <= MAX_DISTANCE) {
                sendEventToClient(i, "onGlobalOocMessage", [pid, text]);
            }
        }
    }
}

addEventHandler("onPlayerMessage", playerMessage);
addEventHandler("onPlayerCommand", chatCommandHandler);