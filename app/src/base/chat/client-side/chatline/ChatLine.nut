class ChatLine extends AbstractChatLine {
    line = null;

    constructor(r, g, b, text) {
        line = Draw(0, 0, text);
        line.setColor(r, g, b);
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