#!/bin/bash
playlist_id="$1"
output_format='worstaudio[acodec=opus]'
yt-dlp --add-metadata --embed-thumbnail --extract-audio -f "$output_format" --convert-thumbnails jpg "https://www.youtube.com/playlist?list=$playlist_id"
