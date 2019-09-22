# cook_script.sh
## Download All .rwl Files for a State from NOAA NCEI and find the files authored by Ed Cook.

The attached script "cook_script.sh" can be used to download Tree Ring Data from NOAA's Database and find the files authores by Ed Cook. The users only needs to input the initials of the State that she wants to download. 

## Requirements
- Connection to internet. 
- Instalation of Git Bash. 
- Instalation of `wget`. 
- Enough space to save files in the selected directory.

## Usage

To run the file the user should open the Bash terminal and input the following code
```{Bash}
bash cook_script.sh $1
```
Where ```$1``` refers to the initial in lowercase letters of the State that is to be downloaded (e.g. ny for New York, or wv for West Virginia). 

## Products:
 1) The creation of a folder named after the initials of the state inputted. The folder will be located in the directory where the cook_script.sh is located. 
2) Donwloading all the ```.rwl``` files with data from that State, except files containing the word "noaa".
3) A text file named after the state abbreviation followed by "sites". The text file will list all the downloaded file names without their extention and a line that includes (but not in every case) the site where the data was collected.  
4) A text file named 'Cookfiles.txt' which contains a sorted list of the file names that have Ed Cook as author. The list is sorted by the number of lines contained in each file. 








