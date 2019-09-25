wget -r -e robots=off -A $@'*.rwl' -R *noaa* -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/

for files in *.rwl
  do
  echo "$files" | cut -d '.' -f 1 >> $@_sites.txt
  head -n 1 $files >> $@_sites.txt
done