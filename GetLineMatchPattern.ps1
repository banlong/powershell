$filename = 'IA0059_Log_T1_RFE_2006.log'
$result = Get-Content $filename | Select-String -Pattern "\[*Cannot export OLE*([0-9a-zA-Z]{32})\]" -A |% {$_.Matches.Groups[1]} 
$result