#!/bin/bash
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

#script displays IP addresses in input.txt in table
#________________________________  
#| Server Type | IP             |                                                                                                                       
#|             |                |                                                                                                                       
#| DNS         | 8.8.8.8        |                                                                                                                       
#|             |                |                                                                                                                       
#| DNS2        | 8.8.4.4        |                                                                                                                       
#|             |                |
#| BOT         | 64.68.90.1     |
#|             |                |
#| WEB         | 216.58.200.11  |
#________________________________


      
echo "Google Server IPs:" 
      
awk 'BEGIN { 
      
    FS=":"; 
      
    print "________________________________"; #prints top line of table
    
    print "| \033[34mServer Type\033[0m | \033[34mIP\033[0m             |" #prints table heading
      
} 
      
{ 
      
    printf("| \033[33m%-11s\033[0m | \033[35m%-14s\033[0m |\n", $1, $2);  #prints values to table
      
} 
      
END { 
      
    print("________________________________"); 
      
}' input.txt 
     
echo ""
					