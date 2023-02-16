#!/bin/bash

url="https://www.csa.gov.sg/singcert/Alerts"

file="CSAalerts.txt"

curl "$url" > "$file"

