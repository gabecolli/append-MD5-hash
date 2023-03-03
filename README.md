# append-MD5-hash
powershell code that appends the md5 hash to a filesname as it is written.
For $folderpath please enter the path you would like monitored.
$filter this is set to <*.*> which will apply to ALL files in the folderpath
set $watcher.IncludeSubdirectories = $true if you also want to apply this script to subdirectories. 
Keep in mind this script is written in a while loop and will run indefinitely unless manually stopped. 
