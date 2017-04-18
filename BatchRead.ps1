cd C:\Users\nghie\Desktop\p
$files = dir *.log
$errStr = 'Cannot export OLE'
$regex = "\[([0-9a-zA-Z]{32})\]"
$errList = New-Object System.Collections.ArrayList
$errUniqueList = New-Object System.Collections.ArrayList

'Scanning log files...please wait.'

foreach ($file in $files){
    '....reading file ' + $file
    $content = Get-Content $file.Name
    forEach($line in $content){
        if($line.Contains($errStr) -and ($line -match $regex)){
            [void]$errList.Add($matches[1])
        }
    }

}

'Error Type: ' + $errStr 
'Total Links Failed: '+  $errList.Count 
$errUniqueList  = $errList | sort -unique
'Total Items: ' + $errUniqueList.Count


#$errList | Foreach-Object { $_.Substring(0,2) } |Select-Object -unique > output.txt
#$errUniqueList = $errList | select -uniq
#$errUniqueList > output.txt
