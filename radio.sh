#! /bin/bash

# Stream settings
# Bitrate
VBR="6500k"
# FPS
FPS=30

# Constant Rate Factor
CRF=24
# Preset                                       
PRESET="fast"
# GOP
GOP=3

# YouTube settings
YOUTUBE_URL="YOUR_URL"  
KEY="YOUR_KEY"

# Background video for looping 
BACKGROUND_VIDEO="background_video/rain.mp4"

# Background audio for looping
BACKGROUND_AUDIO="background_audio/artillery.mp3"

# Background audio volume
BACKGROUND_AUDIO_VOLUME="0"

# Music directory 
MUSIC_DIR="music/lofi"

# Music volume
MUSIC_VOLUME=1

# Font
FONT="fonts/WonderNight-K7ZaZ.ttf"

# Font size
FONTSIZE=72

# Font color
FONTCOLOR="#FFFFFF"


get_filename() {
    filepath=$1
    filename=$(basename -- "$filepath")
    name="${filename%.*}"
    echo $name
}

get_duration() {
    filepath=$1
    duration=`ffprobe -i "$filepath" -show_entries format=duration -v quiet -of csv="p=0"`
    echo $duration
}



while true
do
    for music in "$MUSIC_DIR"/*
    do 
        title=$(get_filename "$music")
        duration=$(get_duration "$music")
        
        ffmpeg -re \
        -stream_loop -1 \
        -i "$BACKGROUND_VIDEO" \
        -i "$music" \
        -stream_loop -1 \
        -i "$BACKGROUND_AUDIO" \
        -filter_complex " \
            [0]trim=duration=$duration[v0];
            [v0]drawtext=fontfile=$FONT:text=$title:fontsize=$FONTSIZE:fontcolor=$FONTCOLOR:x=20:y=50[v];
            [2:a]volume="$BACKGROUND_AUDIO_VOLUME"[a1];
            [1:a][a1]amix=inputs=2[a2];
            [a2]atrim=duration=$duration[a]
        "\
        -map [v] -map [a]:a \
        -vcodec libx264 -pix_fmt yuv420p -preset:v ultrafast -r $FPS -b:v $VBR -g $GOP \
        -acodec libmp3lame -qscale:a 3 -ar 44100 -threads 6 -b:a 712000 \
        -f flv $YOUTUBE_URL/$KEY
        
    done
done 
