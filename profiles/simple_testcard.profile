// Simple testcard with 8 color bars and 1kHz tone
// You don't need eny input file, just run it
ffmpeg -re -f lavfi -i  pal100bars=size=1920x1080:rate=25 -c:v libx264 -g 12 -b:v 2M -f mpegts ${o}
NAME "SIMPLE TESTCARD"
