﻿#MOVE & RENAME LOG FILE FOR T4
#Move Log Files when it completed
$p="Finished Post-Process job \[(.*?)\]";

#T3 Source directory
$T4SrcPath="D:\Vuong\Excecute Tasks\Damai Tools\CitusSuite\20161222\T4-1\CitusSuite_Tool4_v5.1.5.22*\*Citus_suite_trace_logs.log";


#Destination directory
$DestPath="C:\Users\nghie\Desktop\List_RFE_2006-2007\T4\"
$fileName = "Request_for_Export(2006-2007)"
$logType="_T4.log";

#move with more information
sls $T4SrcPath -Pattern $p -List | %{ $dest=-join($DestPath, $_.Matches.Groups[1].Value,'_', $fileName, $logType); Move-Item $_.Path -Force $dest; $dest }
