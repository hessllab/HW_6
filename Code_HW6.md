# ITRDB script for any state
Goal of this assignment was to optimize the script from HW_4 so that it can run for any data
in the ITRDB. In addition this script will create a new directory for any given state and 
place all respective files into this new directory.

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
for sitename in "$1"*.rwl
do
  echo $sitename | cut -d '.' -f 1 >> "$1"_sites.txt
  head -n 1 $sitename >> "$1"_sites.txt
done
```
This for loop reports the sitename and first line from the header of each rwl file from a specificed state into a new text file named
sites.txt. It ultilizes the cut command and uses the period as a delimiter along with " -f 1 " to report anything that comes
before the period. This loop will work for any state, again as the wildcard $1 can be subsituted for any state abbreviation.

## Results
The textfile that is created for any given state reports the sitename along with the first line from the header. This textfile
along with all repspective rwl files for that state are placed into a directory for that state. An example of the text file created
for West Virginia is shown below.
```
wv001
020011  1796   107   100   107   131                                    
wv002
065031  1793   127   115   105   152   159   231   159                  
wv003
067011  1876   331   225   550   437
wv004
NERI   1 New River Gorge                                     PIVI               
wv005
CKMKBK 1 Cedar/Moser/Bible Knobs                             JUVI               
wv006
PIPE   1 Pipestem Resort State Park                          TSCA               
wv007
CAGO   1 Cabwaylingo State Forest                            TSCA      
```
## Usage
Usage: bash states.sh wv (or any other state(s))
The script submitted along with this assignment can be bashed for any state or multiple states at a time.
Each state will be placed into a respective directory.
