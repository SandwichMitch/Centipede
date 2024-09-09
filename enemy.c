#include "enemy.h"
#include "player.h"
#include "game.h"
#include "gba.h"
#include "mode0.h"

extern int activeShrooms;
extern int lost;
int timeUntilMove;
int segmentsDestroyed;
int lastPos;
//extern int willCollide;

void initCentipede() {
    for (int i = 0; i < NUM_SEGMENTS; i++) {
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
        centipede[i].width = SEGMENT_WIDTH;
        centipede[i].height = SEGMENT_HEIGHT;
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
    for (int i = 0; i < NUM_SEGMENTS; i++) {
        if (centipede[i].active) {
            centipede[i].oldDirection = centipede[i].direction;
            centipede[i].oldX = centipede[i].x;
            centipede[i].oldY = centipede[i].y;
            if (centipede[i].y >= SCREENHEIGHT - PLAYER_HEIGHT) {
                lost = 1;
            }
            if (timeUntilMove == 0) {
                //if (collision(centipede[i].x + centipede[i].xVel, centipede[i].y + centipede[i].yVel, centipede[i].width, centipede[i].head))
                //int goingToHitShroom;
                // for (int j = 0; j < activeShrooms; i++) {
                //     goingToHitShroom = collision(centipede[i].x + centipede[i].xVel, centipede[i].y, centipede[i].width, centipede[i].height, 
                //     (mushroomField[j].x * 8), (mushroomField[j].y * 8), mushroomField[j].width, mushroomField[j].height);
                // }
                //mgba_printf("will hit shroom %d", willCollide);
                if (centipede[i].x + centipede[i].xVel >= SCREENWIDTH || centipede[i].x + centipede[i].xVel < 0) {
                    mgba_printf("hit wall, going down!");
                    //centipede[i].direction = DOWN;
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
                // switch (centipede[i].direction) {
                //     case LEFT:
                //         centipede[i].xVel = -8;
                //         centipede[i].x += centipede[i].xVel;
                //         break;
                //     case RIGHT:
                //         centipede[i].xVel = 8;
                //         centipede[i].x += centipede[i].xVel;
                //         break;
                //     case DOWN:
                //         centipede[i].y += centipede[i].yVel;
                //         if (centipede[i].oldDirection == RIGHT) {
                //             mgba_printf("switched to left!");
                //             centipede[i].direction = LEFT;
                //         } else {
                //             centipede[i].direction = RIGHT;
                //         }
                //         break;
                // }
            }
        } else {
            segmentsDestroyed++;
            
        }
    }
    //mgba_printf("segments left: %d", 10 - segmentsDestroyed);
    if (timeUntilMove == 0) {
        timeUntilMove = 15;
    }
}

void moveCentipedeHelper() {


}
void drawCentipede() {
    for (int i = 0; i < NUM_SEGMENTS; i++) {
        if (centipede[i].active) {
            setTile((centipede[i].oldX / 8), (centipede[i].oldY / 8), BACKGROUND_ID, 8);
            if (centipede[i].head) {
                if (centipede[i].direction == RIGHT) {
                    setTile((centipede[i].x / 8), (centipede[i].y / 8), HEAD_ID | TILEMAP_ENTRY_PALROW(2), 8);
                } else if (centipede[i].direction == LEFT) {
                    setTile((centipede[i].x / 8), (centipede[i].y / 8), HEAD_ID | TILEMAP_ENTRY_PALROW(2) | TILEMAP_ENTRY_HFLIP, 8);
                } else {
                    setTile((centipede[i].x / 8), (centipede[i].y / 8), HEAD_DOWN_ID | TILEMAP_ENTRY_PALROW(2), 8);
                }
            } else if (centipede[i].position == lastPos) {
                //mgba_printf("last pos now %d", lastPos);
                setTile((centipede[i].oldX / 8), (centipede[i].oldY / 8), BACKGROUND_ID, 8);
                //setTile((centipede[i].oldX / 8), (centipede[i].oldY / 8) - 1, BACKGROUND_ID, 8);
            } else {
                if (centipede[i].direction == RIGHT) {
                    setTile((centipede[i].x / 8), (centipede[i].y / 8), SEGMENT_ID | TILEMAP_ENTRY_PALROW(2), 8);
                } else if (centipede[i].direction == LEFT) {
                    setTile((centipede[i].x / 8), (centipede[i].y / 8), SEGMENT_ID | TILEMAP_ENTRY_PALROW(2) | TILEMAP_ENTRY_HFLIP, 8);
                } else {
                    setTile((centipede[i].x / 8), (centipede[i].y / 8), SEG_DOWN_ID | TILEMAP_ENTRY_PALROW(2), 8);
                }
            }

        } else {
            //setTile(mushroomField[i].x, mushroomField[i].y, SHROOM_ID, 8);
        }
    }
}