#include "game.h"
#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "player.h"
#include "enemy.h"

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
    for (int i = 0; i < MAX_SHROOMS; i++) {
        mushroomField[i].x = 0;
        mushroomField[i].y = 0;
        mushroomField[i].width = MUSHROOM_WIDTH;
        mushroomField[i].height = MUSHROOM_HEIGHT;
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
            //setTile(mushroomField[i].x, mushroomField[i].y, SHROOM_ID | TILEMAP_ENTRY_PALROW(3), 8);
            mgba_printf("shroom activated at %d, %d, is active %d", mushroomField[i].x, mushroomField[i].y, mushroomField[i].active);
        }
        activeShrooms = numShrooms;
        //testing purposes
        // for (int i = 0; i < activeShrooms; i++) {
        //     mushroomField[i].x = i;
        //     //mushroomField[i].y = i * MUSHROOM_HEIGHT + MUSHROOM_HEIGHT;
        //     mushroomField[i].active = 1;
        //     mgba_printf("shroom activated at %d, %d, is active %d", mushroomField[i].x, mushroomField[i].y, mushroomField[i].active);
        // }

}
void updateShrooms() {
    for (int j = 0; j < MAX_SHROOMS; j++) {
        if (mushroomField[j].active) {
            for (int i = 0; i < MAX_BULLETS; i++) {
                if (collision((bullets[i].x + 2), (bullets[i].y + 2), bullets[i].width, bullets[i].height, 
                    (mushroomField[j].x * 8), (mushroomField[j].y * 8), mushroomField[j].width, mushroomField[j].height) && bullets[i].active) {
                    
                    mushroomField[j].active = 0;
                    bullets[i].active = 0;
                    score += 10;
                    mgba_printf("score: %d", score);
                    //setTile(mushroomField[i].x, mushroomField[i].y, BACKGROUND_ID, 8);
                    //mgba_printf("bullet x and y, %d, %d", bullets[i].x, bullets[i].y);
                    //mgba_printf("shot mushroom at %d, %d with width %d, and height %d! It is now active: %d", mushroomField[j].x * 8, mushroomField[j].y * 8, mushroomField[j].width, mushroomField[j].height, mushroomField[j].active);
                    //mgba_printf("original x and y are %d, %d", mushroomField[j].x, mushroomField[j].y);
                }
            }
            for (int i = 0; i < NUM_SEGMENTS; i++) {
                if (collision(centipede[i].x + centipede[i].xVel, centipede[i].y, centipede[i].width, centipede[i].height, 
                (mushroomField[j].x * 8), (mushroomField[j].y * 8), mushroomField[j].width, mushroomField[j].height) && centipede[i].active) {
                    setTile((centipede[i].oldX / 8), (centipede[i].oldY / 8), BACKGROUND_ID, 8);
                    centipede[i].oldX = centipede[i].x;
                    centipede[i].oldY = centipede[i].y;
                    centipede[i].y += centipede[i].yVel;
                    centipede[i].xVel *= -1;
                    centipede[i].direction = DOWN;
                    if (centipede[i].position == lastPos) {
                        setTile(centipede[i].oldX / 8, centipede[i].oldY / 8, BACKGROUND_ID, 8);
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
            //mgba_printf("shroom drawn!");
            setTile(mushroomField[i].x, mushroomField[i].y, SHROOM_ID | TILEMAP_ENTRY_PALROW(3), 8);
        } else {
            //mgba_printf("shroom erased");
            setTile(mushroomField[i].x, mushroomField[i].y, BACKGROUND_ID, 8);
        }
    }

}

void clearAll() {
    for (int i = 0; i < MAX_SHROOMS; i++) {
        mushroomField[i].active = 0;
    }
    for (int i = 0; i < 30 * 20; i++) {
        setTile(i, 0, BACKGROUND_ID, 8);
        setTile(i, 0, BACKGROUND_ID, 21);
    }

}

void clearBG() {
        for (int i = 0; i < 30 * 20; i++) {
        setTile(i, 0, BACKGROUND_ID, 8);
        setTile(i, 0, BACKGROUND_ID, 21);
    }
}

