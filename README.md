# merge-dicts

This is a python script to automatically merge multiple tabfile dictionaries (with .txt extension) and other .txt files; note that this script may not work properly with other dictionaries, so if you need to merge any number of dictionaries, convert each one of them using pyglossary to .txt tabfile then merge them.

The script will ask you to define the number of the files that you want merge, then optionally convert the merged .txt file to .mtxt (octopus mdict source), and then pack it to .mdx dictionary.

<br />
<br />

## DEPENDENCIES:

Pyglossary, mdict-utils, python-lzo

<br />
<br />

## USAGE:

# merge-dicts


This is a python script to automatically merge multiple tabfile dictionaries (with .txt extension) and other .txt files; note that this script may not work properly with other dictionaries, so if you need to merge any number of dictionaries, convert each one of them using pyglossary to .txt tabfile then merge them.


The script will ask you to define the number of the files that you want merge, then optionally convert the merged .txt file to .mtxt (octopus mdict source), and then pack it to .mdx dictionary.


<br />
<br />


## DEPENDENCIES:


Pyglossary, mdict-utils, python-lzo


<br />
<br />


## USAGE:


- Navigate to the directory that contains this script and copy the dictionary files to the same directory, and  run this command: `python merge-dicts.py`


- Before merging, the script will ask you if you want to sort the files (file1 then file2, etc) or not.


- After merging, the script will ask you if you want to convert the resulted file to .mtxt and sort headwords (ex. english then arabic headwords) or not, and finally will ask you if you want to convert the resulted .mtxt file to .mdx.




Thanks to the owners of Pyglossary and mdict-utils.


Download my modified version of Pyglossary from Google Drive, with octopus_mdict_source.py plugin added and setup.py file fixed; after decompression of the downloaded file, you can do: `python setup.py install` from inside the decompressed folder to install pyglossay and it will work perfectly: [LINK](https://drive.google.com/open?id=1foGOqZGtbVgG65zlEk2hXMPXKSQyNuIX)
