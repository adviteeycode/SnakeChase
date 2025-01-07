// these constant values are for offline mode (single player)
List<int> snake = [47, 48, 49, 50, 51];

int food = 230;

int score = 0;

enum Direction { up, down, left, right }

Direction currentDirection = Direction.right;

int speedOfSnake = 300; // initial speed in milliseconds

bool isGameRunning = false;

late int row;
late int col;

/////////////////////////////////////////////////////////////////////

// these constant values are for offline mode (multi-player)
