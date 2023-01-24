#2.2
#Version 1
#Write a script named 'setPassword.sh' that accomplishes the following:
# 1 ask the user to type a folder name
#  2 ask the user to type a secret password (hide that input)
#   3 save the user’s password in a file called 'secret.txt' inside the folder the user chose.
#
# 1 ask the user to type a folder name
read -p "Please Enter Folder Name: " dirname
mkdir $dirname
echo "Folder $dirname Created"
cd $dirname
#
#  2 ask the user to type a secret password (hide that input)
echo -n "Please Enter Your Password: "
read -s password
#
#   3 save the user’s password in a file called 'secret.txt' inside the folder the user chose.
echo $password > secret.txt
echo
#
exit