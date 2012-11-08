#include "first_order.h"

#include "game_state.h"

#include <stdio.h>

#define BUFSIZE 512

int main(int argc, char* argv[]) {
	int state = NORMAL;
	char buffer[BUFSIZE];

	while (state != QUIT) {
		printf(">");
		fgets(buffer, BUFSIZE, stdin);

		state = parse(buffer);

		if (state == PARSE_ERROR) {
			printf("Parse error (%d): %s\n",strlen(buffer), buffer);
		}
	}

	return 0;
}
