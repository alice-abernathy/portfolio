#!/bin/bash
#2.5

echo -n "Please type your password: "
read -s password

#store entered password to input.txt

echo $password | sha256sum > input.txt

#compare the hashed value in input.txt and secret.txt

if [ "$(cat input.txt)" == "$(cat secret.txt)" ];

then 

    echo
    echo "Access Granted"
    echo
    #delete input.txt file
    rm input.txt

else

    echo
    echo "Access Denied"
    #delete input.txt file
    rm input.txt
    exit 0

fi

while :
do

echo "Please choose from the following options"
echo "Press 1 to create a folder"
echo "Press 2 to copy a folder"
echo "Press 3 to reset a password"
echo "Or press Q to quit"

read option

case $option in

        
    1)  #simple folder maker
        read -p "Type the name of the folder you would like to create >  " folderName

        mkdir "$folderName"
        
        echo "The folder called >$folderName< has been created"
        echo ;;


    2)  #simple folder copier
        read -p "Type the name of the folder you would like to copy: " folderName

        # check if the name is a valid directory
        # -d is to check if the directory exists or not

        if [ -d "$folderName" ] ; then

        # copy it to a new location
        # cp -r copy files recursively

        read -p "Type the name of the destination folder: " newFolderName

        cp -r "$folderName" "$newFolderName"

        echo "Folder >$newFolderName< has been created."
        echo

        else

        # otherwise, print an error

        echo "I couldn't find that folder"
        echo

        fi ;;


    3)  echo -n "Please Enter Your New Password: "
        read -s password

        #remove secret.txt file

        rm secret.txt

        # save the user’s password in a file called 'secret.txt' as a hash value using sha256sum

        echo $password | sha256sum > secret.txt
        echo 
        echo "Your password has been reset successfully"
        echo ;;

    q)  echo
        echo "Bye"
        echo
        exit ;;

    Q)  echo
        echo "Bye"
        exit ;;

    *)  echo "Invalid Input"
        echo "Please try again..." 
        echo ;;
    


esac

done
