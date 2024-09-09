# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
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
# 2 "game.c" 2
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
# 3 "game.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 4 "game.c" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];

struct attr0 {
  u16 regular;
  u16 affine;
  u16 hide;
  u16 double_affine;
  u16 enable_alpha;
  u16 enable_window;
  u16 enable_mosaic;
  u16 fourBpp;
  u16 eightBpp;
  u16 square;
  u16 wide;
  u16 tall;
};

struct attr1 {
  u16 hflip;
  u16 vflip;
  u16 tiny;
  u16 small;
  u16 medium;
  u16 large;
};

struct oam_attrs {
  struct attr0 attr0;
  struct attr1 attr1;
};
# 93 "sprites.h"
void hideSprites();


typedef struct {
    int x;
    int y;
    int xVel;
    int yVel;
    int width;
    int height;
    int timeUntilNextFrame;
    int direction;
    int isAnimating;
    int currentFrame;
    int numFrames;
    u8 oamIndex;
} SPRITE;
# 5 "game.c" 2
# 1 "player.h" 1
# 10 "player.h"
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
# 6 "game.c" 2
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
# 7 "game.c" 2

int activeShrooms;
extern int currentLevel;
int rand();
int lastContact;

extern int lastPos;
extern int score;

void initGame() {
    initShrooms();
    if (currentLevel == 1) {
        activateShrooms(32);
    } else {
        activateShrooms(64);
    }
    initPlayer();
    initBullets();
    initCentipede();
}

void updateGame() {
    updatePlayer();
    updateBullets();
    updateCentipede();
    updateShrooms();


}

void drawGame() {
    drawPlayer();
    drawBullets();
    drawCentipede();
    drawShrooms();
}

void initShrooms() {
    mgba_printf("init shrooms!");
    for (int i = 0; i < 74; i++) {
        mushroomField[i].x = 0;
        mushroomField[i].y = 0;
        mushroomField[i].width = 8;
        mushroomField[i].height = 8;
        mushroomField[i].active = 0;
        mushroomField[i].oamIndex = i + 5;
    }
}

void activateShrooms(int numShrooms) {
        mgba_printf("activated shrooms!");
        for (int i = 0; i < numShrooms; i++) {
            int xLower = 0;
            int xMax = 29;
            int yLower = 2;
            int yMax = 18;
            mushroomField[i].x = rand() % (xMax - xLower + 1) + xLower;
            mushroomField[i].y = rand() % (yMax - yLower + 1) + yLower;
            mushroomField[i].active = 1;

            mgba_printf("shroom activated at %d, %d, is active %d", mushroomField[i].x, mushroomField[i].y, mushroomField[i].active);
        }
        activeShrooms = numShrooms;
# 78 "game.c"
}
void updateShrooms() {
    for (int j = 0; j < 74; j++) {
        if (mushroomField[j].active) {
            for (int i = 0; i < 1; i++) {
                if (collision((bullets[i].x + 2), (bullets[i].y + 2), bullets[i].width, bullets[i].height,
                    (mushroomField[j].x * 8), (mushroomField[j].y * 8), mushroomField[j].width, mushroomField[j].height) && bullets[i].active) {

                    mushroomField[j].active = 0;
                    bullets[i].active = 0;
                    score += 10;
                    mgba_printf("score: %d", score);




                }
            }
            for (int i = 0; i < 10; i++) {
                if (collision(centipede[i].x + centipede[i].xVel, centipede[i].y, centipede[i].width, centipede[i].height,
                (mushroomField[j].x * 8), (mushroomField[j].y * 8), mushroomField[j].width, mushroomField[j].height) && centipede[i].active) {
                    (((SB*) 0x6000000)[8].tilemap[(((centipede[i].oldY / 8)) * (32) + ((centipede[i].oldX / 8)))] = (BACKGROUND_ID));
                    centipede[i].oldX = centipede[i].x;
                    centipede[i].oldY = centipede[i].y;
                    centipede[i].y += centipede[i].yVel;
                    centipede[i].xVel *= -1;
                    centipede[i].direction = DOWN;
                    if (centipede[i].position == lastPos) {
                        (((SB*) 0x6000000)[8].tilemap[((centipede[i].oldY / 8) * (32) + (centipede[i].oldX / 8))] = (BACKGROUND_ID));
                    }
                }
            }
        }
    }
}

void newShroom(int x, int y) {
    activeShrooms++;
    mushroomField[activeShrooms].x = x;
    mushroomField[activeShrooms].y = y;
    mushroomField[activeShrooms].active = 1;
    mgba_printf("new shroom called");
}

void drawShrooms() {
    for (int i = 0; i < activeShrooms; i++) {
        if (mushroomField[i].active) {

            (((SB*) 0x6000000)[8].tilemap[((mushroomField[i].y) * (32) + (mushroomField[i].x))] = (SHROOM_ID | ((3 & 15) << 12)));
        } else {

            (((SB*) 0x6000000)[8].tilemap[((mushroomField[i].y) * (32) + (mushroomField[i].x))] = (BACKGROUND_ID));
        }
    }

}

void clearAll() {
    for (int i = 0; i < 74; i++) {
        mushroomField[i].active = 0;
    }
    for (int i = 0; i < 30 * 20; i++) {
        (((SB*) 0x6000000)[8].tilemap[((0) * (32) + (i))] = (BACKGROUND_ID));
        (((SB*) 0x6000000)[21].tilemap[((0) * (32) + (i))] = (BACKGROUND_ID));
    }

}

void clearBG() {
        for (int i = 0; i < 30 * 20; i++) {
        (((SB*) 0x6000000)[8].tilemap[((0) * (32) + (i))] = (BACKGROUND_ID));
        (((SB*) 0x6000000)[21].tilemap[((0) * (32) + (i))] = (BACKGROUND_ID));
    }
}
