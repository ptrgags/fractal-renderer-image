#!/bin/bash

# IMPORTANT: This script is run inside the Docker container! launch.sh
# is the entry point!

# This script runs flam3 to render a flame pack from the /input
# directory and puts it in the output directory.

# Usage:
# ./render.sh input_file [quality]
#
# Notes:
# - Quality defaults to 5000. For low-res tests, set it lower!
set -e

if [[ -z "$1" ]]
then
    echo "Usage: ./render.sh input_file [quality]"
    exit 1
fi


# Set flam3 settings 
export name_enable=1
export qs=${2:-5000}

# Move to /output since
cd /output 

# Render the fractal
flam3-render < /input/$1
