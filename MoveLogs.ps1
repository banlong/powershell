#SCRIPT FOR LIST "REQUEST FOR EXPORT"
#Move Log Files when it completed
$p="Process job \[(G.*?-02`. List_Request for Export)\] completed";

#Source directory
$SrcPath="D:\Vuong\Excecute Tasks\Damai Tools\CitusSuite\20161222\CitusSuite_Tool3_v5.2.3.29*\*citus_trace_logs.log";

#Destination directory
$DestPath="C:\Users\nghie\Desktop\List_RFE_2008_2017\";

#Append this to the end of file name
$LogType="_T3.log";
sls $SrcPath -Pattern $p -List | %{ Move-Item $_.Path (-join($DestPath, $_.Matches.Groups[1].Value, $LogType)) }

#move with more information
#sls $SrcPath -Pattern $p -List | %{ $dest=-join($DestPath, $_.Matches.Groups[1].Value, $LogType); Move-Item $_.Path $dest; $dest }