#$dirName = 'C:\Users\nghie\Desktop\IA0059\scripts\T4\Archive List\IA0059_Script_T4_Request for Export 2006-2007'

cd $dirName

#Get files info
$files = Get-ChildItem N*.xml -Recurse -File
$files.Count

#Rename
Get-ChildItem N*.xml -Recurse -File | Rename-Item -NewName{$_.Name -replace 'N', 'M' }