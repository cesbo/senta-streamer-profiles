// Simple testcard with 8 color bars and 1kHz tone
// You don't need eny input file, just run it
ffmpeg -y -f lavfi -i nullsrc=s=1920x1080 \
-f lavfi -i "sine=frequency=1000" \
-filter_complex "\
color=c=white:size=1920x1080[white];\
color=c=yellow:size=240x1080[yellow];\
color=c=cyan:size=240x1080[cyan];\
color=c=green:size=240x1080[green];\
color=c=magenta:size=240x1080[magenta];\
color=c=red:size=240x1080[red];\
color=c=blue:size=240x1080[blue];\
color=c=black:size=240x1080[black];\
[white][yellow]overlay=shortest=1:x=240:y=0[t1];\
[t1][cyan]overlay=shortest=1:x=480:y=0[t2];\
[t2][green]overlay=shortest=1:x=720:y=0[t3];\
[t3][magenta]overlay=shortest=1:x=960:y=0[t4];\
[t4][red]overlay=shortest=1:x=1200:y=0[t5];\
[t5][blue]overlay=shortest=1:x=1440:y=0[t6];\
[t6][black]overlay=shortest=1:x=1680:y=0[v]\
" -map [v] -map 1:a -c:a aac -b:a 96k -ac 2 -ar 48000 -r 25 -c:v libx264 -g 12 -b:v 2M \
-f mpegts ${o}
NAME "SIMPLE TESTCARD"
