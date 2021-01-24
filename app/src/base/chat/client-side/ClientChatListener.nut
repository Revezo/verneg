local function onKey(key) {
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

function onPlayerMessage(pid, r, g, b, message) {
    print("onPlayerMessage");
    Chat.printLine(ChatLine(r, g, b, message));
    print("onPlayerMessage finish");
}

function onInCharacterMessage(pid, distance, message) {
    print("print IC");
    Chat.printLine(InCharacterChatLine(pid, distance, message));
    print("print IC finish");
}

function onMeMessage(pid, distance, message) {
    print("print me");
    Chat.printLine(MeChatLine(pid, distance, message));
    print("print me finish");
}

function onDoMessage(pid, message) {
    print("print do");
    Chat.printLine(DoChatLine(pid, message));
    print("print do finish");
}

function onLocalOocMessage(pid, message) {
    print("print b");
    Chat.printLine(LocalOocChatLine(pid, message));
    print("print b finish");
}

function onGlobalOocMessage(pid, message) {
    print("print bo");
    Chat.printLine(GlobalOocChatLine(pid, message));
    print("print bo finish");
}

addEventHandler("onKey", onKey);
addEventHandler("onPlayerMessage", onPlayerMessage);
addEventHandler("onInCharacterMessage", onInCharacterMessage);
addEventHandler("onMeMessage", onMeMessage);
addEventHandler("onDoMessage", onDoMessage);
addEventHandler("onLocalOocMessage", onLocalOocMessage);
addEventHandler("onGlobalOocMessage", onGlobalOocMessage);