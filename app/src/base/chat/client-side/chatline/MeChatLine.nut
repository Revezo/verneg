class MeChatLine extends AbstractChatLine {
    line = null;
    nickname = null;

    // int, int, int, int, string
    constructor(pid, r, g, b, text) {
        line = Draw(0, 0, text);
        line.setColor(r, g, b);

        local color = getPlayerColor(pid);
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

    // int, int
    function update(x, y) {
        line.setPositionPx(nickname.widthPx + x, y);
        nickname.setPositionPx(x, y);
    }

    function offset() {
        return nickname.heightPx;
    }
}