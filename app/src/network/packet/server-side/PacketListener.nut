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
    print("in serverSide onPackeet: +");
    print("vargv[0]:|" + vargv[0] + "|");
    print("vargv[1]:|" + vargv[1] + "|");
    print("=========================");

    local packetSenderId = vargv[0];
    local packet = vargv[1];
    local id = packet.readUInt16();
    if (id in packetListeners) {
        packetListeners[id](packetSenderId, packet);
    }
});