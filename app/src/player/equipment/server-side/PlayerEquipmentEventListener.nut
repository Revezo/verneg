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
    setPlayersPropertiesAndEquipment(pid);
}
function onPlayerRespawn(pid) {
    setPlayersPropertiesAndEquipment(pid);
}

addEventHandler("onPlayerJoin", onPlayerJoin)
addEventHandler("onPlayerRespawn", onPlayerRespawn)
