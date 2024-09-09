#ifndef PLAYER_H
#define PLAYER_H

#include "gba.h"
#define PLAYER_WIDTH 8
#define PLAYER_HEIGHT 8
#define PLAYER_VELOCITY 2

#define MAX_BULLETS 1
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

//BULLET bulletArr[MAX_BULLETS];

BULLET bullets[MAX_BULLETS];
#endif