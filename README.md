# state_author.sh
## Download All .rwl Files for a State from NOAA NCEI and find the files containing a given author.

The attached script "state_author.sh" can be used to download Tree Ring Data from NOAA's Database and find the files authored a given person (e.g. Ed Cook). The users only needs to input the initials of the State that she wants to download and the author's last name in quotation marks.  

## Requirements
- Connection to internet. 
- Instalation of Git Bash. 
- Instalation of `wget`. 
- Enough space to save files in the selected directory.

## Usage

To run the file the user should open the Bash terminal and input the following code
```{Bash}
bash state_author.sh $1 $2
```
Where ```$1``` refers to the initial in lowercase letters of the State that is to be downloaded (e.g. ny for New York, or wv for West Virginia); and ```'$2'``` refers to the author's last name to query. 
For example: ``` bash state_author.sh ny 'Cook'``` will download all the files from NY state and then give information of which files where authored by Cook. 

## Products:
 1) The creation of a folder named after the initials of the state inputted. The folder will be located in the directory where the cook_script.sh is located. 
2) Donwloading all the ```.rwl``` files with data from that State, except files containing the word "noaa".
3) A text file named after the state abbreviation followed by "sites". The text file will list all the downloaded file names without their extention and a line that includes (but not in every case) the site where the data was collected.  
4) A text file named 'Author_files.txt' which contains a sorted list of the file names that have the author queried by the user. The list is sorted by the number of lines contained in each file. 








