    local heroClass =
    {
    	health = 1000,
    	mana = 100,

    	strength = 200,
    	dexterity = 200
    }

    addEventHandler("onCommand", function(pid, cmd, params)
    {
    	if (cmd == "giveclass") // if player type /giveclass command, then..
    	{
    		local packet = Packet() // creating packet

    		packet.writeUint16(PACKET.CLASS) // writing some id from messageid.nut, you have to define id yourself, it's only a dummy example
    		packet.writeInt32(heroClass.health) // writing class health
    		packet.writeInt32(heroClass.mana) // writing class mana
    		packet.writeInt32(heroClass.strength) // writing class strength
    		packet.writeInt32(heroClass.dexterity) // writing class dexterity

    		packet.send(pid, RELIABLE_ORDERED) // sending packet to client
    	}
    })

addPacketListener(PACKET.ID, function(packet) // binding function to packet with id PACKET.ID
    {
    	local health = packet.readInt32() // reading class health
    	local mana = packet.readInt32() // reading class mana
    	local strength = packet.readInt32() // reading class strength
    	local dexterity = packet.readInt32() // reading class dexterity

    	setPlayerHealth(heroId, health)
    	setPlayerMaxHealth(heroId, health)

    	setPlayerMana(heroId, mana)
    	setPlayerMaxMana(heroId, mana)

    	setPlayerStrength(heroId, strength)
    	setPlayerDexterity(heroId, dexterity)
    })