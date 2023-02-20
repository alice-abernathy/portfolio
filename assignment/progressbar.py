import sys
import time
#from termcolor import colored

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

    #construct the progress bar
    bar = "[" + "|" * num_bars + " " * (bar_width - num_bars) + "]"

    #construct the percentage label
    percent = "{:.0%}".format(progress)

    #construct the final progress bar string
    progress_bar = "\r{} {}".format(bar, percent)

    #write the progress bar to stdout
    sys.stdout.write(progress_bar)
    sys.stdout.flush()

    #timing for the bar's progress
    time.sleep(0.01)

#print a newline character to clear the progress bar
print()