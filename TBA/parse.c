#include "first_order.h"

#include "game_state.h"

#include <string.h>

//int passargs(const char* str, const char

int parse(const char* str) {
	if (!stricmp(str, "help"))
		return dohelp(str);

	if (!stricmp(str, "help"))
		return dohelp(str);

	if (!stricmp(str, "look"))
		return dolook(str);

	if (!stricmp(str, "exit"))
		return doexit(str);

	return PARSE_ERROR;
}
