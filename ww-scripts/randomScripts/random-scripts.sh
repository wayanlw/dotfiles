#!/bin/bash

#--------------------
#searching history commands and copy them to clipbards

alias srchhist="history | cut -c 8- | sort | uniq | fzf | tr -d '\n' | xclip -sel clip"

# downloading specific parts of youtube videos
function yt-dl-part(){
read -p "1. Enter the youtube url: " URL
read -p "2. Input the start position: " START
read -p "3. Input the duration from START: " DURATION
read -p "4. Input the files name: " FILENAME

ffmpeg -i $(youtube-dl --format best --get-url $URL) -ss $START -t $DURATION $FILENAME
}

# process killer via dmenu
#output processes by user in the ouput format pid,%mem.%cpu,comm | sort --ignore-leading-blanks --key=2 --reverse | sed --qiet | dmenu --ignore-case --list-veiw 10 lines | awk print field 1
kill -15 $(ps -u $USER -o pid,%mem,%cpu,comm | sort -b -k2 -r | sed -n '1!p' | dmenu -i -l 10 | awk '{print $1}')

# upload a file and copy the link
#!/bin/bash
file=$(find . -maxdepth 4 -not -path '*/\.*' -type f | dmenu -i -l 20)
curl -F "file=@$file" 0x0.st | xclip -sel c
notify-send "file uploaded. Link copied to clipboard"

#if you want to select only the unhidden files replace the find above with the below. adds  max depth 4 and ignore paths with a /.
find . -maxdepth 4 -not -path '*/\.*' -type f | dmenu -i -l 10 | xclip -sel c 
