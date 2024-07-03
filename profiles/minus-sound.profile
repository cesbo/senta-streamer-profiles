// Remove sound from video
ffmpeg -i ${i} -an -c:v copy ${o}
NAME "Remove sound"
