local function keyHandler(key) {
    if (chatInputIsOpen()) {
        playGesticulation(heroId);

        switch (key) {
            case KEY_RETURN:
                chatInputSend();
                disableControls(true);
                break;

            case KEY_ESCAPE:
                chatInputClose();
                disableControls(true);
                break;
        }
    } else {
        switch (key) {
            case KEY_T:
                if (Chat.visible) {
                    chatInputOpen();
                    disableControls(false);
                }
                break;

            case KEY_F7:
                Chat.toggle();
                break;
        }
    }
}

local function messageHandler(pid, r, g, b, message) {
    if (pid != -1) {
        Chat.printLine(PlayerChatLine(pid, r, g, b, message));
    } else {
        Chat.printLine(ChatLine(r, g, b, message));
    }
}


addEventHandler("onKey", keyHandler);
addEventHandler("onPlayerMessage", messageHandler);

print("chat.nut loaded...")