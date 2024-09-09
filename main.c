#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "game.h"
#include "numbersandletterstiles.h"
#include "hw5tiles.h"

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
        buttons = REG_BUTTONS;

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
    buttons = REG_BUTTONS;
    oldButtons = 0;

    REG_DISPCTL = MODE(0) | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(8) | 1;
    REG_BG1CNT = BG_CHARBLOCK(3) | BG_SCREENBLOCK(21) | 0;

    DMANow(3, hw5tilesPal, BG_PALETTE, hw5tilesPalLen / 2);
    DMANow(3, hw5tilesTiles, &CHARBLOCK[0], hw5tilesTilesLen / 2);
    DMANow(3, hw5tilesTiles, &CHARBLOCK[3], hw5tilesTilesLen / 2);



    goToStart();
}

void start() {
    //setTile(0, 0, HEAD_DOWN_ID, 8);
    //tilePrinter("123", 1, 0, 8);
    lost = 0;
    rSeed++;
    tilePrinter("CENTIPEDE", 10, 9, 8);
    tilePrinter("PRESS START TO PLAY", 5, 10, 8);
    //mgba_printf("r seed is %d", rSeed);
    if (BUTTON_PRESSED(BUTTON_START)) {
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
    //mgba_printf("game");
    updateGame();
    sprintf(scoreBuffer, "%06d", score);
    drawGame();
    tilePrinter("SCORE", 0, 0, 21);
    tilePrinter(scoreBuffer, 7, 0, 21);
    tilePrinter("LEVEL 1", 23, 0, 21);
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
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
    DMANow(3, shadowOAM, OAM, 128 * 4);
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
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
    DMANow(3, hw5tilesPal, BG_PALETTE, hw5tilesPalLen / 2);
    DMANow(3, hw5tilesTiles, &CHARBLOCK[0], hw5tilesTilesLen / 2);

    //for sprites
    DMANow(3, hw5tilesTiles, &CHARBLOCK[4], hw5tilesTilesLen / 2);
    DMANow(3, hw5tilesPal, SPRITE_PAL, 256);


    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    state = LEVEL1 ;
}

void goToLevel2() {
    //setTile(0, 0, SHROOM_ID, 8);

    clearBG();
    state = LEVEL2;
}
void pause() {
    //hideSprites();
    tilePrinter("YOU HAVE PAUSED", 8, 9, 21);
    tilePrinter("PRESS SELECT TO RESUME", 4, 10, 21);
    tilePrinter("PRESS START TO PLAY AGAIN", 3, 11, 8);   
    if (BUTTON_PRESSED(BUTTON_SELECT) && currentLevel == 1) {
        goToLevel1();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT) && currentLevel == 2) {
        goToLevel2();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        clearAll();
        goToStart();
    }
}

void goToPause() {
    clearBG();
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    state = PAUSE;   
}

void lose() {
    tilePrinter("YOU LOST", 12, 9, 8);
    tilePrinter("PRESS START TO PLAY AGAIN", 3, 10, 8);
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToLose() {
    clearAll();
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    state = LOSE;
}

void win() {
    tilePrinter("YOU WON", 12, 9, 8);
    tilePrinter("PRESS START TO PLAY AGAIN", 3, 10, 8);
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToWin() {
    clearAll();
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    state = WIN;
}

void tilePrinter(char* string, int x, int y, int sb) {
    int thisX = x;
    int tileID;
    while (*string != '\0') {
        char currChar = *string;
            // Convert currChar to uppercase for case-insensitive comparison
    //currChar = toupper(currChar);

    // Check each character individually and assign tileID accordingly
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
            tileID = -1; // Set tileID to some other value if currChar is not within the specified range
            break;
    }
        setTile(thisX, y, tileID, sb);
        thisX++;
        string++;
    }

}
