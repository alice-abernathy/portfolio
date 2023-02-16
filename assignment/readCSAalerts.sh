#!/bin/bash
#v2.0 

#Define colors
BLK="\033[30m"
RED="\033[31m"
BRED="\033[1;31m"
GRN="\033[32m"
BGRN="\033[1;32m"
BRN="\033[33m"
BBRN="\033[1;33m"
BLU="\033[34m"
BBLU="\033[1;34m"
PRPL="\033[35m"
BPRPL="\033[1;35m"
CYN="\033[36m"
BCYN="\033[1;36m"
GRY="\033[37m"
YLY="\033[0;33m"
BYLY="\033[1;33m"
BMAG="\033[1;35m"

#no color
RST="\033[0m"

#set the input file name

input_file="CSAalerts.txt"

#define the HTML tags to search for from the downloaded data

html_tags=("<h3 class=\"sc-card-title\">" "<div class=\"sc-card-publish\">" "<p class=\"sc-card-desc\">")

#loop through each line of the input file

echo
echo -e "${BYLY}Below is timely information about security issues, vulnerabilities, and exploits"
echo -e "Provided by ${RST}${BMAG}Singapore Computer Emergency Response Team${RST}"
echo

while read line; do

    #loop through each HTML tag

    for tag in "${html_tags[@]}"; do

        #check if the current line contains the current HTML tag

        if [[ "$line" == *"$tag"* ]]; then

            #if there's a match, remove the HTML tag and store the line

            line_without_tag=$(echo "$line" | sed "s/$tag//g" | sed "s/<\/${tag:1}/\n/g" | sed "s/<[^>]*>//g")
            echo -e "${YLY}$line_without_tag${RST}" >> "CSAalerts_minusTAGS.txt"
    
            break
        fi
    done

done < "$input_file"

cat "CSAalerts_minusTAGS.txt"