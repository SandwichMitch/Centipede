#include "player.h"
#include "mode0.h"
#include "gba.h"
#include "sprites.h"
#include "game.h"
#include "enemy.h"

extern int activeShrooms;
extern int lastPos;
SPRITE player;
extern int score;


void initPlayer() {
    player.height = PLAYER_HEIGHT;
    player.width = PLAYER_WIDTH;
    player.x = 0;
    player.y = SCREENHEIGHT - player.height;
    player.xVel = PLAYER_VELOCITY;
    player.oamIndex = 0;
}

void initBullets() {
    for (int i = 0; i < MAX_BULLETS; i++) {
        bullets[i].height = 6;
        bullets[i].width = 1;
        //edit collision to accommodate
        bullets[i].x = 0;
        bullets[i].y = SCREENHEIGHT - bullets[i].height;
        bullets[i].yVel = 4;
        bullets[i].active = 0;
        bullets[i].oamIndex = i + 1;
    }
}

void updatePlayer() {
    if (BUTTON_HELD(BUTTON_LEFT) && player.x > 0) {
        player.x -= player.xVel;
    }
    if (BUTTON_HELD(BUTTON_RIGHT) && player.x + player.width < SCREENWIDTH) {
        player.x += player.xVel;
    }
}

void updateBullets() {
    if (BUTTON_PRESSED(BUTTON_A)) {
        fireBullet();
    }
    for (int i = 0; i < MAX_BULLETS; i++) {
        if (bullets[i].active) {
            bullets[i].y -= bullets[i].yVel;
                            for (int j = 0; j < NUM_SEGMENTS; j++) {
                if (collision(centipede[j].x, centipede[j].y, centipede[j].width, centipede[j].height, 
                bullets[i].x, bullets[i].y, bullets[i].width, bullets[i].height)) {
                    mgba_printf("hit segment %d! at %d, %d", centipede[j].position, centipede[j].x, centipede[j].y);
                    for (int r = centipede[j].position; r <= lastPos; r++) {
                        score += 100;
                        mgba_printf("score: %d", score);
                        centipede[r].active = 0;
                        //setTile(centipede[r].x / 8, centipede[r].y / 8, BACKGROUND_ID, 8);
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
            //mgba_printf("bullets x and y: %d, %d", bullets[i].x, bullets[i].y);
            //mgba_printf("bullet x is %d", bullets[i].x);
            //mgba_printf("active shrooms, %d", activeShrooms);
            // for (int j = 0; j < activeShrooms; j++) {
            //     //mgba_printf(mgba_printf("shroom at %d, %d with width %d, and height %d! It is now active: %d", mushroomField[i].x * 8, mushroomField[i].y * 8, mushroomField[i].width, mushroomField[i].height, mushroomField[i].active));
            //     if (collision((bullets[i].x + 2), (bullets[i].y + 2), bullets[i].width, bullets[i].height, 
            //         (mushroomField[j].x * 8), (mushroomField[j].y * 8), mushroomField[j].width, mushroomField[j].height)) {
                    
            //         mushroomField[j].active = 0;
            //         mgba_printf("bullet x and y, %d, %d", bullets[i].x, bullets[i].y);
            //         mgba_printf("shot mushroom at %d, %d with width %d, and height %d! It is now active: %d", mushroomField[j].x * 8, mushroomField[j].y * 8, mushroomField[j].width, mushroomField[j].height, mushroomField[j].active);
            //         mgba_printf("original x and y are %d, %d", mushroomField[j].x, mushroomField[j].y);
            //     }
            // }
            if (bullets[i].y + 2 <= 0) {
                bullets[i].x = 0;
                bullets[i].y = SCREENHEIGHT - bullets[i].height;
                bullets[i].active = 0;
            }
            
        }
    }
}

void fireBullet() {
    //int fired = 0;
    for (int i = 0; i < MAX_BULLETS; i++) {
        if (!bullets[i].active) {
            bullets[i].x = player.x;
            bullets[i].y = player.y - bullets[i].height;
            bullets[i].active = 1;
            break;
        }
    }
}
void drawPlayer() {
    shadowOAM[player.oamIndex].attr0 = ATTR0_4BPP | ATTR0_REGULAR | ATTR0_SQUARE | ATTR0_Y(player.y);
    shadowOAM[player.oamIndex].attr1 = ATTR1_TINY | ATTR1_X(player.x);
    shadowOAM[player.oamIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(2, 10) | ATTR2_PALROW(3);
}

void drawBullets() {
    for (int i = 0; i < MAX_BULLETS; i++) {
        if (bullets[i].active) {
            shadowOAM[bullets[i].oamIndex].attr0 = ATTR0_4BPP | ATTR0_REGULAR | ATTR0_SQUARE | ATTR0_Y(bullets[i].y);
            shadowOAM[bullets[i].oamIndex].attr1 = ATTR1_TINY | ATTR1_X(bullets[i].x);
            shadowOAM[bullets[i].oamIndex].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(3, 10);
        } else {
            shadowOAM[bullets[i].oamIndex].attr0 = ATTR0_HIDE;
        }
    }
}