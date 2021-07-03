function onPlayerAuthenticate(pid) {
    print("PlayerEquipmentListener.onPlayerAuthenticate entry, pid=" + pid)
    PlayerEquipment.retrievePlayerEquipment(pid);
    print("PlayerEquipmentListener.onPlayerAuthenticate finish, pid=" + pid)
}

function onPlayerRegister(pid) {
    print("PlayerEquipmentListener.onPlayerRegister entry, pid=" + pid)
    PlayerEquipment.giveStartingEquipment(pid);
    print("PlayerEquipmentListener.onPlayerRegister finish, pid=" + pid)
}

function onPlayerRespawn(pid) {
    print("PlayerEquipmentListener.onPlayerRespawn entry, pid=" + pid)
    PlayerEquipment.retrievePlayerEquipment(pid);
    print("PlayerEquipmentListener.onPlayerRespawn finish, pid=" + pid)
}

addEventHandler("onPlayerAuthenticate", onPlayerAuthenticate)
addEventHandler("onPlayerRegister", onPlayerRegister)
addEventHandler("onPlayerRespawn", onPlayerRespawn)
