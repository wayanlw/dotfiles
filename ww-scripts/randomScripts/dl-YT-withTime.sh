#!/bin/bash
# downloading specific parts of youtube videos
read -p "1. Enter the youtube url: " URL
read -p "2. Input the start position (hh:mm:ss): " START
read -p "3. Input the DURATION from start position (hh:mm:ss): " DURATION
read -p "4. Input the files name (*.mp4): " FILENAME

ffmpeg -i $(youtube-dl --format best --get-url $URL) -ss $START -t $DURATION ~/Videos/$FILENAME
