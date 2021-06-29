
function onPlayerCommand(pid, cmd, params) {
    switch (cmd) {
        case "heal":
            setPlayerHealth(pid, getPlayerMaxHealth(pid));
            sendMessageToPlayer(pid, 0, 255, 0, "Healed");
            for (local i = 0; i<getMaxSlots(); ++i) {
                print("aaa: " + PlayerList.get(i).username)
            }
            break;
        case "virt":
            params = sscanf("d", params);
            if (params) {
                sendMessageToPlayer(pid, 255, 0, 0, "Virtual world was set to: " + params[0]);
                setPlayerVirtualWorld(pid, params[0]);
            } else
                sendMessageToPlayer(pid, 255, 0, 0, "Type: /virt id");
            break;

        case "gd":
            setPlayerWorld(pid, "OLDWORLD\\OLDWORLD.ZEN");
            break;


        case "kh":
            setPlayerWorld(pid, "NEWWORLD\\NEWWORLD.ZEN");
            break;

        case "jr":
            setPlayerWorld(pid, "ADDON\\ADDONWORLD.ZEN");
            break;

        case "help":
            sendMessageToPlayer(pid, 0, 255, 0, "Commands:");
            sendMessageToPlayer(pid, 0, 255, 0, "/heal Restores health");
            sendMessageToPlayer(pid, 0, 255, 0, "/sprint Enable/Disable sprint");
            sendMessageToPlayer(pid, 0, 255, 0, "/gd Teleport to Mining Valley");
            sendMessageToPlayer(pid, 0, 255, 0, "/kr Teleport to Khorinis");
            sendMessageToPlayer(pid, 0, 255, 0, "/jr Teleport to Jarkendar");
            break;
    }
}
addEventHandler("onPlayerCommand", onPlayerCommand);
