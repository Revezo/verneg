function sendEventToClient(pid, eventName, params) {
    print("sendEventToClient: " + pid + "|" + eventName + "|" + params.len());
    local rpcCallParams = [eventName];
    rpcCallParams.extend(params);
    callClientFunction(pid, "callEvent", rpcCallParams);
}

function callClientFunction(pid, funcName, params) {
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

    packet.send(pid, RELIABLE_ORDERED);
    delete packet;
}
