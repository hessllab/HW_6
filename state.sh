# Download all .rwl files that do not contain "noaa"
wget -r -q -A "$1"*.rwl -R *noaa* -e robots=off -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/
# Iterate through downloaded files
for file in *.rwl
do
	# Record the name of the file (without the extension)
	echo $file | cut -d "." -f 1 >> "$1"_sites.txt
	# Record the first line of the file
	head -n 1 $file >> "$1"_sites.txt
done