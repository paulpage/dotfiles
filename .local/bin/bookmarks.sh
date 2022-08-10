#!/bin/sh

browser=firefox

# The bookmarks file should contain one bookmarks per line,
# with the name of the bookmark first and the url second,
# separated by a hard tab character.
file=$HOME/.bookmarks

fzf -d\\t --with-nth 1 < $file | awk -F\\t '{print $2}' | xargs $browser
