#!/bin/bash
#3.4
#
#Write a script named "filenames.sh" that goes through each line of a file.
#If that line contains a valid filename, print “That file exists”.
#If that line contains a directory name, print “That’s a directory”.
#Otherwise print “I don’t know what that is!”.
#Test your new script on “filenames.txt”.

filename=$1 #reads filename

while read -r line; do

        if [ -f "$line" ]; #check if it's a file

        then
                echo "$line - That file exists"

        elif [ -d "$line" ]; 
        
        then
                echo "$line - That's a directory" #check if it's a directory

else

                echo "$line - I don't know what that is" #if not a file or directory

fi




done < "$filename" #redirection to end the loop

