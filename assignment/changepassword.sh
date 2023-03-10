#!/bin/bash
#the purpose of this script is to change the current password
#this version includes, password complexity check and confirm password challenge

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

progress_bar ()
{
#define the maximum number of iterations
max=50

#loop over the iterations
for i in $(seq 1 $max); do
    #calculate the percentage of completion
    percentage=$((i * 100 / max))

    #calculate the number of characters to fill the progress bar
    bar_length=$((i * 50 / max))

    #output the progress bar
   
    printf "%-50s %d%%\r" "$(printf '|%.0s' $(seq 1 $bar_length))" "$percentage"
   

    #wait for 0.05s
    sleep 0.05
done

#output a newline character
echo ""
} #end function


echo -e "${BYLY}PLEASE NOTE${RST}"
echo -e "${YLY}Your old password will be deleted.${RST}"
echo -e "${BBLU}Do you wish to continue? (Y/N)${RST}" 
read -r confirm

if [[ "$confirm" == "Y" || "$confirm" == y ]]; then

    echo -e "${YLY}OK. Proceeding...${RST}"
    sleep 0.5

elif [[ "$confirm" == "N" || "$confirm" == n ]]; then

    sleep 1
    echo -e "${GRN}Exiting without changing password...${RST}"
    sleep 1
    echo ""
    clear
    exit 0
else
    echo -e "${BLU}Please press Y or N. Try again...${RST}"
fi

#challenge user for their password

./passwordcheck.sh #calls password check script

#check exit code, if "1", exit completely

if [ $? -ne 0 ]; then
  exit 1
fi
    
    
    echo -e "${BBLU}Please enter your ${BYLY}NEW${RST} ${BBLU}password: ${RST}"

        read -r -s password #supresses password, read -s used through this script

        #remove secret.txt file, old password removed

        rm secret.txt

    #password complexity challenges, uses '=~' which is a 'regular expression match operator'. Tests if left side matches right side, returns 0 or 1

        while true; do
    if [[ ${#password} -lt 8 ]]; then #checks if password '-lt 8' characters
        echo -e "Password should be at least ${YLY}8 characters long${RST}"
    elif ! [[ $password =~ [A-Z] ]]; then #checks for a capital letter
        echo -e "Password should contain at least one ${YLY}uppercase letter${RST}"
    elif ! [[ $password =~ [a-z] ]]; then #checks for lower case letter
        echo -e "Password should contain at least one ${YLY}lowercase letter${RST}"
    elif ! [[ $password =~ [0-9] ]]; then #checks for a number
        echo -e "Password should contain at least one ${YLY}number${RST}"
    elif ! [[ $password =~ [\!\@\#\$\%\^\&\*\-] ]]; then #additional special characters can be added here within [[[..\specialCHAR\...]]]
        echo -e "Password should contain at least one ${YLY}special character ${BYLY}(!@#$%^&*-)${RST}" #allows user to see what are accepted special characters
    else
        break
    fi

    echo -e "${BBLU}Please enter your ${BYLY}NEW${RST} ${BBLU}password:${RST}"
    read -r -s password
    done

    echo -e "${BGRN}Please confirm your ${BYLY}NEW${RST} ${BBLU}password:${RST}"
    read -r -s confirm_password

    while [[ $password != "$confirm_password" ]]; do
    echo -e "${BYLY}Passwords DO NOT match. Please try again.${RST}"
    echo -e "${BBLU}Please enter your ${BYLY}NEW${RST} ${BBLU}password:${RST}"
    read -r -s password
    echo -e "${BGRN}Please confirm your ${BYLY}NEW${RST} ${BBLU}password:${RST}"
    read -r -s confirm_password
done


        # save the user???s password in a file called 'secret.txt' as a hash value using sha256sum

        echo "$password" | sha256sum > secret.txt
        echo ""
        echo -e "${BLU}Changing your password. Please wait.${RST}"
        progress_bar
        echo 
        echo -e "${BGRN}Your password has been changed successfully${RST}"
        echo 
        sleep 2 #allows user to see that their password has changed before clearing the screen
exit 0