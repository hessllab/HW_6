```
bash state.sh
```
This tells the computer to follow the command that is within a file called state.sh. 

The command within this file is a wget command that creates and then enters a new folder, downloads all of the files from the NOAA website that were collected in New York (while omitting the ones that contain 'noaa' withing the name), and places them in the new working folder. 
The next command pulls all the lines from .rwl files that conatain the word 'Cook', performs a cut so that only the filename is listed, and then lists the number of lines within each file. The command then sorts the files by number of lines from highest to lowest, and then lists only the bottom 10 lines to remove the total from the top.
