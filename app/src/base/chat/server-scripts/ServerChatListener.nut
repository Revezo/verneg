local MAX_DISTANCE = 1500;

local function playerMessage(pid, message) {
    local sender_pos = getPlayerPosition(pid);

    for (local i = 0; i < getMaxSlots(); ++i) {
        if (isPlayerConnected(i) && isPlayerSpawned(i)) {
            local pos = getPlayerPosition(i);

            local distance = getDistance3d(sender_pos.x, sender_pos.y, sender_pos.z, pos.x, pos.y, pos.z);
            print("distance: " + distance);
            if (distance <= MAX_DISTANCE) {
                local power = (distance/300).tointeger();
                local rgb = 255*pow(0.85, power);
                sendPlayerMessageToPlayer(pid, i, rgb.tointeger(), rgb.tointeger(), rgb.tointeger(), message);
            }
        }
    }
}

local function cmdHandler(pid, cmd, params) {
    switch (cmd) {
        case "me":
			local sender_pos = getPlayerPosition(pid);
            for (local i = 0; i < getMaxSlots(); ++i) {
                if (isPlayerConnected(i) && isPlayerSpawned(i)) {
                    local pos = getPlayerPosition(i);

                    local distance = getDistance3d(sender_pos.x, sender_pos.y, sender_pos.z, pos.x, pos.y, pos.z);
                    print("distance: " + distance);
                    if (distance <= MAX_DISTANCE) {
                        local power = (distance/300).tointeger();
                        local r = 255*pow(0.85, power);
                        local g = 70*pow(0.85, power);
                        local b = 233*pow(0.85, power);
                        sendPlayerMessageToPlayer(pid, i, r.tointeger(), g.tointeger(), b.tointeger(), params);
                    }
                }
            }

            break;
		case "do":
            // cmd_acp(pid, params);
            break;
		case "b":
            // cmd_acp(pid, params);
            break;
		case "bo":
            // cmd_acp(pid, params);
            break;
    }
}

local function pow(number, power) {
    if (powerRaised != 0)
        return (number * pow(number, powerRaised - 1));
    else
        return 1;
}

addEventHandler("onPlayerMessage", playerMessage);
addEventHandler("onPlayerCommand", cmdHandler);