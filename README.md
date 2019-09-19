# states.sh

states.sh is a script that downloads all the files from ITRDB for one state.

#### Usage

`bash states.sh state_abbreviation_lowercase`

First, the script pulls all files from the database containing the state abbreviation input by the user:
```bash
wget -r -q -A "$1"*.rwl -R *noaa* -e robots=off -np -nd https://www1.ncdc.noaa.gov/pub/data/paleo/treering/measurements/northamerica/usa/
```
The `-R *noaa*` term excludes files whose names contain the string `noaa`, which are metadata.

Then, it iterates through all the downloaded files:
```bash
for file in *.rwl
do
```
Data regarding the files are recorded in a new text file, `"$1"_sites.txt`
First it records the filename, sans extension:
```bash
echo $file | cut -d "." -f 1 >> "$1"_sites.txt
```
Then it records the first line of the file:
```bash
head -n 1 $file >> "$1"_sites.txt
```
Once all files are recorded, the loop closes:
```bash
done
```

Example product, for Oklahoma: `ok_sites.txt`
```
ok
730--- 1 ARBUCKLE MOUNTAINS DB0421   TOTAL RING WIDTH                       D421
ok001
NEOSHO RIVER, OKLAHOMA  POST OAK RING WIDTHS (.01MM)
ok004
BLUESTEM LAKE, OKLAHOMA  POST OAK RING WIDTHS (.01MM)
ok007
KEY    1 Keystone Lake                                       QUST               
ok007e
KEY    1 Keystone Lake                                       QUST               
ok007l
KEY    1 Keystone Lake                                       QUST               
ok010
OAKWOOD, OKLAHOMA  POST OAK RING WIDTHS (.01MM)
ok013
CANADIAN RIVER, OKLAHOMA POST OAK RING WIDTHS (.01MM)
ok016
LAKE EUFAULA, OKLAHOMA  POST OAK RING WIDTHS (.01MM)
ok019
MCCURTAIN CO. WILDERNESS, OK  POST OAK RING WIDTHS (.01MM)
...
```

# Filtering database files by author
This is an example of how to filter the output of `state.sh` to find files by a specific author.

### Example
First, you need to use `state.sh` to download the files for New York:
```bash
bash state.sh ny
```
Then you run this long command:
```bash
wc -l $(grep -e "E[\.d] Cook" -l *.rwl) | grep -v total | sort > CookFiles.txt
```
Let's break that down. The first part that bash runs is this:
```bash
grep -e "E[\.d] Cook" -l *.rwl
```
That looks for all the .rwl files that contain either "E. Cook" or "Ed Cook", returning only the filenames:
```
ny015.rwl
ny023.rwl
ny025.rwl
ny027.rwl
ny028.rwl
ny029.rwl
ny038.rwl
ny040.rwl
ny041.rwl
ny042.rwl
```

The `$()` makes that output an argument for the next command, `wc -l`, which counts the lines in each of the listed files:
```
   554 ny015.rwl
   515 ny023.rwl
   278 ny025.rwl
   357 ny027.rwl
   186 ny028.rwl
   579 ny029.rwl
   512 ny038.rwl
   292 ny040.rwl
   767 ny041.rwl
   368 ny042.rwl
  4408 total
```

Then, `grep -v total` removes the lines containing `total`.

Finally, `sort > CookFiles.txt` sorts the entries by file length and saves them to `CookFiles.txt`.
