local function setPlayersPropertiesAndEquipment(pid) {
    // Stats
    setPlayerHealth(pid, 1000);
    setPlayerMaxHealth(pid, 1000);
    setPlayerStrength(pid, 200);
    setPlayerDexterity(pid, 200);

    // Weapon skill percent
    setPlayerSkillWeapon(pid, WEAPON_1H, 100);
    setPlayerSkillWeapon(pid, WEAPON_2H, 100);
    setPlayerSkillWeapon(pid, WEAPON_BOW, 100);
    setPlayerSkillWeapon(pid, WEAPON_CBOW, 100);

    // Items
    giveItem(pid, Items.id("ITFO_BEER"), 1000);
    giveItem(pid, Items.id("ITFO_WINE"), 1000);
    giveItem(pid, Items.id("ITFO_BOOZE"), 1000);
    giveItem(pid, Items.id("ITFO_ADDON_RUM"), 1000);
    giveItem(pid, Items.id("ITFO_ADDON_GROG"), 1000);
    giveItem(pid, Items.id("ITMI_JOINT"), 1000);
    giveItem(pid, Items.id("ITRW_ARROW"), 1000);
    giveItem(pid, Items.id("ITSC_INSTANTFIREBALL"), 1000);
    giveItem(pid, Items.id("ITPO_HEALTH_ADDON_04"), 1000);

    equipArmor(pid, Items.id("ITAR_PAL_M"));
    equipItem(pid, Items.id("ITMW_1H_SPECIAL_04"));
    equipItem(pid, Items.id("ITRW_BOW_L_04"));
}

function onPlayerJoin(pid) {
    sendMessageToAll(0, 255, 0, getPlayerName(pid) + " connected with the server.");
    setPlayersPropertiesAndEquipment(pid);
    spawnPlayer(pid);
    setPlayerPosition(pid, 0, 0, 0);
}
function onPlayerRespawn(pid) {
    sendMessageToAll(255, 100, 0, getPlayerName(pid) + " has respawned.");
    setPlayersPropertiesAndEquipment(pid);
    spawnPlayer(pid);
}

function onPlayerDead(pid, kid) {
    if (kid == -1) {
        sendMessageToAll(255, 30, 0, getPlayerName(pid) + " kill himself.");
    } else {
        sendMessageToAll(255, 30, 0, getPlayerName(kid) + " killed " + getPlayerName(pid));
    }
}

function onPlayerDisconnect(pid, reason) {
    PlayerList[pid].clear();

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

function onPlayerCommand(pid, cmd, params) {
    switch (cmd) {
        case "heal":
            setPlayerHealth(pid, getPlayerMaxHealth(pid));
            sendMessageToPlayer(pid, 0, 255, 0, "Healed");
            break;

        case "sprint":
            if (PlayerList[pid].sprintEnabled) {
                removePlayerOverlay(pid, Mds.id("HUMANS_SPRINT.MDS"));
                sendMessageToPlayer(pid, 255, 0, 0, "Sprint disabled");
            } else {
                applyPlayerOverlay(pid, Mds.id("HUMANS_SPRINT.MDS"));
                sendMessageToPlayer(pid, 0, 255, 0, "Sprint enabled");
            }

            PlayerList[pid].toggleSprint();
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

addEventHandler("onPlayerJoin", onPlayerJoin);
addEventHandler("onPlayerRespawn", onPlayerRespawn);
addEventHandler("onPlayerDead", onPlayerDead);
addEventHandler("onPlayerDisconnect", onPlayerDisconnect);
addEventHandler("onPlayerCommand", onPlayerCommand);
