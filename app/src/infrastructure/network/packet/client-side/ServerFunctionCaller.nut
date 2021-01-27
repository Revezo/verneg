function sendEventToServer(eventName, params) {
    print("sendEventToServer: " + eventName + "|" + params.len())
    local rpcCallParams = [eventName];
    rpcCallParams.extend(params);
    callServerFunction("callEvent", rpcCallParams);
}

function callServerFunction(funcName, params) {
    print("creating packet")
    packet <- Packet();
    packet.writeUInt16(PacketId.RPC);
    packet.writeString(funcName);
    packet.writeChar(params.len());

    foreach(val in params) {
        switch (typeof(val)) {
            case "null":
                packet.writeChar('n');
                break;

            case "bool":
                packet.writeChar('b');
                packet.writeBool(val);
                break;

            case "integer":
                packet.writeChar('i');
                packet.writeInt32(val);
                break;

            case "float":
                packet.writeChar('f');
                packet.writeFloat(val);
                break;

            case "string":
                packet.writeChar('s');
                packet.writeString(val);
                break;
        }
    }
    print("sending packet")
    packet.send(RELIABLE_ORDERED);
    delete packet;
    print("packet send to server")
}
