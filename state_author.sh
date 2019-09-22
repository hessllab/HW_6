# cook_script.sh
# Application: Download .rwl files with Tree ring data from an specific State and authored by Ed Cook, obtain a list of files and site names that State.
# Usage: bash state.sh state_abbrev 'author'
# Products: 'state_abbrev'_sites.txt , 'state_abbrev'/directory containing the rwl files, text file Cookfiles.txt with name of fiels by Cook in order of number of lines. 

# ## Part I: Downloading the data from the Internet 
# The following code downloads the files from the state that we have entered.  

wget -P $1 -nd -r -e robots=off -A $1'*.rwl' -R '*-noaa.rwl' -np -q https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/ #code to retrieve the data
 
# ## Part II: Loop to retrieve the site information from the files. ## 

# The following loop finds the file name, deletes the file extension and then writes a line to the file `sitename.txt`. It then adds another line with the information of the first line of that file. The loop continues until all the files have been processed.  

cd $1
for filename in *.rwl
do
echo $filename | cut -d . -f 1 >> "$1"_sites.txt
head -1 $filename >> "$1"_sites.txt
done

# ## Part III: Finding the files with the inputed author.

# The following code will find the files that contain $2 (i.e. the author inputed in the bash command), then it will count the lines of those files, 
# and delete the last totalizing lines. After sorting by the number of lines, the information is saved into a new file named after the author. 

wc -l $(egrep -l $2 *.rwl) | sed '$d' | sort | cut -d ' ' -f 5 > "$2"_files.txt