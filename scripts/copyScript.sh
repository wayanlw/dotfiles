#!/bin/bash
if [ -d "$2" ]; then
    ### Take action if $DIR exists ###
    echo "${2} exists and copying now"
    cp -v $1 $2
    else
    ###  Control will jump here if $DIR does NOT exists ###
    echo "Error: ${2} not found. Creating directories now."
    mkdir -p $2
    cp -v $1 $2
fi
