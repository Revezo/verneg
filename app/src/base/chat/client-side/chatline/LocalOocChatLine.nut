class LocalOocChatLine extends AbstractChatLine {
    static rgb = 200;
    line = null;
    nickname = null;

    constructor(pid, text) {
        line = Draw(0, 0, "(( " + strip(text) + " ))");
        line.setColor(rgb, rgb, rgb);

        nickname = Draw(0, 0, getPlayerName(pid) + ": ");
        nickname.setColor(rgb, rgb, rgb);
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