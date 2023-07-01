module sgf.game;

private:

import arsd.simpledisplay;

public:

class Game {
private:
    SimpleWindow window;
    bool running = false;
    string title;
public:
    this(string title, bool resizable=false) {
        //setOpenGLContextVersion(3, 3);
        //openGLContextCompatible = false;
        this.title = title;
        window = new SimpleWindow(800, 600, this.title, OpenGlOptions.yes, resizable ? Resizability.allowResizing : Resizability.fixedSize);
    }

    void load() {}
    void update() {}
    void draw() {}

    void setClearColor() {
        
    }

    void run() {
        this.window.visibleForTheFirstTime = delegate() {
            load();
        };
        this.window.redrawOpenGlScene = delegate() {
            glLoadIdentity();
            draw();
        };
        running = true;
        this.window.eventLoop(60, () {
            update();
            this.window.redrawOpenGlSceneSoon();
        });
    }
}