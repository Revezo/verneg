function callClientFunction(pid, funcName, ...) {
    print("Send packet")
    print(PacketId.RPC);
    packet <- Packet();
    packet.writeUInt16(PacketId.RPC);
    print("funcName: " + funcName);
    packet.writeString(funcName);
    print("vargv.len(): " + vargv.len())
    packet.writeChar(vargv.len());

    foreach(val in vargv) {
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
