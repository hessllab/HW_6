### Finding Authors on ITRDB 
Problem: Cynthia has noticed that certain authors make excellent collections on the NCEI ITRDB.  She would like to develop a script that will pull all the ITRDB files for a single author in a single state.  For example, she would like to download and review all of the files Ed Cook contributed to in NY. She is wise and plans to start by using her existing _state.sh_ script to download the data from NY, then use `grep` and `find` to make a list of Ed Cook's files.  Once she is successful, she will generalize her script for any state and any author.


#### Objective: 
1)	Extract all the _.rwl_ data files for any state from the ITRDB using _state.sh_.
2)	Use `grep`, `cut` and `$()` to make a text file called _AuthorNameFiles.txt_ that lists the names of the files contributed by any author, listed in order of the length of the file in lines. Try using `sed` to eliminate the last line of "totals". 


Update your previous _README.md_ file from HW_5 with an example of how to use your _state.sh_ script in combination with other __bash__ commands to create _AuthorNameFiles.txt_.  If you made any changes to your _state.sh_, please update that script as well.

_Check out this [resource](https://gist.github.com/jxson/1784669) for _README.md_ suggestions._

#### What to Submit:
1) _README.md_ updated from HW_5 with new example that creates _AuthorNameFiles.txt_
2) _states.sh_ 

#### Submit using the fork-clone-branch-commit-pull_request strategy.







