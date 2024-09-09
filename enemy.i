# 1 "enemy.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "enemy.c"
# 1 "enemy.h" 1







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

    int position;
    int direction;
    int active;
} CENTIPEDE_SEGMENT;

CENTIPEDE_SEGMENT centipede[10];
# 2 "enemy.c" 2
# 1 "player.h" 1



# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
typedef void (*ihp)(void);






extern volatile unsigned short *videoBuffer;
# 48 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 67 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 99 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 5 "player.h" 2





void initPlayer();
void initBullets();
void updatePlayer();
void updateBullets();
void fireBullet();
void drawPlayer();
void drawBullets();



typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int width;
    int height;
    int xVel;
} PLAYER;

typedef struct {
    int x;
    int y;
    int width;
    int height;
    int yVel;
    int active;
    u8 oamIndex;
} BULLET;



BULLET bullets[1];
# 3 "enemy.c" 2
# 1 "game.h" 1
# 10 "game.h"
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

MUSHROOM mushroomField[74];


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
# 4 "enemy.c" 2

# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 6 "enemy.c" 2

extern int activeShrooms;
extern int lost;
int timeUntilMove;
int segmentsDestroyed;
int lastPos;


void initCentipede() {
    for (int i = 0; i < 10; i++) {
        if (i == 0) {
            centipede[i].head = 1;
        } else {
            centipede[i].head = 0;
        }
        centipede[i].x = 80 - 8 * i;
        centipede[i].oldX = centipede[i].x;
        centipede[i].y = 8;
        centipede[i].oldY = centipede[i].y;
        centipede[i].xVel = 8;
        centipede[i].yVel = 8;
        centipede[i].active = 1;
        centipede[i].width = 8;
        centipede[i].height = 8;
        centipede[i].direction = RIGHT;
        centipede[i].oldDirection = RIGHT;
        centipede[i].position = i;
    }
    timeUntilMove = 10;
    lastPos = 9;
}

void updateCentipede() {
    timeUntilMove--;
    segmentsDestroyed = 0;
    for (int i = 0; i < 10; i++) {
        if (centipede[i].active) {
            centipede[i].oldDirection = centipede[i].direction;
            centipede[i].oldX = centipede[i].x;
            centipede[i].oldY = centipede[i].y;
            if (centipede[i].y >= 160 - 8) {
                lost = 1;
            }
            if (timeUntilMove == 0) {







                if (centipede[i].x + centipede[i].xVel >= 240 || centipede[i].x + centipede[i].xVel < 0) {
                    mgba_printf("hit wall, going down!");

                    centipede[i].y += centipede[i].yVel;
                    centipede[i].xVel *= -1;
                    centipede[i].direction = DOWN;
                } else {
                    centipede[i].x += centipede[i].xVel;
                    if (centipede[i].xVel < 0) {
                        centipede[i].direction = LEFT;
                    } else {
                        centipede[i].direction = RIGHT;
                    }
                }
# 90 "enemy.c"
            }
        } else {
            segmentsDestroyed++;

        }
    }

    if (timeUntilMove == 0) {
        timeUntilMove = 15;
    }
}

void moveCentipedeHelper() {


}
void drawCentipede() {
    for (int i = 0; i < 10; i++) {
        if (centipede[i].active) {
            (((SB*) 0x6000000)[8].tilemap[(((centipede[i].oldY / 8)) * (32) + ((centipede[i].oldX / 8)))] = (BACKGROUND_ID));
            if (centipede[i].head) {
                if (centipede[i].direction == RIGHT) {
                    (((SB*) 0x6000000)[8].tilemap[(((centipede[i].y / 8)) * (32) + ((centipede[i].x / 8)))] = (HEAD_ID | ((2 & 15) << 12)));
                } else if (centipede[i].direction == LEFT) {
                    (((SB*) 0x6000000)[8].tilemap[(((centipede[i].y / 8)) * (32) + ((centipede[i].x / 8)))] = (HEAD_ID | ((2 & 15) << 12) | (1 << 10)));
                } else {
                    (((SB*) 0x6000000)[8].tilemap[(((centipede[i].y / 8)) * (32) + ((centipede[i].x / 8)))] = (HEAD_DOWN_ID | ((2 & 15) << 12)));
                }
            } else if (centipede[i].position == lastPos) {

                (((SB*) 0x6000000)[8].tilemap[(((centipede[i].oldY / 8)) * (32) + ((centipede[i].oldX / 8)))] = (BACKGROUND_ID));

            } else {
                if (centipede[i].direction == RIGHT) {
                    (((SB*) 0x6000000)[8].tilemap[(((centipede[i].y / 8)) * (32) + ((centipede[i].x / 8)))] = (SEGMENT_ID | ((2 & 15) << 12)));
                } else if (centipede[i].direction == LEFT) {
                    (((SB*) 0x6000000)[8].tilemap[(((centipede[i].y / 8)) * (32) + ((centipede[i].x / 8)))] = (SEGMENT_ID | ((2 & 15) << 12) | (1 << 10)));
                } else {
                    (((SB*) 0x6000000)[8].tilemap[(((centipede[i].y / 8)) * (32) + ((centipede[i].x / 8)))] = (SEG_DOWN_ID | ((2 & 15) << 12)));
                }
            }

        } else {

        }
    }
}
