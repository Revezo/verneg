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

addEventHandler("onPacket", function(packet) {
    print("in client onPacket: +");
    local id = packet.readUInt16();
    if (id in packetListeners) {
        packetListeners[id](packet);
    }
});