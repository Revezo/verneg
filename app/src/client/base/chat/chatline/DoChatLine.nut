class DoChatLine extends AbstractChatLine {
    static color = Color(126, 86, 209);
    line = null;

    constructor(pid, text) {
        line = Draw(0, 0, ">> " + strip(text) + " (( " + getPlayerName(pid) + " )) <<");
        line.setColor(color.r, color.g, color.b);
    }

    function show() {
        line.visible = true;
    }

    function hide() {
        line.visible = false;
    }

    function update(x, y) {
        line.setPositionPx(x, y);
    }

    function offset() {
        return line.heightPx;
    }
}