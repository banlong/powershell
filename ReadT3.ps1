cd C:\Users\nghie\Desktop\IA0059\logs\Memo\T3
$unids = New-Object System.Collections.ArrayList

'Scanning log files...please wait.'
#'Cannot migrate User [i:0#.w|DDNET1\CAP324] from field [CopyTo] of record [6777EBDC552DAFDB8525758C0046B832], User is not exits in Sharepoint Permissions.'

#Save unique User ID list
sls .\Citus_Trace_Logs.log -Pattern "Cannot migrate User \[(.*?)\] from field \[(.*?)\] of record \[([0-9a-zA-Z]{32})\]"|
% { $_.Matches.Groups[1].Value} | 
Select -Unique > uniqueIDs.txt

#Save unique user ID for SQL statement
sls .\Citus_Trace_Logs.log -Pattern "Cannot migrate User \[(.*?)\] from field \[(.*?)\] of record \[([0-9a-zA-Z]{32})\]"|
% { "'" + $_.Matches.Groups[1].Value + "',"} | 
Select -Unique > uniqueIDsForSQL.txt


#Save all UNIDs
sls .\Citus_Trace_Logs.log -Pattern "Cannot migrate User \[(.*?)\] from field \[(.*?)\] of record \[([0-9a-zA-Z]{32})\]"|
% { [void]$unids.Add($_.Matches.Groups[3].Value)}

#Save all UNIDs
sls .\Citus_Trace_Logs.log -Pattern "Cannot migrate User \[(.*?)\] from field \[(.*?)\] of record \[([0-9a-zA-Z]{32})\]"|
% { $_.Matches.Groups[3].Value} |Select -Unique > UNIDs.txt


#Field has wrong User ID
sls .\Citus_Trace_Logs.log -Pattern "Cannot migrate User \[(.*?)\] from field \[(.*?)\] of record \[([0-9a-zA-Z]{32})\]"|
% { $_.Matches.Groups[2].Value} | Select -Unique


'Total Errors:' + $unids.Count
'Completed!!!'

#sls .\Citus_Trace_Logs.log -Pattern "Cannot migrate User \[(.*?)\] from field \[(.*?)\] of record \[([0-9a-zA-Z]{32})\]"
