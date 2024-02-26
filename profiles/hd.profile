// Simple startup profile for HD h264 encoding
// You can cahnge it, fork it and share it with others
ffmpeg -y -hide_banner -i ${i} -map 0:0 -map 0:1 -c:v h264_nvenc ${gpu} -preset fast  -profile:v main  -filter:v yadif  -forced-idr 1  -b:v 4M  -c:a aac  -b:a 128k  -r 25 -g 8 -keyint_min 13  -f mpegts ${o}
NAME "HD h264"
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
