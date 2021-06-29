class SentPmChatLine extends AbstractChatLine {
    static color = Color(255, 214, 122);
    line = null;
    nickname = null;

    constructor(receiverId, text) {
        print("SentPmChatLine")
        line = Draw(0, 0, strip(text) + "))")
        print("1")
        line.setColor(color.r, color.g, color.b)
        print("2")

        nickname = Draw(0, 0, "(( > " + getPlayerName(receiverId) + " (" + receiverId +  "): ")
        print("3")
        nickname.setColor(color.r, color.g, color.b)
        print("4")
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