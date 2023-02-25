#!/bin/bash
#the purpose of this script forms the Main Menu of Assignment 4
#earlier versions had a 'if/elif/else' loop but as the menu options increased, it was simpler to write a C style loop


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

#define colors differently when the escape codes don't work as in 'choices'

red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
purple=$(tput setaf 5)
cyan=$(tput setaf 6)
orange=$(tput setaf 202)
pink=$(tput setaf 213)
brightred=$(tput setaf 196)

reset=$(tput sgr0)


#no color
RST="\033[0m"

clear #clears screen to tidy up output

progress_bar ()  ###function: draws a progress bar across the screen
{
#define the maximum number of iterations
max=50

#loop over the iterations
for i in $(seq 1 $max); do
    #calculate the percentage of completion
    percentage=$((i * 100 / max))

    #calculate the number of characters to fill the progress bar
    bar_length=$((i * 50 / max))

    ###output the progress bar
    #%-50s %d%%\ > format string formatting output - left-aligned, 50 chars wide
    #\r > move cursor to beginning of line, line updates in place
    #$(printf '|%.0s' $(seq 1 $progressBAR)) generates '|' to form the bar
    # '|%.0s' always print '|'
    printf "%-50s %d%%\r" "$(printf '|%.0s' $(seq 1 $bar_length))" "$percentage"
   

    #wait for 0.01s
    sleep 0.01
done

#output a newline character
echo ""
} ###end function

echo
echo -e "${BLU}Welcome to the SingCERT Alerts website scraper${RST}"

#challenge user for their password

./passwordcheck.sh #calls password check script

#check exit code, if "1", exit completely

if [ $? -ne 0 ]; then  #visual studio didn't like me using $?,why?
  exit 1
fi

echo ""
echo -e "${BLU}Before we begin, the scraper will scrape the website now${RST}"
echo ""

./progressbarPY.sh #output python progress bar

#download data from CSA website before user is presented with the main menu

./websitescraper.sh #calls websitescraper.sh to download the data
./readCSAalerts.sh > /dev/null #calls readCSAalerts.sh but suppresses the output by sending it to /dev/null

clear

while true; do

  #choices defines MAIN MENU choices
  choices=(
            "${blue}View current alerts from ${reset}${yellow}https://www.csa.gov.sg/alerts-advisories/alerts${reset}" 
            "${blue}Download ${green}fresh data${reset}" 
            "${orange}Keyword${blue} search${reset}" 
            "${pink}Change password${reset}" 
            "${green}Quit${reset}"
          )


  echo -e "${BLU}$(figlet Main Menu)${RST}" #banners MAIN MENU

  for i in "${!choices[@]}"; do     #the 'for' loop that iterates over the above 'choices'
    echo "$((i+1))) ${choices[$i]}" #'$(i+1)))' places a number in front of the option, '${choices[$i]}' outputs the choice
  done
  
  #read -p "Please enter an option: r" input
  echo -e "${BBLU}Please enter an option: ${RST}"
  read -r input
  
  case $input in
    1)
      echo -e "${BLU}Getting data...${RST}" #choice 1
      progress_bar #calls the progress_bar function

      ./readCSAalerts.sh #calls ./readCSAalerts.sh to output the current alerts which has been scraped

      echo ""
      echo -e "${RST}Press enter to return to the main menu - this will clear the screen"
      read -r
      clear
      ;;
    2)
      echo -e "${BLU}Running websitescraper.sh...${RST}" #choice 2
      progress_bar #calls the progress_bar function

      ./websitescraper.sh #
      echo "Press enter to return to the main menu"
      read -r
      clear
      ;;
    3)
      echo -e "${BLU}" #choice 3
      rm -f CSAalerts_minusTAGS.txt #removes old text file to stop data being duplicated inside the text file on output
      ./readCSAalerts.sh #call the readCSAalerts.sh script to regenerate the text file CSAalerts_minusTAGS.txt
      
      echo ""
      ./keyword.sh #call keyword.sh script
  
    
      clear
      ;;
    4)
      
      ./changepassword.sh

      sleep 1
      clear
      ;;
    5|q|Q) #the user can choose '5', 'q' or 'Q' to quit

      echo -e "${BLU}Disconnecting from SingCERT Alerts website scraper${RST}"

      #uses python progress bar on exit
      ./progressbarPY.sh

      #removes text files to stop text duplicating everytime you use ./MAINmenu.sh
      rm CSAalerts.txt 
      rm CSAalerts_minusTAGS.txt

      echo ""
      exit 
      ;;
    *)
      echo -e "${BRED}Invalid input. Please enter 1, 2, 3, 4 or Q.${RST}" #error handling if something other than the displayed choices is entered
      sleep 1
      clear
      ;;
  esac
done