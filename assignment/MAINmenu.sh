#!/bin/bash
#V-4 Cstyle loop used


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

#challenge user for their password

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
    sleep 0.01
done

# Output a newline character
echo ""
} #end function

./progressbarPY.sh #output python progress bar

echo

./websitescraper.sh
./readCSAalerts.sh

clear

while true; do
  
  choices=("View current alerts from https://www.csa.gov.sg/singcert/Alerts" "Download fresh data" "Keyword search" "Change password" "Quit")
  echo -e "${BLU}$(figlet Main Menu)"
  for i in "${!choices[@]}"; do
    echo "$((i+1))) ${choices[$i]}"
  done
  
  #read -p "Please enter an option: r" input
  echo -e "${BBLU}Please enter an option: ${RST}"
  read input
  
  case $input in
    1)
      echo -e "${BLU}Getting data...${RST}"
      progress_bar

      echo
      echo -e "${BYLY}Below is timely information about security issues, vulnerabilities, and exploits"
      echo -e "Provided by ${RST}${BBLU}Singapore Computer Emergency Response Team${RST}"
      echo

      cat "CSAalerts_minusTAGS.txt"
      echo -e "${RST}Press enter to return to the main menu - this will clear the screen"
      read
      clear
      ;;
    2)
      echo -e "${BLU}Running websitescraper.sh...${RST}"
      progress_bar
      ./websitescraper.sh
      echo "Press enter to return to the main menu"
      read
      clear
      ;;
    3)
      echo -e "${BLU}"
      rm -f CSAalerts_minusTAGS.txt
      ./readCSAalerts.sh
      cat "CSAalerts_minusTAGS.txt"
      echo ""
      ./keyword.sh
      echo -e "${RST}Press enter to return to the main menu"
      read
      clear
      ;;
    4)
      
      ./changepassword.sh
      sleep 1
      clear
      ;;
    5|q|Q)
      echo -e "${BLU}Disconnecting from SingCERT Alerts website scraper${RST}"

      #./pythonBYE.sh #uses pythong to say "BYE!"
      ./progressbarPY.sh

      rm CSAalerts.txt 
      rm CSAalerts_minusTAGS.txt
      echo ""
      exit 
      ;;
    *)
      echo -e "${BRED}Invalid input. Please enter 1, 2, 3, 4 or Q.${RST}"
      sleep 1
      clear
      ;;
  esac
done