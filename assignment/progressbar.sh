#!/bin/bash
#progress bar


sliding=0
target=20

echo "Please wait while Umbrella Corp Security checks your credentials..."

while [ $sliding -lt $target ]
do
    sliding=$((sliding+1))
    printf "\r%-20s" "$(printf '#%.0s' $(seq 1 $sliding))$(printf ' %.0s' $(seq 1 $((target-sliding))))"
    sleep 0.1
done
echo "All good.  Welcome to Umbrella Corp"
sleep 3
figlet "Our Business Is Life Itself"