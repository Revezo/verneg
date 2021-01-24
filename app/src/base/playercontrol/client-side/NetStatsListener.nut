local function initHandler() {
    NetStats.constructor();
}

local function keyHandler(key) {
    if (key == KEY_F6) {
        if (!chatInputIsOpen() && !NetStats.showed)
            NetStats.show();
        else if (NetStats.showed)
            NetStats.hide();
    }
}

addEventHandler("onInit", initHandler);
addEventHandler("onKey", keyHandler);
