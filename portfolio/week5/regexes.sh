#!/bin/bash

#Create a script named “regexes.sh” and write grep -r statements to search your work for the following patterns:

#all sed statements
#all lines that start with the letter m
#all lines that contain three digit numbers
#all echo statements with at least three words
#all lines that would make a good password (use your knowledge of cybersecurity to decide what makes a good password).


grep -r '^sed'  #search for "sed"

grep -r '^m'    #search for "m"

grep -rE '[0-9]{3}' #search for 3 digit numbers

grep -rE 'echo\s+.*\s+\S+\s+\S+\s+\S+'  #search for echo statements with at least 3 words

# good password = 10+ characters, upper and lower case characters, special characters !@#$%^&*

grep -rE '^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*]).{10,}$'

