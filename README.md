# Xfce4-SplashMaker
A Simple Script that is based on Xfce4 Mice Splash Engine to make custom splash themes for xfce4

you showld have preview.png logo.png (* slide.png (Optional) )in this directory

now

### slide.png
image contain horizontally seperated images for animating effects
default is 12 Frames
if want to increase or decrease modify line 39 in Splash.c STEPS

if slide.png is absent then
  make.sh automatically generate slide using xfce generate binary

## How To Make it
1. copy preview.png , logo.png in the directory
2. now in Slide.c edit the last 5 lines i.e. theme name, description , author name ,etc
3. sudo sh make.sh
4. after successful compilation it will ask for install
5. press y and enter

now your theme is installed
one xfce settings -> sessions and startup -> splash 
and select your theme
