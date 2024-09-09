# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "main.c" 2
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
# 4 "main.c" 2
# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 5 "main.c" 2
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
# 6 "main.c" 2
# 1 "numbersandletterstiles.h" 1
# 21 "numbersandletterstiles.h"
extern const unsigned short numbersandletterstilesTiles[8192];


extern const unsigned short numbersandletterstilesPal[256];
# 7 "main.c" 2
# 1 "hw5tiles.h" 1
# 21 "hw5tiles.h"
extern const unsigned short hw5tilesTiles[16384];


extern const unsigned short hw5tilesPal[256];
# 8 "main.c" 2

void initialize();
void start();
void goToStart();
void game();
void goToLevel1();
void pause();
void goToPause();
void lose();
void goToLose();
void tilePrinter(char* string, int x, int y, int sb);
void srand();

unsigned short buttons;
unsigned short oldButtons;
char scoreBuffer[7] = "000000";

int score;
int rSeed;
int currentLevel;
int lost;

extern int segmentsDestroyed;

enum {
    START,
    LEVEL1,
    LEVEL2,
    PAUSE,
    WIN,
    LOSE
} state;
int main() {
    initialize();


    while (1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);

        switch(state) {
            case START:
                start();
                break;
            case LEVEL1:
                game();
                break;
            case LEVEL2:
                level2();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
    }

    return 0;
}

void initialize() {
    mgba_open();
    buttons = (*(volatile unsigned short *)0x04000130);
    oldButtons = 0;

    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | ((1 << (8 + (0 % 4)))) | ((1 << (8 + (1 % 4)))) | (1 << 12);

    (*(volatile unsigned short*) 0x4000008) = ((0) << 2) | ((8) << 8) | 1;
    (*(volatile unsigned short*) 0x400000A) = ((3) << 2) | ((21) << 8) | 0;

    DMANow(3, hw5tilesPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, hw5tilesTiles, &((CB*) 0x6000000)[0], 32768 / 2);
    DMANow(3, hw5tilesTiles, &((CB*) 0x6000000)[3], 32768 / 2);



    goToStart();
}

void start() {


    lost = 0;
    rSeed++;
    tilePrinter("CENTIPEDE", 10, 9, 8);
    tilePrinter("PRESS START TO PLAY", 5, 10, 8);

    if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        srand(rSeed);
        currentLevel = 1;
        initGame();
        goToLevel1();
    }
}

void goToStart() {
    clearBG();
    sprintf(scoreBuffer, "000000");
    rSeed = 0;
    score = 0;
    state = START;
}

void game() {

    updateGame();
    sprintf(scoreBuffer, "%06d", score);
    drawGame();
    tilePrinter("SCORE", 0, 0, 21);
    tilePrinter(scoreBuffer, 7, 0, 21);
    tilePrinter("LEVEL 1", 23, 0, 21);
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    if ((!(~(oldButtons) & ((1<<2))) && (~buttons & ((1<<2))))) {
        goToPause();
    }
    if (segmentsDestroyed >= 10) {
            clearAll();
    currentLevel = 2;
    initGame();
        goToLevel2();
    }
    if (lost) {
        goToLose();
    }
}

void level2() {

    updateGame();
    sprintf(scoreBuffer, "%06d", score);
    drawGame();

    waitForVBlank();
    tilePrinter("SCORE", 0, 0, 21);
    tilePrinter(scoreBuffer, 7, 0, 21);
    tilePrinter("LEVEL 2", 23, 0, 21);
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    if ((!(~(oldButtons) & ((1<<2))) && (~buttons & ((1<<2))))) {
        goToPause();
    }
    if (segmentsDestroyed >= 10) {
        goToWin();
    }
    if (lost) {
        goToLose();
    }
}

void goToLevel1() {
    clearBG();
    currentLevel = 1;
    DMANow(3, hw5tilesPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, hw5tilesTiles, &((CB*) 0x6000000)[0], 32768 / 2);


    DMANow(3, hw5tilesTiles, &((CB*) 0x6000000)[4], 32768 / 2);
    DMANow(3, hw5tilesPal, ((u16 *)0x5000200), 256);


    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    state = LEVEL1 ;
}

void goToLevel2() {


    clearBG();
    state = LEVEL2;
}
void pause() {

    tilePrinter("YOU HAVE PAUSED", 8, 9, 21);
    tilePrinter("PRESS SELECT TO RESUME", 4, 10, 21);
    tilePrinter("PRESS START TO PLAY AGAIN", 3, 11, 8);
    if ((!(~(oldButtons) & ((1<<2))) && (~buttons & ((1<<2)))) && currentLevel == 1) {
        goToLevel1();
    }
    if ((!(~(oldButtons) & ((1<<2))) && (~buttons & ((1<<2)))) && currentLevel == 2) {
        goToLevel2();
    }
    if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        clearAll();
        goToStart();
    }
}

void goToPause() {
    clearBG();
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    state = PAUSE;
}

void lose() {
    tilePrinter("YOU LOST", 12, 9, 8);
    tilePrinter("PRESS START TO PLAY AGAIN", 3, 10, 8);
    if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }
}

void goToLose() {
    clearAll();
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    state = LOSE;
}

void win() {
    tilePrinter("YOU WON", 12, 9, 8);
    tilePrinter("PRESS START TO PLAY AGAIN", 3, 10, 8);
    if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }
}

void goToWin() {
    clearAll();
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    state = WIN;
}

void tilePrinter(char* string, int x, int y, int sb) {
    int thisX = x;
    int tileID;
    while (*string != '\0') {
        char currChar = *string;




    switch (currChar) {
        case '0':
            tileID = 42;
            break;
        case '1':
            tileID = 44;
            break;
        case '2':
            tileID = 46;
            break;
        case '3':
            tileID = 48;
            break;
        case '4':
            tileID = 50;
            break;
        case '5':
            tileID = 52;
            break;
        case '6':
            tileID = 54;
            break;
        case '7':
            tileID = 56;
            break;
        case '8':
            tileID = 58;
            break;
        case '9':
            tileID = 60;
            break;
        case 'A':
            tileID = 106;
            break;
        case 'B':
            tileID = 108;
            break;
        case 'C':
            tileID = 110;
            break;
        case 'D':
            tileID = 112;
            break;
        case 'E':
            tileID = 114;
            break;
        case 'F':
            tileID = 116;
            break;
        case 'G':
            tileID = 118;
            break;
        case 'H':
            tileID = 120;
            break;
        case 'I':
            tileID = 122;
            break;
        case 'J':
            tileID = 124;
            break;
        case 'K':
            tileID = 170;
            break;
        case 'L':
            tileID = 172;
            break;
        case 'M':
            tileID = 174;
            break;
        case 'N':
            tileID = 176;
            break;
        case 'O':
            tileID = 178;
            break;
        case 'P':
            tileID = 180;
            break;
        case 'Q':
            tileID = 182;
            break;
        case 'R':
            tileID = 184;
            break;
        case 'S':
            tileID = 186;
            break;
        case 'T':
            tileID = 188;
            break;
        case 'U':
            tileID = 234;
            break;
        case 'V':
            tileID = 236;
            break;
        case 'W':
            tileID = 238;
            break;
        case 'X':
            tileID = 240;
            break;
        case 'Y':
            tileID = 242;
            break;
        case 'Z':
            tileID = 244;
            break;
        case ':':
            tileID = 252;
        default:
            tileID = -1;
            break;
    }
        (((SB*) 0x6000000)[sb].tilemap[((y) * (32) + (thisX))] = (tileID));
        thisX++;
        string++;
    }

}
