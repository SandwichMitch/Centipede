# HW05 CENTIPEDE
## CONTROLS
- Start: start the game
- Select: (when in game) pause/unpause the game
- Use left, right to move the player sprite
- Press A to shoot
## HOW TO PLAY THE GAME
It's centipede. The centipede will travel down the screen, and you will lose if it reaches the bottom. Move the player around and shoot the centipede before it reaches you. It will split every time it is shot. 10 pts for shooting mushrooms.
## STATE NAVIGATION
- Start: initializes to start. Hitting start after win or lose will go to start. Hitting start during pause will do this as well.
- Level 1: Press start on the Start screen, or select on the pause screen
- Level 2: Beat level 1 by killing the centipede, or select on the pause screen
- Pause: Press select on the game screen.
- Lose: Let the centipede reach the bottom of the screen
- Win: Beat both levels
