# HW_6 Shell Script
# Downloads .rwl files from NY and finds files only reported by 'Ed Cook'

# Makes new directory and changes into it, this case it will be NY
mkdir "$1"
cd "$1"

# Downloads all files from NY
wget -r -e robots=off -A "$1"*.rwl -R *noaa* -np -nH -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/

# Finds all files from NY reported by Ed Cook, sorts them in order of line count
# and places them into a new text file
wc -l $(grep -i -l 'cook' *.rwl) | sort | sed /total/d | cut -d '.' -f 1 > CookFiles.txt

# usage: bash HW_6.sh ny