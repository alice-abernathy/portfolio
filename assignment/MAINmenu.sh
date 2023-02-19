#!/bin/bash
#V-3


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

clear #clears screen

#download data from CSA website before user is presented with the main menu

echo
echo -e "${BLU}Welcome to the SingCERT Alerts website scraper"
echo ""

./passwordcheck.sh #calls password check script

#check exit code, if "1", exit completely

if [ $? -ne 0 ]; then
  exit 1
fi

echo -e 
echo -e "${BLU}Before we begin, the scraper will scrape the website now${RST}"


#define progress_bar as function

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



progress_bar #output progress bar

echo

./websitescraper.sh
./readCSAalerts.sh

while : ; do

  #display the main menu and prompt the user to choose an option
  clear
  sleep 0.5
  echo 
  echo -e "${BYLY}$(figlet Main Menu)${RST}"
  echo -e "${CYN}Press 1 to view the current alerts"
  echo "Press 2 to download fresh data"
  echo "Press 3 to do a keyword search"
  echo -e "Or enter "${BCYN}q${RST}" ${CYN}quit...${RST}"
  read -p "Please enter an option: " input
  echo ""

  #if the user presses "q", exit the script

  if [ "$input" == "q" ]; then
    echo
    echo -e "${BLU}Disconnecting from SingCERT Alerts website scraper${RST}"
    
    progress_bar #output progress bar
    
    #delete both text files - start fresh when program is used again

    rm CSAalerts.txt 
    rm CSAalerts_minusTAGS.txt

    echo ""
    exit 
  fi

#if the user chooses option 1, run the script "readCSAalerts.sh" and loop back to the main menu
  if [ "$input" == "1" ]; then
    
    echo -e "${CYN}Getting data..."
    progress_bar
    #./readCSAalerts.sh
    cat "CSAalerts_minusTAGS.txt"
    echo ""
    echo -e "${RST}Press enter to return to the main menu - this will clear the screen"
    read
    
    continue
  fi

  #if the user chooses option 2, run the script "websitescraper.sh" and loop back to the main menu
  if [ "$input" == "2" ]; then
    echo -e "${CYN}Running websitescraper.sh...${RST}"
    progress_bar
    ./websitescraper.sh
    echo "Press enter to return to the main menu"
    read
    continue
  fi

  # If the user chooses option 3, run the script "keyword" and loop back to the main menu
  if [ "$input" == "3" ]; then
    echo -e "${BLU}"
    rm -f CSAalerts_minusTAGS.txt
    ./readCSAalerts.sh

    cat "CSAalerts_minusTAGS.txt"

    echo ""
    ./keyword.sh
    echo -e "${RST}Press enter to return to the main menu"
    read
    continue
    
  fi

  #if the user enters an invalid input, display an error message

  sleep 1
  echo -e "${BRED}Invalid input. Please enter 1, 2, or Q.${RST}"

done