# Script To Retrieve Tree Ring data and Searches for files written by Ed Cook

This script downloads tree ring data for specified states in the USA from the NOAA's National Centers for Environmental Information database and organizes this information in a new directory called the abbreviation of the state. To check for files that have a header, this script also creates a text file and saves the name of each files in the state with the respective first line of the file. The script then searches for files written by Ed Cook in the downloaded directory, counts the number of lines in these files, sorts it and then saves this info in a new text file called CookFiles.txt

## Prerequisites

To run this script `git bash` and `wget` is required

## Usage

Run the command below in the terminal to utilize the script.
The state_abbrev is the unique two letter abbreviation for states in the USA
```
bash state.sh state_abbrev
```

## Code
```bash
#creates and changes the working directory to a new directory called 'state_abbrev'
mkdir "$1" && cd "$1"

#retrieves .rwl files for specified state from the database excluding files with noaa suffix in their name
wget -r -e robots=off -A "$1"*.rwl -np -nd -q -R "*noaa.rwl" https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/

for sitename in *.rwl 
    do 
        echo $sitename | cut -d . -f 1 >> "$1"_sites.txt   #writes the name of the .rwl without the extension to a textfile named 'state_abbrev'_sites
        
        head -n 1 $sitename >> "$1"_sites.txt #writes the first line of the .rwl file to the textfile
done

#searches for the files Ed Cook contributed to in New York, listed in order of the length of the file in lines and stores the names of those files in a text file called CookFiles.txt
wc -l $(grep -i "Cook" -l *.rwl) | sort | sed -e '/total/d' >> CookFiles.txt
```

## Product
The script creates a new directory called the state abbreviation. 
for example; if the state is __New York__, the name of the directory created will be __ny__

In this directory, the script stores all the retrieved .rwl files for that state.

Then the for loop in the script produces a text file of site names followed by the first line (header) of the file:

```
ny
140-1  1 RAQUETTE LAKE
ny001
046011  1710    10    10    17    12    13    12     2    10     7     8
ny002
017021  1713   116    94   111   133    82    67    85                  
ny003
367011  1821   176   142    90   109    80    53    68    45    64      
ny005
420112  1745    33    21    30    60    35    24                        
ny006
118011  1678   171   139                                                
ny008
018011  1666    45    46    63    67
ny009
024011  1661    60    57    71    64    60    42    60    58    59      
ny010
023011  1753     8     7    10    18    10    16    16                  
ny011
RR0021  1695    85    26    41    45    52                              
ny012
117011  1695    64    55    55    37    39                              
ny013
042031  1719    41                                                      
ny014
040011  1714   250   239   263   177   145   164                        
ny015
MIDDLE 1 Middleburgh                                         JUVI               
ny016
TVW    1 Goose Egg Ridge                                     QUAL               
ny017
TVP    1 Goose Egg Ridge                                     QUPR               
```
`wc -l $(grep -i "Cook" -l *.rwl) | sort | sed -e '/total/d' >> CookFiles.txt` in the script searches for the files written by Ed Cook, returns the number of lines in the files, sorts it and then stores this info in a new text file called "CookFiles.txt" excluding the total that usually accompanies the `wc -l` command. The result of the text file is:
```
   186 ny028.rwl
   278 ny025.rwl
   292 ny040.rwl
   357 ny027.rwl
   368 ny042.rwl
   512 ny038.rwl
   515 ny023.rwl
   554 ny015.rwl
   579 ny029.rwl
   767 ny041.rwl
```

## Author

[Tobi Ore](https://github.com/tobi-ore)

## License

[This project is licensed under the MIT License](https://choosealicense.com/licenses/mit/)

## Acknowledgments

[Dr Amy Hessl](https://github.com/hessllab)
