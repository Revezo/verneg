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

local function onPlayerMessage(senderId, r, g, b, message) {
    Chat.printLine(ChatLine(r, g, b, message));
}

function onInCharacterMessage(senderId, distance, message) {
    Chat.printLine(InCharacterChatLine(senderId, distance, message));
}

function onMeMessage(senderId, distance, message) {
    Chat.printLine(MeChatLine(senderId, distance, message));
}

function onDoMessage(senderId, message) {
    Chat.printLine(DoChatLine(senderId, message));
}

function onLocalOocMessage(senderId, message) {
    Chat.printLine(LocalOocChatLine(senderId, message));
}

function onGlobalOocMessage(senderId, message) {
    Chat.printLine(GlobalOocChatLine(senderId, message));
}

function onPrivateMessageSent(receiverId, message) {
    print("onPrivateMessageSent")
    Chat.printLine(SentPmChatLine(receiverId, message))
    print("onPrivateMessageSent finish")
}

function onPrivateMessageReceived(senderId, message) {
    print("onPrivateMessageReceived")
    Chat.printLine(ReceivedPmChatLine(senderId, message))
    print("onPrivateMessageReceived finish")
}

addEventHandler("onKey", onKey)
addEventHandler("onPlayerMessage", onPlayerMessage)
addEventHandler("onInCharacterMessage", onInCharacterMessage)
addEventHandler("onMeMessage", onMeMessage)
addEventHandler("onDoMessage", onDoMessage)
addEventHandler("onLocalOocMessage", onLocalOocMessage)
addEventHandler("onGlobalOocMessage", onGlobalOocMessage)
addEventHandler("onPrivateMessageSent", onPrivateMessageSent)
addEventHandler("onPrivateMessageReceived", onPrivateMessageReceived)
