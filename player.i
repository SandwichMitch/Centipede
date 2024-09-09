# 1 "player.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "player.c"
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
# 2 "player.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "player.c" 2

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
# 5 "player.c" 2
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
# 6 "player.c" 2
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
# 7 "player.c" 2

extern int activeShrooms;
extern int lastPos;
SPRITE player;
extern int score;


void initPlayer() {
    player.height = 8;
    player.width = 8;
    player.x = 0;
    player.y = 160 - player.height;
    player.xVel = 2;
    player.oamIndex = 0;
}

void initBullets() {
    for (int i = 0; i < 1; i++) {
        bullets[i].height = 6;
        bullets[i].width = 1;

        bullets[i].x = 0;
        bullets[i].y = 160 - bullets[i].height;
        bullets[i].yVel = 4;
        bullets[i].active = 0;
        bullets[i].oamIndex = i + 1;
    }
}

void updatePlayer() {
    if ((~(buttons) & ((1<<5))) && player.x > 0) {
        player.x -= player.xVel;
    }
    if ((~(buttons) & ((1<<4))) && player.x + player.width < 240) {
        player.x += player.xVel;
    }
}

void updateBullets() {
    if ((!(~(oldButtons) & ((1<<0))) && (~buttons & ((1<<0))))) {
        fireBullet();
    }
    for (int i = 0; i < 1; i++) {
        if (bullets[i].active) {
            bullets[i].y -= bullets[i].yVel;
                            for (int j = 0; j < 10; j++) {
                if (collision(centipede[j].x, centipede[j].y, centipede[j].width, centipede[j].height,
                bullets[i].x, bullets[i].y, bullets[i].width, bullets[i].height)) {
                    mgba_printf("hit segment %d! at %d, %d", centipede[j].position, centipede[j].x, centipede[j].y);
                    for (int r = centipede[j].position; r <= lastPos; r++) {
                        score += 100;
                        mgba_printf("score: %d", score);
                        centipede[r].active = 0;

                        mgba_printf("new shroom at %d, %d, from segment %d", centipede[r].x, centipede[r].y, centipede[r].position);
                        newShroom(centipede[r].x / 8, centipede[r].y / 8);
                    }
                    if (centipede[j].position != 0) {
                        lastPos = centipede[j].position - 1;
                    } else {
                        lastPos = 0;
                    }
                }
            }
# 85 "player.c"
            if (bullets[i].y + 2 <= 0) {
                bullets[i].x = 0;
                bullets[i].y = 160 - bullets[i].height;
                bullets[i].active = 0;
            }

        }
    }
}

void fireBullet() {

    for (int i = 0; i < 1; i++) {
        if (!bullets[i].active) {
            bullets[i].x = player.x;
            bullets[i].y = player.y - bullets[i].height;
            bullets[i].active = 1;
            break;
        }
    }
}
void drawPlayer() {
    shadowOAM[player.oamIndex].attr0 = (0<<13) | (0<<8) | (0<<14) | ((player.y) & 0xFF);
    shadowOAM[player.oamIndex].attr1 = (0<<14) | ((player.x) & 0x1FF);
    shadowOAM[player.oamIndex].attr2 = (((0) & 0xF) <<12) | ((((10) * (32) + (2))) & 0x3FF) | (((3) & 0xF) <<12);
}

void drawBullets() {
    for (int i = 0; i < 1; i++) {
        if (bullets[i].active) {
            shadowOAM[bullets[i].oamIndex].attr0 = (0<<13) | (0<<8) | (0<<14) | ((bullets[i].y) & 0xFF);
            shadowOAM[bullets[i].oamIndex].attr1 = (0<<14) | ((bullets[i].x) & 0x1FF);
            shadowOAM[bullets[i].oamIndex].attr2 = (((1) & 0xF) <<12) | ((((10) * (32) + (3))) & 0x3FF);
        } else {
            shadowOAM[bullets[i].oamIndex].attr0 = (2<<8);
        }
    }
}
