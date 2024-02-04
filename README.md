# Main Settings:

## YOUTUBE_URL="YOUR_URL"  
## KEY="YOUR_KEY"
Put your own youtube url and key in these. Youtube url, I think, stays the same for everyone and is "rtmp://a.rtmp.youtube.com/live2", but you can double check it in the same place where you can find the key.
Youtube --> start streaming --> URl of your stream
Youtube --> start streaming --> Key for your stream

## BACKGROUND_VIDEO="PATH/TO_YOUR/VIDEO_FILES"
Relative path to the video on your server. Video will loop itself forever as long as the stream is on. Relative means relative to the position of this script e.g. your script's path is "/main/radio/stream.sh" and video's path is "/main/radio/background_video/video.mp4", then relative path to the video in the script would be BACKGROUND_VIDEO="background_video/video.mp4".


## BACKGROUND_AUDIO="PATH/TO_YOUR/AUDIO_FILES"
## BACKGROUND_AUDIO_VOLUME="0"
Add e.g. gunshots, talking, etc ABOVE your music or main audio. If you run into the problem "file doesn't exist/can't find the file", set relative path to your main audio and set the BACKGROUND_AUDIO_VOLUME to zero ot below zero.

## MUSIC_DIR="PATH/TO_YOUR/MUSIC_FOLDER"
## MUSIC_VOLUME=1
Relative path to the folder with all the music/audio you want to play on the stream. Script will play audio in this folder from first to last and then start again. Music volume is the volume of the audio.

## FONT="fonts/WonderNight-K7ZaZ.ttf"
## FONTSIZE=72
## FONTCOLOR="#FFFFFF"
Relative path to your fonts as well as size and color settings. Remember to download font you want to the server.



