### Homework 5
### Sara Schreder-Gomes
____________

### Requirements

1) Internet connection
2) Installation of Git Bash
3) Installation of wget

### Usage

With the basic bash script the user will be able to pull and summarize data from one state of tree ring data at a time using: `bash state.sh "state_abbrev"`

The state abbreviation will be two letters, in lowercase. For this case, we want New York's tree ring data so we will use the abbreviation `ny`. The script also aims to reduce clutter by creating a directory to hold the individual state directories.
`bash state.sh "ny"`

The bash script in state.sh will make a new directory for New York and only pull the files without the "-noaa.rwl" ending. The script also contains the loop that from the previous exercise that creates a text file with a listof the sitename and first line of the file. This may be helpful to spot check accuracy. 


```bash
cd ITRDB_by_state/ny
wc -l $(grep -l "Cook" ny*.rwl) | sort | sed '$d' | cut -c 10- >> CookFiles.txt
```
This code changes to the appropriate working direcotry before running a line cound on the files pulled from the grep. The `-l` flag in the grep retrieves only the filenames that contain the argument. Then, the `sed` command  deletes the last line that contains the line count totals, then it pipes to a cut that leaves only the filenames. The list is pushed to a text file that lists only the data submitted by Ed Cook. This section can be modified with variables to pull from any state for any author. 

### Products

The output of script is a list of files for New York that were submitted by a specific contributor, in descending order by line count. 

```
ny028.rwl
ny025.rwl
ny040.rwl
ny027.rwl
ny042.rwl
ny038.rwl
ny023.rwl
ny015.rwl
ny029.rwl
ny041.rwl
```

### Resources

All data used for this script can be found online through NOAA, at: https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/


### Author

Sara Schreder-Gomes

 
