#!/bin/bash
#add in MAINmenu.sh an option to change password

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
# Define the maximum number of iterations
max=50

# Loop over the iterations
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

# Output a newline character
echo ""
} #end function


echo -e "${BYLY}PLEASE NOTE${RST}"
echo -e "${YLY}Your old password will be deleted.${RST}"
echo -e "${BBLU}Do you wish to continue? (Y/N)${RST}" 
read confirm

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
    
    
    echo -e "${BBLU}Please enter your NEW password: ${RST}"

        read -s password

        #remove secret.txt file

        rm secret.txt

        # save the user’s password in a file called 'secret.txt' as a hash value using sha256sum

        echo $password | sha256sum > secret.txt
        echo ""
        echo -e "${BLU}Changing your password. Please wait.${RST}"
        progress_bar
        echo 
        echo -e "${BGRN}Your password has been reset successfully${RST}"
        echo 
        sleep 2
exit 0