// Simple startup profile for SD and HD h264 encoding
// You can cahnge it, fork it and share it with others
ffmpeg  -re  -y -hide_banner  -stream_loop -1  -i ${i}  ${gpu}  -r 30000/1001 -g 8 -keyint_min 13  -preset fast  -profile:v main  -filter:v yadif  -forced-idr 1  -c:v h264_nvenc  -b:v 4M  -c:a aac  -b:a 128k  -f mpegts ${o}  -r 30000/1001 -g 8 -keyint_min 13  -preset fast  -profile:v main  -filter:v yadif  -forced-idr 1  -vf scale=568:-1  -c:v h264_nvenc  -b:v 1M  -c:a aac  -b:a 128k  -f mpegts ${o}
NAME "SD+HD h264"
WHERE 
[
    {
        "desc": "gpu",
        "data": {
            "name": "GPU",
            "description": "Select GPU which stream will use, set empty if you don't use GPU",
            "command": "-gpu $value",
            "default": ""
        }
    }
]
