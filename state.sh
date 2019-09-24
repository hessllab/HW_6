# Download tree ring data for any US State  
# Usage: bash state.sh state_abbreviation  
mkdir "$1"_trees
cd "$1"_trees
wget -r -e robots=off -A "$1"???.rwl -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/
wget -r -e robots=off -A "$1"????.rwl -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/
for filename in *.rwl
 do
  ls "$filename" | cut -c 1-5 >> "$1"_sites.txt
  head -n 1 "$filename" >> "$1"_sites.txt
 done
 

 