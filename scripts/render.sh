#!/bin/bash

# IMPORTANT: This script is run inside the Docker container! launch.sh
# is the entry point!

# This script runs flam3 to render a flame pack from the /input
# directory and puts it in the output directory.

# Usage:
# ./render.sh input_file [quality]
#
# Notes:
# - Quality defaults to 1. Set it higher manually!
set -e

if [[ -z "$1" ]]
then
    echo "Usage: ./render.sh input_file [quality]"
    exit 1
fi


# Set flam3 settings 
export name_enable=1
export qs=${2:-1}

# Move to /output since
cd /output 

# Render the fractal
echo "Rendering with quality $qs"
flam3-render < /input/$1

# Make sure anyone can modify the output files even if they get created
# by Docker running as sudo
chmod 666 /output/*.png
