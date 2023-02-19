#!/bin/bash
#check password

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


echo ""
echo ""
echo -n -e "${BBLU}Please type your password: ${RST}"
read -s password

#store entered password to input.txt

echo ""
echo $password | sha256sum > input.txt

#compare the hashed value in input.txt and secret.txt

if [ "$(cat input.txt)" == "$(cat secret.txt)" ];

then 

    echo
    echo -e "${BGRN}Access Granted${RST}"
    echo
    #delete input.txt file
    rm input.txt
    exit 0

else
    sleep 1
    echo ""
    echo -e "${YLY}Password ${RST}${BYLY}Incorrect${RST}${YLY}. Access Denied${RST}"
    echo ""
    echo ""
    #delete input.txt file
    rm input.txt
    #sleep 2
    #clear
    exit 1

fi