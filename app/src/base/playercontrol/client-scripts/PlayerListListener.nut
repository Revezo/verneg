local function playerCreate(pid)
{
	local playerItem = PlayerList.insert(pid);

	local color = getPlayerColor(pid);

	playerItem.columns[PlayerList.ID].text = pid.tostring();
	playerItem.columns[PlayerList.NICKNAME].text = getPlayerName(pid);
	playerItem.columns[PlayerList.NICKNAME].setColor(color.r, color.g, color.b);
	playerItem.columns[PlayerList.PING].text = getPlayerPing(pid);
}

local function playerDestroy(pid)
{
	PlayerList.remove(pid);
}

local function playerPing(pid, ping)
{
	local playerItem = PlayerList.getItem(pid);
	if (playerItem == null) return;

	playerItem.columns[PlayerList.PING].text = ping.tostring();
}

local function playerNickname(pid, name)
{
	local playerItem = PlayerList.getItem(pid);
	if (playerItem == null) return;

	playerItem.columns[PlayerList.NICKNAME].text = name;
}

local function playerColor(pid, r, g, b)
{
	local playerItem = PlayerList.getItem(pid);
	if (playerItem == null) return;

	playerItem.columns[PlayerList.NICKNAME].setColor(r, g, b);
}

local function mouseWheel(value)
{
	if (PlayerList.visible)
		PlayerList.scroll(value);
}

local function resChange()
{
	PlayerList.resize();
}

local function keyHandler(key)
{
	print("playerlist keyHandler")
	if (key == KEY_F5 && !chatInputIsOpen())
		PlayerList.toggle();
}

addEventHandler("onPlayerCreate", playerCreate);
addEventHandler("onPlayerDestroy", playerDestroy);
addEventHandler("onPlayerChangePing", playerPing);
addEventHandler("onPlayerChangeNickname", playerNickname);
addEventHandler("onPlayerChangeColor", playerColor);
addEventHandler("onMouseWheel", mouseWheel);
addEventHandler("onChangeResolution", resChange);
addEventHandler("onKey", keyHandler);

PlayerList.constructor();
