const CHAT_LINE_SIZE = 15;
const CHAT_VISIBLE = true;

Chat <- {
	x = 5,
	y = 5,
	visible = CHAT_VISIBLE,

	lines = queue(),
	maxLines = CHAT_LINE_SIZE,
}

function Chat::toggle() {
	visible ? hide() : show();
}

function Chat::show() {
	visible = true;

	foreach (line in lines) {
		line.show();
	}
}

function Chat::hide() {
	visible = false;

	foreach (line in lines) {
		line.hide();
	}
}

function Chat::printLine(line) {
	if (visible) {
		line.show();
	}
	lines.push(line);

	if (lines.len() > maxLines) {
		local line = lines.front();
		line.hide();

		lines.pop();
	}

	calcPosition();
}

function Chat::calcPosition() {
	local offset = 0;
	foreach (line in lines) {
		line.update(x, y + offset);
		offset += line.offset();
	}

	chatInputSetPosition(x, any(y + offset));
}