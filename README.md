## HW 6: Finding Ed Cook 
The purpose of this assignment is to find all New York files from the ITRDB that have been collected by Ed Cook. 

#### Downloading the state data
A states.sh file is attached with the purpose of extracting any of the .rwl files for the ITRDB.

To achieve this, wget is used to recursively download all the .rwl files from the url, excluding those with noaa in them.
`wget -r -e robots=off -A $@'*.rwl' -R *noaa* -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/`

The function can then be used, with New York as an example, with the following code:
` bash states.sh ny`

__Note that the states.sh file has additional functionality in the form of a for loop that is not directly related to this task. 

#### Searching for Ed
The purpose of the next script is to find all files collected by Ed Cook. The script was written search just for someone with "Cook" in the name, but due to how common the name is, I decided to narrow my search.

The script as a whole is as follows:
`wc -l $(grep -w 'Ed Cook' -l *.rwl) | sort | grep -v total  >> CookFiles.txt`

Working through the pipe, this script first searches for all .rwl files from Ed Cook and does produces a word count in the first pipe, `wc -l $(grep -w 'Ed Cook' -l *.rwl)`. Next, `sort` is used to sort by file length. Lastly, grep and the -v flag is used in combination with 'total' to remove the last line, total, which is the total line count, with `grep -v total  >> CookFiles.txt`

The end result is as follows:
```bash
   278 ny025.rwl
   357 ny027.rwl
   186 ny028.rwl
   579 ny029.rwl
   ```
