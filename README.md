### ITRDB Script for Any State PLUS Example for how to find all files by Ed Cook
Zack Grzywacz

#### State.sh

For this script, the user must add the state abbreviation after typing "bash state.sh". This makes the state abbreviation take the spot of "$1" in the code. We will start by making and entering a new directory, so that the paths are absolute and can be replicated anywhere.
```
# Download tree ring data for any US State  
# Usage: bash state.sh state_abbreviation  
mkdir "$1"_trees
cd "$1"_trees
```

Next, we will gather the data with wget. This uses two wget requests because some state codes have an extra letter at the end - yet we do not want the files that contain "-noaa". So we use ? wildcards instead of *.
```
wget -r -e robots=off -A "$1"???.rwl -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/
wget -r -e robots=off -A "$1"????.rwl -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/
```

Now, we will use a loop to print the site name and first line of each file to a .txt file. Note that only the first five characters are cut from the filename - this leaves off any extra letters at the end of the files that are formatted like "az544t.rwl". I do this assuming that the letter 't' is not a part of the site name.
```
for filename in *.rwl
 do
  ls "$filename" | cut -c 1-5 >> "$1"_sites.txt
  head -n 1 "$filename" >> "$1"_sites.txt
 done
```

#### Finding Ed Cook

First, we will use state.sh to collect all New York files from the database.

```
bash state.sh ny
```
For ease, I will enter the new directory I just created
```
cd ny_trees
```
Next, we must use a command that finds all files by Ed Cook (through grep), lists the filenames (find), lists line counts, cuts characters, and sorts by line count.
```
wc -l $(grep -i -w "Cook" $(find . -name '*.rwl') | cut -c 3-11) | head -n 10 | sort -n >> CookFiles.txt
```

In this line of code, 'find' operates first by finding all the .rwl files in the directory.  
Next, 'grep' lists all of the files and lines that contain "Cook". I used "Cook" instead of "Ed Cook" because it appears that his name is sometimes shortened to E. Cook.  
Then, 'cut -c 3-11' cuts away at the line of text until only the filename remains - luckily, here all of the filenames contain the same number of characters  
Next, 'wc -l' adds the number of lines in each file directly in front of the filename.  
'head -n 10' removes the "Total" line at the bottom.  
Finally, 'sort -n' sorts the files by the number of lines, and '>> CookFiles.txt' creates a file and appends this information within it.


