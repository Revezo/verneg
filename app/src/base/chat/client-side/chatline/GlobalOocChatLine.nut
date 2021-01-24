class GlobalOocChatLine extends AbstractChatLine {
    static color = Color(0, 108, 249);
    line = null;
    nickname = null;

    constructor(pid, text) {
        line = Draw(0, 0, strip(text) + " ))");
        line.setColor(color.r, color.g, color.b);

        nickname = Draw(0, 0, "(( " + getPlayerName(pid) + ": ");
        nickname.setColor(color.r, color.g, color.b);
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