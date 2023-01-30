#!/bin/bash
#2.3
# Basic folder copier

read -p "Type the name of the folder you would like to copy: " folderName

# check if the name is a valid directory
# -d is to check if the directory exists or not

if [ -d "$folderName" ] ; then

    # copy it to a new location
    # cp -r copy files recursively

    read -p "Type the name of the destination folder: " newFolderName

    cp -r "$folderName" "$newFolderName"

else

   # otherwise, print an error

    echo "I couldn't find that folder"

fi

echo

