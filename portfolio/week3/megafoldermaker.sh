#!/bin/bash

#creates the week folders in /scripts/portfolio

#change to the correct directory

cd /
cd home/student/scripts/portfolio


 echo "Enter 2 numbers - begin and end"
 read start 
 read end
      
#If there aren't two arguments to the script 
      
#$if (( $#!=2 )); then 
      
    #Print an error and exit 
      
    #echo "Error, provide two numbers" && exit 1 
      
#fi 
      
#For every number between the first argument and the last 
      
for ((i = $start; i <= $end; i++)) 
      
do 
      
    #Create a new folder for that number 
      
    echo "Creating folder week$i" 
      
    mkdir "week $i" 
      
done 
     
					