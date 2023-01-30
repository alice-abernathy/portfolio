#!/bin/bash
#2.4
# Ask the user to type a secret password (hide that input).
# Check the user’s password against the hash stored in 'secret.txt'.
# If the user’s password is correct, print “Access Granted” and quit with the exit code 0.
# If the user’s password is incorrect print “Access Denied” and quit with the exit code 1.


echo -n "Please type your password: "
read -s password

#store entered password to input.txt

echo $password | sha256sum > input.txt

#compare the hashed value in input.txt and secret.txt

if [ "$(cat input.txt)" == "$(cat secret.txt)" ];

then 

    echo
    echo "Access Granted"
    #delete input.txt file
    rm input.txt
    exit 0

else

    echo
    echo "Access Denied"
    #delete input.txt file
    rm input.txt
    exit 1

fi

echo

