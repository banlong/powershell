cd C:\Users\nghie\Desktop\P
$content = Get-Content 'IA0059_Log_T1_RFE_2006.log'
$regex = "\[([0-9a-zA-Z]{32})\]"
$errList = New-Object System.Collections.ArrayList
$errStr = 'Cannot export OLE'
forEach($line in $content){
    if($line.Contains($errStr) -and ($line -match $regex)){
       [void]$errList.Add($matches[1])
    }
}

$errList
$errStr + ': ' + $errList.Count 


