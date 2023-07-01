import sgf;

class Game1 : Game {
	this() {
		super("My Awesome Game");
	}

	override
	void draw() {
		
	}
}

void main() {
	Game1 game = new Game1();
	game.run();
}