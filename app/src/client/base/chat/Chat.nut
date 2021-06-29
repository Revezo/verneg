const CHAT_LINE_SIZE = 15;

Chat <- {
    x = 5,
    y = 5,

    visible = true,
    lines = queue(),
    maxLines = CHAT_LINE_SIZE,

    function printLine(line) {
        if (visible) {
            line.show();
        }
        lines.push(line);

        if (lines.len() > maxLines) {
            lines.front().hide();
            lines.pop();
        }

        calcPosition();
    }

    function toggle() {
        visible ? hide() : show();
    }


    // private
    function show() {
        visible = true;

        foreach(line in lines) {
            line.show();
        }
    }

    function hide() {
        visible = false;

        foreach(line in lines) {
            line.hide();
        }
    }

    function calcPosition() {
        local offset = 0;
        foreach(line in lines) {
            line.update(x, y + offset);
            offset += line.offset();
        }

        chatInputSetPosition(x, any(y + offset));
    }
}