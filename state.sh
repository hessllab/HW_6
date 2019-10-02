## This script extracts the tree_ring data for specified states from NOAA's National Climatic Data Center repo and saves it in a new file
# Usage: bash state.sh state_abbrev
# Products: 'state_abbrev'_sites.txt, 'state_abbrev'/ directory containing rwl files for that state

mkdir "$1" && cd "$1"  
wget -r -e robots=off -A "$1"*.rwl -np -nd -q -R "*noaa.rwl" https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/

for sitename in *.rwl 
    do 
        echo $sitename | cut -d . -f 1 >> "$1"_sites.txt   #writes the name of the .rwl without the extension to a textfile named 'state_abbrev'_sites
        
        head -n 1 $sitename >> "$1"_sites.txt #writes the first line of the .rwl file to the textfile
done

# needs a change of directory to the state abbrev in order for the script to work independently.
#searches for the files Ed Cook contributed to in New York, listed in order of the length of the file in lines and stores the names of those files in a text file called CookFiles.txt
wc -l $(grep -i "Cook" -l *.rwl) | sort | sed -e '/total/d' >> CookFiles.txt
