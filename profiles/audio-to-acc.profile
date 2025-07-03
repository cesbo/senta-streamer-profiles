// Transcode audio to AAC, keep video unchanged
ffmpeg -re -i ${i} \
  -c:v copy \
  -map 0:a -c:a aac -b:a 128k \
  -f mpegts ${o}

NAME "Transcode audio to AAC"
