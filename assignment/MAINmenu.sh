#!/bin/bash
#V-basic


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

while : ; do

  #display the main menu and prompt the user to choose an option
  
  echo
  echo "Main Menu"
  echo "Press 1 to download fresh data"
  echo "Press 2 to do a keyword search"
  echo "Q. Quit"
  read -p "Enter an option: " input

  #if the user presses "q", exit the script
  if [ "$input" == "q" ]; then
    exit 0
  fi

  #if the user chooses option 1, run the script "s1.sh" and loop back to the main menu
  if [ "$input" == "1" ]; then
    echo "Running s1websitescraper.sh..."
    ./websitescraper.sh
    echo "Press enter to return to the main menu"
    read
    continue
  fi

  # If the user chooses option 2, run the script "s2.sh" and loop back to the main menu
  if [ "$input" == "2" ]; then
    echo "Running keyword.sh..."
    ./keyword.sh
    echo "Press enter to return to the main menu"
    read
    continue
  fi

  #if the user enters an invalid input, display an error message

  echo "Invalid input. Please enter 1, 2, or Q."

done