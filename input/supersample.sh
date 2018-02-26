#!/bin/bash

# This script edits a flame file to change 'oversample="1"' to 
# 'supersample=<supersample_value>' since Apophysis doesn't do this.

# Usage:
# ./supersample.sh input.flame samples > output.flame

cat "$1" | sed "s/oversample=\"1\"/supersample=\"$2\"/"
