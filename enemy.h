#ifndef ENEMY_H
#define ENEMY_H

#define NUM_SEGMENTS 10
#define SEGMENT_WIDTH 8
#define SEGMENT_HEIGHT 8 

void initCentipede();
void updateCentipede();
void moveCentipedeHelper();
void drawCentipede();

enum {
    LEFT,
    RIGHT,
    UP,
    DOWN
} direction;

typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int oldDirection;
    int xVel;
    int yVel;
    int width;
    int height;
    int head;
    //int tail;
    int position;
    int direction;
    int active;
} CENTIPEDE_SEGMENT;

CENTIPEDE_SEGMENT centipede[NUM_SEGMENTS];
#endif