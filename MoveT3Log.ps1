#MOVE & RENAME LOG FILE FOR T3
#Move Log Files when it completed
#$p="Start run job \[(.*?)\]";
$p="Process job \[(.*?)\] completed";

$fileName = "Request_for_Export_2006_2007"
$logType="_T3.log";

#T3 Source directory
$T3SrcPath="D:\Vuong\Excecute Tasks\Damai Tools\CitusSuite\20161222\T3-1\CitusSuite_Tool3_v5.2.3.29*\*citus_trace_logs.log";

#Destination directory
$DestPath="C:\Users\nghie\Desktop\List_RFE_2006-2007\T3\";
#sls $SrcPath -Pattern $p -List | %{ Copy-Item $_.Path (-join($DestPath, $_.Matches.Groups[1].Value, $fileName,$logType)) }

#move with more information
sls $T3SrcPath -Pattern $p -List | %{ $dest=-join($DestPath, $_.Matches.Groups[1].Value,'_', $fileName,$logType); Move-Item $_.Path $dest -Force; $dest }