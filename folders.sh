#!/bin/zsh

# Place downloaded .zip files into the same directory as this file before running


unzip "*.zip"
rm *.zip

for SRC in A1140*
do
    TMP=${SRC##"A1140-scala2-"}     # Removes the first block from the folder name
    RND=${TMP%%-*}                  # Extracts the round number from the string ('r1')
    PACKAGE=${TMP#*-}               # Removes the round number from the string, leaving behind the package name
    if [ ! -d $RND ]; then
        mkdir $RND                  # Makes separate folders for each round
    fi
    mv $SRC "${RND}/$PACKAGE"       # Moves the packages into corresponding folders
done
