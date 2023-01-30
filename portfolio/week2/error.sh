#!/bin/bash 
      
secret='alice'

#Don't tell anyone! 

echo -n "What is the secret code?"
echo

read -s -r REPLY
      
#if the user types in the correct secret, tell them they got it right! 
      
if [ "$REPLY" = "$secret" ]; then 
      
    echo "You got it right!" 
      
    correct='true'
      
else     

    echo "You got it wrong :(" 
      
    correct='false' 
      
fi 
      

      
echo 
      
case $correct in 
      
false) 
      
    echo "Go Away!" #people who get it wrong need to be told to go away! 
      
    ;; 
      
true) 
      
    echo "You have unlocked the Secret Menu!" 
    echo

esac

#TODO: Secret Menu added below 

echo "You have reached this Menu because the T-Virus has escaped the Hive"
echo "Please choose one of the following options..."
echo "Press 1 to launch a nuclear attack on Raccoon City"
echo "Press 2 to engage Alice Abernathy"
echo "CHOOSE CAREFULLY!"

read -r OPTION

    case $OPTION in

    1)

    echo "A thermonuclear attack on Raccoon City will begin in 40 minutes"
    echo
    ;;

    2)

    echo "Alice Abernathy has been deployed to deal with the outbreak"
    echo
    ;;

    *)

    echo "Ooops, invalid input. Umbrella Corp security is heading for your location"
    echo
    ;;



      
    
      
esac




   

     
     
     
					