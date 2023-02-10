#!/bin/bash
#3.6
#Mega Menu
#add the scripts created in week 3 to menu.sh
#add feature to repeat menu until q is entered to quit
#add color to menu

#Define colors
BLK="\033[30m"

RED="\033[31m"

BRED="\033[1;31m"

ORED="\033[1;41m" #on red background

GRN="\033[32m"

BGRN="\033[1;32m"

OGRN="\033[42m" #on green background

BRN="\033[33m"

BBRN="\033[1;33m"

BLU="\033[34m"

BBLU="\033[1;34m"

PRPL="\033[35m"

BPRPL="\033[1;35m"

CYN="\033[36m"

BCYN="\033[1;36m"

GRY="\033[37m"

YLW="\033[0;33m"

BYLW="\033[1;33m"

BWHT="\033[1;37m"

BBLK="\033[1;30m"




#no color
RST="\033[0m"




echo -e -n "${BRED}Please type your password: ${RST}"
read -s password

#store entered password to input.txt

echo $password | sha256sum > input.txt

#compare the hashed value in input.txt and secret.txt

if [ "$(cat input.txt)" == "$(cat secret.txt)" ];

then 

    echo
    echo  -e "${OGRN}${BWHT}Access Granted${RST}"
    echo
    #delete input.txt file
    rm input.txt

else

    echo
    echo -e "${ORED}${BRED}Access Denied${RST}"
    echo
    #delete input.txt file
    rm input.txt
    exit 0

fi

while :
do

echo
echo -e ${RST}
echo -e "${BLU}Please choose from the following options"
echo -e "Press ${BGRN}1 ${RST}${BLU}to create a folder"
echo -e "Press ${BBLU}2 ${RST}${BLU}to copy a folder"
echo -e "Press ${BRED}3 ${RST}${BLU}to reset your password"
echo -e "Press ${BYLW}4 ${RST}${BLU}to use the Calculator"
echo -e "Press ${BPRPL}5 ${RST}${BLU}to create week folders"
echo -e "Press ${BBRN}6 ${RST}${BLU}to check filenames"
echo -e "Press ${BCYN}7 ${RST}${BLU}to download a file from the internet"
echo -e "Or press${RST} Q${BLU} to ${RST}quit"
echo

read -r option

