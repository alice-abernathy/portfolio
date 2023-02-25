#the purpose of this script is to generate a progress bar
#this was to incorporate some python in Assignment4
#to write this script was far simpler than in bash

import sys  #allows bar to be printed on one line and error handling by flushing the buffer
import time #allows for the progress of the bar to be defined

#define the total number of iterations
total = 100

#define the width of the progress bar
bar_width = 75

#iterate through the range
for i in range(total):
    #calculate the progress percentage
    progress = (i + 1) / total

    #calculate the number of bars to display
    num_bars = int(progress * bar_width)

    #construct the progress bar using '|' with '[]' at the ends of the field
    bar = "[" + "|" * num_bars + " " * (bar_width - num_bars) + "]"

    #construct the percentage label with '.0' specifying no decimal places and '%' displays as a percentage
    percent = "{:.0%}".format(progress)

    #construct the final progress bar string
    progress_bar = "\r{} {}".format(bar, percent)

    #write the progress bar to stdout, using the sys module
    sys.stdout.write(progress_bar) #outputs to one line instead of successive lines, removes the newline character
    sys.stdout.flush() #error handling by flushing the buffer, without this command the output wasn't consistent

    #timing for the bar's progress
    time.sleep(0.01)

#print a newline character to clear the progress bar
print()