#include "first_order.h"

#include "game_state.h"

#include <stdio.h>

int dohelp(const char* str) {
	printf("help\nType \"command [[arg]...]\" to interact with the game.\n");
	return NORMAL;
}
