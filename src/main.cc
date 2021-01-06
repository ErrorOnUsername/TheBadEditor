/*** includes ***/
#include <ctype.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <sys/ioctl.h>
#include <termios.h>
#include <unistd.h>

/*** defines ***/
#define CTRL_KEY(k) ((k) & 0x17)

/*** data ***/
struct editorConfig {
	int32_t screenRows;
	int32_t screenCols;
	struct termios origTermios;
};
struct editorConfig E;

/*** terminal ***/
void die(const char* msg) {
	write(STDOUT_FILENO, "\x1b[2J", 4);
	write(STDOUT_FILENO, "\x1b[H", 4);

	perror(msg);
	exit(1);
}

void disableRawMode() {
	if(tcsetattr(STDIN_FILENO, TCSAFLUSH, &E.origTermios) == -1)
		die("tcsetattr");
}

void enableRawMode() {
	if(tcgetattr(STDIN_FILENO, &E.origTermios) == -1) die("tcgetattr");
	atexit(disableRawMode);

	struct termios raw = E.origTermios;
	raw.c_iflag &= ~(BRKINT | ICRNL | INPCK | ISTRIP | IXON);
	raw.c_oflag &= ~(OPOST);
	raw.c_cflag |= ~(CS8);
	raw.c_lflag &= ~(ECHO | ICANON | IEXTEN | ISIG);
	raw.c_cc[VMIN] = 0;
	raw.c_cc[VTIME] = 1;

	if(tcsetattr(STDIN_FILENO, TCSAFLUSH, &raw) == -1) die("tcgetattr");
}

char editorReadKey() {
	int32_t nread;
	char c;

	while((nread = read(STDIN_FILENO, &c, 1)) != 1) {
		if(nread == -1 && errno != EAGAIN)
			die("read");
	}

	return c;
}

int32_t getCursorPosition(int32_t* rows, int32_t* cols) {
	char buf[32];
	uint32_t i = 0;

	if(write(STDOUT_FILENO, "\x1b[6n", 4) != 4)
		return -1;

	while(i < sizeof(buf) - 1) {
		if(read(STDIN_FILENO, &buf[i], 1) != 1) 
			break;
		if(buf[i] == 'R')
			break;
		i++;
	}
	buf[i] = '\0';

	if(buf[0] != '\x1b' || buf[1] != '[')
		return -1;
	if(sscanf(&buf[2], "%d;%d", rows, cols) != 2)
		return -1;

	return 0;
}

int32_t getWindowSize(int32_t* rows, int32_t* cols) {
	struct winsize ws;

	if(ioctl(STDOUT_FILENO, TIOCGWINSZ, &ws) == -1 || ws.ws_col == 0) {
		if(write(STDOUT_FILENO, "\x1b[999C\x1b[999B", 12) != 12)
			return -1;
		return getCursorPosition(rows, cols);
	} else {
		*cols = ws.ws_col;
		*rows = ws.ws_row;
		return 0;
	}
}

/*** output ***/
void editorDrawRows() {
	for(int32_t y = 0; y < E.screenRows; y++) {
		write(STDOUT_FILENO, "~\r\n", 3);

		if(y == E.screenRows-1)
			write(STDOUT_FILENO, "~\r", 3);
	}
}

void editorRefreshScreen() {
	write(STDOUT_FILENO, "\x1b[2J", 4);
	write(STDOUT_FILENO, "\x1b[H", 4);

	editorDrawRows();
	write(STDOUT_FILENO, "\x1b[H", 3);
}

/*** input ***/
void editorProcessKeypress() {
	char c = editorReadKey();

	switch(c) {
		case CTRL_KEY('q'):
			write(STDOUT_FILENO, "\x1b[2J", 4);
			write(STDOUT_FILENO, "\x1b[H", 4);
			exit(0);
			break;
	}
}

/*** init ***/
void initEditor() {
	if(getWindowSize(&E.screenRows, &E.screenCols) == -1)
		die("getWindowSize");
}

int main() {
	enableRawMode();
	initEditor();

	while(1) {
		editorRefreshScreen();
		editorProcessKeypress();
	}

	return 0;
}