case $option in

        
    1)  #simple folder maker
        echo
        read -e -r -p "Type the name of the folder you would like to create: " folderName

        mkdir "$folderName"
        
        echo -e "${GRN}The folder called ${BGRN}$folderName ${RST}${GRN}has been created${RST}"
        echo ;;


    2)  #simple folder copier
        echo -e ${BLU}
        read -r -p "Type the name of the folder you would like to copy: " folderName

        # check if the name is a valid directory
        # -d is to check if the directory exists or not

        if [ -d "$folderName" ] ; then

        # copy it to a new location
        # cp -r copy files recursively

        read -r -p "Type the name of the new folder: " newFolderName

        cp -r "$folderName" "$newFolderName"

        echo -e "${GRN}Folder ${BBLU}$newFolderName ${RST}${GRN} has been created${GRN}"
        echo

        else

        # otherwise, print an error

        echo "I couldn't find that folder"
        echo

        fi ;;


    3)  echo
        echo -e -n "${YLW}Please Enter Your New Password: ${YLW}"
        read -r -s password

        #remove secret.txt file

        rm secret.txt

        # save the user’s password in a file called 'secret.txt' as a hash value using sha256sum

        echo "$password" | sha256sum > secret.txt
        echo 
        echo -e "${BYLW}Your password has been reset successfully${RST}"
        echo ;;

    4) 

        while :
        do

        # 

        echo
        echo -e "${BYLW}SIMPLE BASH CALCULATOR${RST}"
        echo -e "Enter 1st number: "
        read A
        echo -e "Enter 2nd number: "
        read B
        echo
        
        # 


        echo -e "${BYLW}ARITHMETIC OPERATION${RST}"
        echo -e "Please enter your choice:"
        echo -e "Press 1 for ${BBLU}Addition${RST}"
        echo -e "Press 2 for ${GRN}Subtraction${RST}"
        echo -e "Press 3 for ${BRED}Multiplication${RST}"
        echo -e "Press 4 for ${BPRPL}Division${RST}"
        echo -e "Or press ${YLW}q${RST} to quit"
        echo
        read -r OPERATION

        
        # 
        case $OPERATION in
        1)echo -e ${BBLU}
            echo "$A + 
        $B"
            result=$((A+B))
        ;;

        2)echo -e ${BGRN}
            echo "$A -
        $B"
            result=$((A-B))
        ;;

        3)echo -e ${BRED}
            echo "$A * 
        $B"
            result=$((A*B))
        ;;

        4)echo -e ${BPRPL}

            if [ $B = 0 ]; then
            echo -e "${YLW}Divide by zero is not allowed${RST}"
            echo
        
            
            else
            
            echo "$A / 
        $B"
            result=$((A/B))
            
            fi
        ;;

        q)  echo
                #echo "Bye"
                echo
                break #break out of loop
                #exit 
                ;;

        Q)  echo
                #echo "Bye"
                echo
                break #break out of loop
                #exit 
                ;;
        
        *) echo -e "${ORG}Invalid input or calculation ${YLW}(DIV/0)${RST}"

        ;;
            
        esac



        #echo -e "= $result$"
        echo

        done 
        
        ;;

    5)

        #creates the week folders in /scripts/portfolio

        #change to the correct directory
        cd /
        cd home/student/scripts/portfolio


        echo 
        echo -e "${PRPL}Create week folders in sequence"
        read -r -p "Starting with week: " start
        read -r -p "Ending with week: " end
            
        #If there aren't two arguments to the script 
            
        #$if (( $#!=2 )); then 
            
            #Print an error and exit 
            
            #echo "Error, provide two numbers" && exit 1 
            
        #fi 
            
        #For every number between the first argument and the last 
            
        for ((i = $start; i <= $end; i++)) 
            
        do 
            
            #Create a new folder for that number 
            
            echo -e "${PRPL}Creating folder ${BPRPL}week$i${RST}" 
            
            mkdir "week$i" 
            
        
        done 

    ;;

    6)
        cd /
        cd home/student/scripts/portfolio/week3
        
        echo
        echo -e "${BRN}Please enter the name of the text file: ${RST}"
        read -r name
        
        
        filename=$name #reads filename

        while read -r line; do

        if [ -a "$line" ]; #check if it's a file

        then
                echo -e ${BBRN}
                echo "$line - That file exists"

        elif [ -d "$line" ]; 
        
        then
                echo -e ${BBRN}
                echo "$line - That's a directory" #check if it's a directory

        else
                echo -e ${BBRN}
                echo "$line - I don't know what that is" #if not a file or directory

        fi

        done < "$filename" #redirection to end the loop

    ;;

    7)

        until [[ $url = "q" ]] #keep asking for url until 'q' is entered

do

    echo -e ${CYN}

    read -r -p "Please type the URL of a file to download or type 'q' to quit: " url

    if [[ $url == "https://"* ]] || [[ $url == "http://"* ]]; then #allows for http and https websites

        read -r -p "Download location: " userlocation

        mkdir -p  "$userlocation"

        echo -e ${BCYN}

        wget -q --show-progress "$url" -P "$userlocation" #user gets comfirmation that file has been downloaed

        echo -e ${RST}

    else
        echo 
    fi

done

echo -e "${CYN}Bye!${RST}"
echo
echo

    ;;

    q)  echo
        echo -e "${BBLU}Bye${RST}"
        echo
        exit ;;

    Q)  echo
        echo -e "${BBLU}Bye${RST}"
        exit ;;

    *)  echo "Invalid Input"
        echo "Please try again..." 
        echo ;;
    


esac

done
