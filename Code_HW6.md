# Finding Ed Cook Script
Goal of this assignment is use the existing script from HW_5 to pull all .rwl files from NY. Specifically, files from Ed Cook
contain excellent data and headers, so we want to isolate all the files from NY that are from Ed Cook.

## Part 1
```
mkdir "$1"
cd "$1"
```
This makes a directory for any given state (using wild card $1 as the state abbreviation) then changes right into that 
new directory. All files created from the following code will then be placed into this new
directory.

## Part 2
```
wget -r -e robots=off -A "$1"*.rwl -R *noaa* -np -nH -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/
```
This line of code uses wget to pull all rwl files for a specified state (again using $1 to indicate it could be any state) 
while excluding any files that contained noaa in their names.

## Part 3
```
wc -l $(grep -i -l 'cook' *.rwl) | sort | sed /total/d | cut -d '.' -f 1 > CookFiles.txt
```
Once the data files from NY were downloaded, the line of code above was used to select any files from NY that contained the word "cook"
in them to match them to Ed Cooks name. The -i flag was used to make cook non-case sensitive. The line of code then listed all of the files from NY that matched "Ed Cook" and sorted them my line count from lowest number of lines to highest number of lines. The sorted files were then placed into a new text file named CookFiles.txt which excluded the file extensions and total line count for all the files. 

The loop used in HW_5 was no needed in this challenge because we knew by default that any files with "Ed Cook" would have good header data and the point of the loop from the last assignment was to determine which files had headers and which did not. We also only cared about the filename from the NY files as well.

## Results
The textfile (CookFiles.txt) that is created for files by Ed Cook are shown below. The files are listed in order of shortest line count to longest line count. From the files downloaded from NY only, 10 files were reported by Ed Cook.
```
   186 ny028
   278 ny025
   292 ny040
   357 ny027
   368 ny042
   512 ny038
   515 ny023
   554 ny015
   579 ny029
   767 ny041     
```
## Usage
Usage: bash states.sh wv (or any other state(s))
The script submitted along with this assignment can be bashed for any state or multiple states at a time.
Each state will be placed into a respective directory.
