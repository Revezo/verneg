local function onPlayerMessage(senderId, text) {
    ChatEventSender.sendLocalDistanceRelativeChatEvents(senderId, "onInCharacterMessage", text);
}

local function chatCommandHandler(senderId, cmd, params) {
    switch (cmd) {
        case "me":
            Mysql.findOne()
            ChatEventSender.sendLocalDistanceRelativeChatEvents(senderId, "onMeMessage", params);
            break;
        case "do":
            ChatEventSender.sendLocalDistanceIrrelativeChatEvents(senderId, "onDoMessage", params);
            break;
        case "b":
            ChatEventSender.sendLocalDistanceIrrelativeChatEvents(senderId, "onLocalOocMessage", params);
            break;
        case "bo":
            ChatEventSender.sendGlobalChatEvents(senderId, "onGlobalOocMessage", params);
            break;
        case "w":
        case "pm":
        case "pw":
            ChatEventSender.sendPrivateMessageEvent(senderId, params);
            break;
    }
}

addEventHandler("onPlayerMessage", onPlayerMessage);
addEventHandler("onPlayerCommand", chatCommandHandler);