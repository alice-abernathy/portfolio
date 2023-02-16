#!/bin/bash

#set the input file name

input_file="CSAalerts.txt"

#define the HTML tags to search for from the downloaded data

html_tags=("<h3 class=\"sc-card-title\">" "<div class=\"sc-card-publish\">" "<p class=\"sc-card-desc\">")

#Loop through each line of the input file

while read line; do

    #Loop through each HTML tag

    for tag in "${html_tags[@]}"; do

        #Check if the current line contains the current HTML tag

        if [[ "$line" == *"$tag"* ]]; then

            #If there's a match, remove the HTML tag and print the line

            line_without_tag=$(echo "$line" | sed "s/$tag//g" | sed "s/<\/${tag:1}/\n/g" | sed "s/<[^>]*>//g")
            echo "$line_without_tag"
            break
        fi
    done
done < "$input_file"