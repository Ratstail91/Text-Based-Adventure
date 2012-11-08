#include <iostream>
#include <string>
using namespace std;

enum GameState {
	NORMAL,
	QUIT
};

GameState dolook(string s) {
	cout << "You look around and see a bed" << endl;
	return NORMAL;
}

GameState dosleep(string s) {
	cout << "You get into bed, and drift off to sleep" << endl;
	cout << "You wake up, and get out of bed" << endl;
	return NORMAL;
}

GameState parse(string s) {
	if (s == "look") {
		return dolook(s);
	}

	if (s == "sleep") {
		return dosleep(s);
	}

	if (s == "quit") {
		return QUIT;
	}
}

int main(int, char**) {
	GameState state = NORMAL;

	string buffer;

	while (state != QUIT) {
		getline(cin, buffer);

		state = parse(buffer);
	}

	cout << "Thanks for playing!" << endl;
	return 0;
}
