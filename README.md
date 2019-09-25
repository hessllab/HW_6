# Caleb Malay HW_6

Creates directory to store downloaded tree ring data using `$1` as a variable for the state abbreviations. 
```bash
mkdir "$1"
cd "$1"
```

Uses wget to download state tree ring data ending with `.rwl` and uses `-R` to exclude downloading files that contain `noaa` in the name.
Using `"$1"*.rwl` uses a variable to also include files that may have a letter at the end of their name. 
```bash
wget -r -q -A "$1"*.rwl -R '*noaa*' -e robots=off -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/
```

Uses a `for loop` to print the file name then uses `.` as the delimeter and `-f 1` to select the first column as well as taking the first
line of each file and sending it to a text file. Placing `"$1"` in front of the text file name allows for the desired state's abbreviation
to be placed before `_sites.txt.`
```bash
for filename in *.rwl
  do
    echo "$filename" | cut -d '.' -f 1 >> "$1"_sites.txt
    head -n 1 "$filename" >> "$1"_sites.txt
  done
```
Here is an example output using `bash state.sh ak`
![HW_5_example](HW_5_example.jpg)

After the New York files have been downloaded, it's time to search for ones with the author Ed Cook.
Set your New York folder as the current directory
```bash
cd ny
```
This script gets the word count of the `.rwl` files with the author Cook. The `-i` flag will make it non-case sensitive. The data is then sorted. Using `grep`, I was able to cut the line with the `total` from the result. The final result is sent to a text file.
```bash
wc -l $(grep -w -i 'Cook' -l *.rwl) | sort | grep -v total > CookFiles.txt 
```
![HW6_example](HW6_example.png)









