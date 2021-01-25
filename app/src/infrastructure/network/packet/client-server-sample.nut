    // creating infinite timer which will be called with one second delay
    setTimer(function()
    {
    	local packet = Packet() // creating packet

    	packet.writeUint16(PACKET.ID) // writing some id from messageid.nut, you have to define id yourself, it's only a dummy example
    	packet.writeInt32(getPlayerStrength(heroId)) // writing player strength
    	packet.writeInt32(getPlayerDexterity(heroId)) // writing player dexterity

    	packet.send(RELIABLE_ORDERED) // sending packet to server

    }, 1000, -1)




 addPacketListener(PACKET.ID,
  function(pid, packet) // binding function to packet with id PACKET.ID
     {
    	local strength = packet.readInt32() // reading player strength
    	local dexterity = packet.readInt32() // reading player dexterity

    	if (strength != getPlayerStrength(pid)) // comparing client-side strength with server-side strength
    	{
    		ban(pid, -1, "Cheating strength") // givining permanent ban for cheating
    	}
    	else if (dexterity != getPlayerDexterity(pid)) // comparing client-side dexterity with server-side dexterity
    	{
    		ban(pid, -1, "Cheating dexterity") // givining permanent ban for cheating
    	}
    })