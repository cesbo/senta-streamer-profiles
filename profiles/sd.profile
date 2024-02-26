// Simple startup profile for SD h264 encoding
// You can cahnge it, fork it and share it with others
ffmpeg -re -y -hide_banner -i ${i} -map 0:0 -map 0:1 -c:v h264_nvenc -gpu 0 -preset fast -profile:v main -filter:v yadif -forced-idr 1 -b:v 1M -c:a aac -b:a 128k -r 25 -g 8 -keyint_min 13 -f mpegts ${o}
NAME "SD h264"
