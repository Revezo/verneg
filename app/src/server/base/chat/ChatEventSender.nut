const MAX_DISTANCE = 1500;

ChatEventSender <- {
    function sendLocalDistanceRelativeChatEvents(senderId, chatEventName, text) {
        local sender_pos = getPlayerPosition(senderId);
        for (local receiverId = 0; receiverId < getMaxSlots(); ++receiverId) {
            if (isPlayerConnected(receiverId) && isPlayerSpawned(receiverId)) {
                local receiverPos = getPlayerPosition(receiverId);

                local distance = getDistance3d(sender_pos.x, sender_pos.y, sender_pos.z, receiverPos.x, receiverPos.y, receiverPos.z);
                print("distance: " + distance);
                if (distance <= MAX_DISTANCE) {
                    sendEventToClient(receiverId, chatEventName, [senderId, distance, text]);
                }
            }
        }
    }

    function sendLocalDistanceIrrelativeChatEvents(senderId, chatEventName, text) {
        local sender_pos = getPlayerPosition(senderId);
        for (local receiverId = 0; receiverId < getMaxSlots(); ++receiverId) {
            if (isPlayerConnected(receiverId) && isPlayerSpawned(receiverId)) {
                local receiverPos = getPlayerPosition(receiverId);

                local distance = getDistance3d(sender_pos.x, sender_pos.y, sender_pos.z, receiverPos.x, receiverPos.y, receiverPos.z);
                print("distance: " + distance);
                if (distance <= MAX_DISTANCE) {
                    sendEventToClient(receiverId, chatEventName, [senderId, text]);
                }
            }
        }
    }

    function sendGlobalChatEvents(senderId, chatEventName, text) {
        local sender_pos = getPlayerPosition(senderId);
        for (local receiverId = 0; receiverId < getMaxSlots(); ++receiverId) {
            if (isPlayerConnected(receiverId) && isPlayerSpawned(receiverId)) {
                local receiverPos = getPlayerPosition(receiverId);
                sendEventToClient(receiverId, chatEventName, [senderId, text]);
            }
        }
    }

    function sendPrivateMessageEvent(senderId, params) {
        local args = sscanf("ds", params);
        if (isPrivateMessageCorrect(senderId, args)) {
            local receiverId = args[0];
            local text = args[1];
            sendEventToClient(senderId, "onPrivateMessageSent", [receiverId, text]);
            sendEventToClient(receiverId, "onPrivateMessageReceived", [senderId, text]);
        }
    }

    // private
    function isPrivateMessageCorrect(senderId, args) {
        if (!args) {
            sendMessageToPlayer(senderId, 255, 0, 0, "/pm [id] [text]");
            return false;
        }

        local receiverId = args[0];
        if (receiverId == senderId) {
            sendMessageToPlayer(senderId, 255, 0, 0, "Cannot send message to yourself.");
            return false;
        }
        if (!isPlayerConnected(args[0])) {
            sendMessageToPlayer(senderId, 255, 0, 0, "Player with id " + receiverId + " is not connected.");
            return false;
        }
        return true;
    }
}