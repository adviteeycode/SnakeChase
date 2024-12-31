List<int> snake = [45, 46, 47, 48, 49];

bool isGameRunning = false;
int foodPosition = 47;
int score = 1;
int gameSpeed = 300;

enum Direction { up, down, left, right }

Direction snakeDirection = Direction.right;
