#ifndef GAME_H
#define GAME_H


#define MUSHROOM_HEIGHT 8
#define MUSHROOM_WIDTH 8

#define MAX_SHROOMS 74

enum {
    TRANSPARENT_ID = 0,
    BACKGROUND_ID = 1,
    HEAD_ID = 34,
    SEGMENT_ID = 36,
    HEAD_DOWN_ID = 98,
    SEG_DOWN_ID = 100,
    SHROOM_ID = 258,
} tileIDs;

typedef struct {
    int x;
    int y;
    int active;
    int width;
    int height;
    int oamIndex;
} MUSHROOM;

MUSHROOM mushroomField[MAX_SHROOMS];

//methods
void initGame();
void updateGame();
void drawGame();
void initShrooms();
void activateShrooms(int numShrooms);
void newShroom(int x, int y);
void updateShrooms();
void drawShrooms();
void clearAll();
void clearBG();



#endif