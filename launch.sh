#!/bin/bash

# This script launches the Docker container (including mounting
# the input/output directories as volumes)

# Usage:
# ./launch.sh flame_file quality

# Notes:
# - Only pass in the basename of the .flame/.flam3 file, not the full
#   path. The input directory is mapped differently in the container.

if [[ -z "$1" ]]
then
    echo "Usage: ./launch.sh flame_file [quality]"
    exit 1
fi

# Shorthand for input/output directories
INPUT=$(pwd)/input:/input
OUTPUT=$(pwd)/output:/output
FLAME="$1"
QUALITY="$2"

# Launch the Docker command and time it in seconds
START=$(date +'%s')
sudo docker run -v $INPUT -v $OUTPUT -it fractal-renderer:dev $FLAME $QUALITY
END=$(date +'%s')

# If SNS_TOPIC is set, send a notification
SECONDS=$(($END - $START))
MESSAGE="Rendered $FLAME in $SECONDS sec!"
if [[ -n "$SNS_TOPIC" ]]
then
    aws sns publish --topic-arn "$SNS_TOPIC" --message "$MESSAGE"
fi
