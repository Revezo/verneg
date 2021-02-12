function onPlayerAuthenticate(pid) {
    PlayerEquipment.retrievePlayerEquipment(pid);
}

function onPlayerRegister(pid) {
    PlayerEquipment.giveStartingEquipment(pid);
}

function onPlayerRespawn(pid) {
    PlayerEquipment.retrievePlayerEquipment(pid);
}

addEventHandler("onPlayerAuthenticate", onPlayerAuthenticate)
addEventHandler("onPlayerRegister", onPlayerRegister)
addEventHandler("onPlayerRespawn", onPlayerRespawn)
