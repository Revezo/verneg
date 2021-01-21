function onInit()
{
	Chat.print(0, 255, 0, "Welcome on " + getHostname() + "!");
}

addEventHandler("onInit", onInit);

function onCommand(cmd, params)
{
	switch (cmd)
	{
	case "q":
		exitGame();
		break;
		
	case "pos":
		local vec = getPlayerPosition(heroId);
		local angle = getPlayerAngle(heroId);
		
		print("x: " + vec.x + " y: " + vec.y + " z: " + vec.z + " angle: " + angle);
		break;
	}
}

addEventHandler("onCommand", onCommand);