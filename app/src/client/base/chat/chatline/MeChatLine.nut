class MeChatLine extends AbstractChatLine {
    static color = Color(255, 70, 233);
    line = null;
    nickname = null;

    constructor(pid, distance, text) {
        local r = (chatDistanceColorDivisor(distance) * color.r).tointeger();
        local g = (chatDistanceColorDivisor(distance) * color.g).tointeger();
        local b = (chatDistanceColorDivisor(distance) * color.b).tointeger();

        line = Draw(0, 0, strip(text));

        line.setColor(r, g, b);

        nickname = Draw(0, 0, ">> " + getPlayerName(pid) + " ");
        nickname.setColor(r, g, b);
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