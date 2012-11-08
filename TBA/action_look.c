#include "first_order.h"

#include "game_state.h"

#include <stdio.h>

int dolook(const char* str) {
	printf("You look around.\n");
	printf("You see a grue.\n");
	return NORMAL;
}
