mkdir -p ITRDB_by_state/"$1"
cd ITRDB_by_state/"$1"
wget -r -e robots=off -A "$1"'*.rwl' -R "$1"'*-noaa.rwl' -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/

for sitename in "$1"*.rwl
do
  echo $sitename | cut -d '.' -f 1 >> "$1"_sites.txt
  head -n 1 $sitename >> "$1"_sites.txt
  echo  >> "$1"_sites.txt
done

wc -l $(grep -l "Cook" ny*.rwl) | sort | sed '$d' | cut -c 10- >> CookFiles.txt
