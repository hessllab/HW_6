# states.sh
# Download all the .rwl files for a specified state from ITRDB website, and create a text file that contains a list of filenames that are contributed by Ed Cook.
# Usage: bash state.sh state_abbrev_in_lowercase
# Products: ./'state_abbrev'_directory/'state_abbrev'*.rwl, CookFiles.txt  

wget -P ./"${1^^}"/ -r -e robots=off -A "$1"'*.rwl' -np -nd "https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/"
wc -l $(grep -E -m 1 -w "(Cook, E.R.)|(Ed Cook)|(E.R. Cook)|(E. Cook)" ./"${1^^}"/*.rwl | cut -d : -f 1) | sort | sed '/total/d' | cut -d / -f 3 > ./"${1^^}"/CookFiles.txt