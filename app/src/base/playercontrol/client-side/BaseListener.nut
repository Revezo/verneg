// This function doesn't belong here
function onInit() {
    Chat.print(0, 255, 0, "Welcome on " + getHostname() + "!");
}


function onCommand(cmd, params) {
    switch (cmd) {
        case "q":
            exitGame();
            break;

        // This command should probably in a different 'context'
        case "pos":
            local vec = getPlayerPosition(heroId);
            local angle = getPlayerAngle(heroId);

            print("x: " + vec.x + " y: " + vec.y + " z: " + vec.z + " angle: " + angle);
            break;
        case "aaa":
            print("calling onMyNewEvent event");
    }
}


local function onMyNewEvent() {
    print("in client-side onMyNewEvent");
}
addEventHandler("onMyNewEvent", onMyNewEvent);

addEventHandler("onInit", onInit);
addEventHandler("onCommand", onCommand);