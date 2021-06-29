class InCharacterChatLine extends AbstractChatLine {
    static rgb = 255;
    line = null;
    nickname = null;

    constructor(pid, distance, text) {
        print("params:" + pid + "|" + distance + "|" + text);
        local color = (chatDistanceColorDivisor(distance) * rgb).tointeger();
        line = Draw(0, 0, strip(text));
        line.setColor(color, color, color);

        nickname = Draw(0, 0, getPlayerName(pid) + ": ");
        nickname.setColor(color, color, color);
    }

    function show() {
        line.visible = true;
        nickname.visible = true;
    }

    function hide() {
        line.visible = false;
        nickname.visible = false;
    }

    function update(x, y) {
        line.setPositionPx(nickname.widthPx + x, y);
        nickname.setPositionPx(x, y);
    }

    function offset() {
        return nickname.heightPx;
    }
}