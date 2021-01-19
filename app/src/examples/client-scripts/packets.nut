enum PacketId
{
	CALL = 127
};

function callServerFunc(funcName, ...)
{
	packet <- Packet();
	packet.writeChar(PacketId.CALL);
	packet.writeString(funcName);
	packet.writeChar(vargv.len());

	foreach(val in vargv)
	{
		switch (typeof(val))
		{
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

	packet.send(RELIABLE_ORDERED);
	delete packet;
}

local function packetReceiver(packet)
{
	print("Packet callback")
	local id = packet.readChar();
	print(id)
	if (id == PacketId.CALL)
	{
		local func = packet.readString() + "(";
		local len = packet.readChar();

		for (local i = 0; i < len; ++i)
		{
			if (i > 0) func += ","

			switch (packet.readChar())
			{
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
}

addEventHandler("onPacket", packetReceiver);

local function initHandler()
{
	callServerFunc("testFunction", null, false, "It WORK!");
}

addEventHandler("onInit", initHandler);

function testFunction(a, b, c)
{
	print("Function called with " + a + ", " + b + ", " + c)
}
