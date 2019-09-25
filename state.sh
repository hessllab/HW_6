# Extracts the tree_ring data for specified states and save it in a new file
# Usage: bash state.sh state_abbrev
mkdir "$1" && cd "$1"
wget -r -e robots=off -A "$1"*.rwl -np -nd -q -R "*noaa.rwl" https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/
for sitename in *.rwl 
    do 
        echo $sitename | cut -d . -f 1 >> "$1"_name.txt
        head -n 1 $sitename >> "$1"_name.txt 
done