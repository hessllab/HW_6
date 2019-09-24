##### `states.sh` contains following script.  
```  
# states.sh  
# Download all the .rwl files for a specified state from ITRDB website, and create a text file that contains a list of filenames that are contributed by Ed Cook.  
# Usage: bash state.sh state_abbrev_in_lowercase  
# Products: ./'state_abbrev'_directory/'state_abbrev'.rwl, CookFiles.txt  

wget -P ./"${1^^}"/ -r -e robots=off -A "$1"'*.rwl' -np -nd "https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/"  
wc -l $(grep -E -m 1 -w "(Cook, E.R.)|(Ed Cook)|(E.R. Cook)|(E. Cook)" ./"${1^^}"/*.rwl | cut -d : -f 1) | sort | sed '/total/d' | cut -d / -f 3 > ./"${1^^}"/CookFiles.txt  
```  

##### This script utilizes the `wget` command line in HW_5, except the _reject list_. In here, `-R '*-noaa.rwl'` in HW_5 is deleted so that all the .rwl files for a specified state will be downloaded.  
##### In the second command line, `$(grep -E -m 1 -w "(Cook, E.R.)|(Ed Cook)|(E.R. Cook)|(E. Cook)" ./"${1^^}"/*.rwl | cut -d : -f 1)` will search for all the files contributed by Ed Cook and print a path for each of such files. The combination of the flag `-E` and `"(Cook, E.R.)|(Ed Cook)|(E.R. Cook)|(E. Cook)"` will enable the `grep` to catch all possible Ed Cook expressions in the .rwl files and exclude other Cooks that may exist. Flag `-m` will define _maximum count_. Thus, `-m 1` will make the `grep` stop searching for Cook's name when it finds one. Output of this `grep` command, _Path/Filename.rwl:# A_Text_Line_With_Cook's_Name_, is piped to `cut -d : -f 1` to cut off the text part. In this way, the command within `$()` will create a list of path and filenames that contain Ed Cook's name in its text.  
##### Finally, the number of lines in the .rwl files are counted by `wc -l $()` and piped to `sort` to sort them in ascending order. The following `sed '/total/d'` will delete any line that contains the word "total", so that the resulting output won't have the total count of line numbers. Since the result is a list of _Line_Number  ./StateAbbrev/Filename.rwl_, `| cut -d / -f 3` will cut off all the texts before the filenames and extracts purely a list of .rwl files that contain Ed Cook's name.  
##### The last `> ./"${1^^}"/CookFiles.txt` will redirect the resulting text into a text file, "CookFiles.txt", in the same folder of all the downloaded .rwl files.  
