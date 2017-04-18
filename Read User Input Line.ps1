'DISPLAY FILES IN DIRECTORY'
$dirName = Read-Host "Enter a directory"

#Get-ChildItem $dirName -force
Get-ChildItem $dirName -recurse

