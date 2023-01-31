#!/bin/bash
#2.2
#Version 1.11
#Write a script named 'setPassword.sh' that accomplishes the following:
# 1 ask the user to type a folder name
#  2 ask the user to type a secret password (hide that input)
#   3 save the user’s password in a file called 'secret.txt' as a hash value using sha256sum

# 1 ask the user to type a folder name
read -p "Please Enter Folder Name: " dirname
mkdir $dirname
echo "Folder $dirname Created"
cd $dirname

#  2 ask the user to type a secret password (hide that input)
echo -n "Please Enter Your Password: "
read -s password

#   3 save the user’s password in a file called 'secret.txt' as a hash value using sha256sum
echo $password | sha256sum > secret.txt
echo

exit

