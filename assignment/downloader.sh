#!/bin/bash
#3.4
#Create web downloader. Write a script that does the following:
#prompt the user to type a website URL to download or type “exit” to quit.”
#prompt the user to type a download location
#use wget to download the webpage requested by the user
#repeat the process until the user types “q”.

#Define colors
BLK="\033[30m"

RED="\033[31m"

GRN="\033[32m"

BRN="\033[33m"

BLU="\033[34m"

PRPL="\033[35m"

CYN="\033[36m"

GRY="\033[37m"

#no color
RST="\033[0m"



until [[ $url = "q" ]] #keep asking for url until 'q' is entered

do
echo
echo

  read -r -p "Please type the URL of a file to download or type 'q' to quit: " url

  if [[ $url == "https://"* ]] || [[ $url == "http://"* ]]; then #allows for http and https websites

    read -r -p "Download location: " userlocation

    mkdir -p  "$userlocation"

    echo

    wget -q --show-progress "$url" -P "$userlocation" #user gets comfirmation that file has been downloaed

  else
    echo 
  fi

done

echo -e "${BLU}Bye!${RST}"
echo
echo