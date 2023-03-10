#!/bin/bash
#the purpose of this script is to perform a keyword search on CSAalerts_minusTAGS.txt


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

#no color
RST="\033[0m"

#./readCSAalerts.sh

#define the file to search

file_to_search="CSAalerts_minusTAGS.txt"

#loop until user enters 'q'

while true; do

    #prompt the user to enter a keyword or phrase

    echo -e "${BBLU}Please enter a keyword or phrase to search for (enter q to quit): ${RST}"

    read -r search_term

    #exit the loop if user enters 'q'

    if [[ "$search_term" == "q" ]]; then #allows user to quit by entering 'q'
        echo ""
        break
    fi

    if [ -z "$search_term" ]; then #error handling
        echo ""
        echo "Please enter a search term"  #if the user doesn't input anything and presses enter, stops the whole file being displayed.
        echo ""
        continue
    fi

    #search the CSAalerts.txt and display matching lines, suppress html tags

    echo -e "${YLY}"
    grep_output=$(grep -i "$search_term" "$file_to_search") #search for search_term and output line 'grep i' if search_term is found
    if [ -z "$grep_output" ]; then
        echo "No results found."  #if no results found
    else
        echo "$grep_output"
    fi
    echo -e "${RST}"

done
