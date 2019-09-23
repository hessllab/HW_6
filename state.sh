mkdir output
cd output
wget -r -e robots=off -A 'ny???.rwl' -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/

wc -l $(grep Cook *.rwl | cut -d : -f 1) | sort -rn | tail -n 10