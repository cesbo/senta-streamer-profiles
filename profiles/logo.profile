// Add a logo to the video
ffmpeg -i ${i} ${logo} -filter_complex "[1][0]scale2ref=oh*mdar:ih*0.2[logo][video];[video][logo]overlay=(main_w-overlay_w)-${x}:${y}" -y ${o}
NAME "Logo adding"
WHERE
[
    { 
        "desc": "logo",
        "data": {
            "name": "Logo path",
            "description": "Print the path to the image file with the logo",
            "command": "-i $value",
            "default": ""
        }
    },
    {
        "desc": "x",
        "data": {
            "name": "Shift along the X axis",
            "description": "Offset from the top right corner along the X axis",
            "command": "$value",
            "default": ""
        }
    },
    {
        "desc": "y",
        "data": {
            "name": "Shift along the Y axis",
            "description": "Offset from the top right corner along the Y axis",
            "command": "$value",
            "default": ""
        }
    }
]
