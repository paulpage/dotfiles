#!/bin/sh

# Compress and normalize an mp3 audio file so it is at a consistant volume
# just below clipping level.
set -e
ffmpeg \
    -i "$1" \
    -af acompressor=threshold=-20dB:ratio=3:attack=200:release=1000 \
    "_compressed_$1"
normalize-mp3 "_compressed_$1"
mv "_compressed_$1" "$1"
