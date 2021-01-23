local function packetReceiver(packet) {
    local func = packet.readString() + "(";
    local len = packet.readChar();

    for (local i = 0; i < len; ++i) {
        if (i > 0) func += ","

        switch (packet.readChar()) {
            case 'n':
                func += "null";
                break;

            case 'b':
                func += packet.readBool();
                break;

            case 'i':
                func += packet.readInt32();
                break;

            case 'f':
                func += packet.readFloat();
                break;

            case 's':
                func += "\"" + packet.readString() + "\"";
                break;
        }
    }

    func += ")";
    print(func)
    local compiledScript = compilestring(func);
    compiledScript();
}

addPacketListener(PACKET.RPC, packetReceiver);