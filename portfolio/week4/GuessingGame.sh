#!/bin/bash

#Define colors
BLK="\033[30m"

RED="\033[31m"

BRED="\033[1;31m"

HRED="\033[0;91m"

GRN="\033[32m"

BGRN="\033[1;32m"

BRN="\033[33m"

BBRN="\033[1;33m"

BLU="\033[34m"

BBLU="\033[1;34m"

PRPL="\033[35m"

BPRPL="\033[1;35m"

CYN="\033[36m"

BCYN="\033[1;36"

GRY="\033[37m"



#no color
RST="\033[0m"

#4.3
#Write a script named GuessingGame.sh that uses the getNumber() function in a number guessing game with the following rules:

#The user should be asked to enter a number between 1 and 100.
#If the number is 42, the game should print 'Correct!'.
#If the number is less than 42, the game should print 'Too Low!'
#If the number is greater than 42, the game should print 'Too High!'
#The game should repeat until the user has found the correct number

#includes changes requested in UNit 5.3. As my script used figlet, I ran the following commands
#sed -i '/figlet .*".*!"/ s/CORRECT/RIGHT/' GuessingGame.sh
#sed -i '/echo .*".*!"/ s/CORRECT/RIGHT/' GuessingGame.sh

#This function prints a given error 
      
printError() 
      
{ 
      
    echo -e "${BRED}ERROR:${RST} $1" 
      
} 
      
 
      
#This function will get a value between the 2nd and 3rd arguments 
      
getNumber() 
      
{ 
      
    read -p "$1: " 
      
    while (( $REPLY < $2 || $REPLY> $3 )); do 
      
        echo
        printError "Input must be between $2 and $3" 
        echo

        read -p "$1: " 
      
    done 
      
} 

echo
echo
echo -e "${BRED}Welcome to the Secret Number Guessing Game${RST}"
echo -e "${BLU}Can you guess the secret number?  Let's begin...${RST}"
echo -e ${BBRN}
getNumber "Please enter a number between 1 and 100" 1 100
echo -e ${RST}

secret=42

while [[ $REPLY -ne $secret ]] #the REPLY does not equal the secret number, continue the following commands

do

    if [[ $REPLY -lt $secret ]] #test if REPLY is less than the secret number
    then 
    echo
    echo -e "${CYN}Incorrect. Hint: try a higher number${RST}" #if less than
    else
        if [[ $REPLY -gt $SECRET ]] #test if REPLY is greater than the secret number
        then
            echo
            echo -e "${PRPL}Incorrect. Hint: try a lower number${RST}" #if greater than
        fi
    fi

echo -e ${BBRN}
getNumber "Please enter a number between 1 and 100" 1 100 #begin loop again if REPLY was not equal to the secret number
echo -e ${RST}

done

echo -e ${BGRN}
figlet "$secret is RIGHT!" 
echo -e ${RST}