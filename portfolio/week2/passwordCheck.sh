#!/bin/bash
#2.4
# Ask the user to type a secret password (hide that input).
# Check the user’s password against the hash stored in 'secret.txt'.
# If the user’s password is correct, print “Access Granted” and quit with the exit code 0.
# If the user’s password is incorrect print “Access Denied” and quit with the exit code 1.

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
echo -n -e "${BPRPL}Please type your password: ${RST}"
read -s -r password
echo ""

#store entered password to input.txt

echo "$password" | sha256sum > input.txt

#compare the hashed value in input.txt and secret.txt

if [ "$(cat input.txt)" == "$(cat secret.txt)" ];

then 

    echo ""
    echo -e "${BGRN}Access Granted${RST}"
    echo ""

    #delete input.txt file
    rm input.txt
    exit 0

else

    echo ""
    echo -e "${BRED}Access Denied${RST}"
    echo ""
    #delete input.txt file
    rm input.txt
    exit 1

fi


