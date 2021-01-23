local packetListeners = {};

function addPacketListener(id, func) {
    if (id in packetListeners) {
        return;
    }

    packetListeners[id] <- func;
}

function removePacketListener(id) {
    if (!id in packetListeners) {
        return;
    }
    delete packetListeners[id];
}

addEventHandler("onPacket", function(...) {
    print("in client onPackeet: +");
    print("vargv[0]:|" + vargv[0] + "|");
    print("=========================");
    local packet = vargv[0];
    local id = packet.readUInt16();
    if (id in packetListeners) {
        packetListeners[id](packet);
    }
});