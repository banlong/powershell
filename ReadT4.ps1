cd C:\Users\nghie\Desktop\IA0059\logs\'Archived Lists'\T4
$unids = New-Object System.Collections.ArrayList

#'The specified user i:0#.w|DDNET1\OO3622 could not be found.'
$p1 = "The specified user (.*?) could not be found."

'Scanning log files...please wait.'
#Save unique User ID list
sls .\Citus_suite_trace_logs.log -Pattern $p1| % { $_.Matches.Groups[1].Value} | Select -Unique > uniqueIDs.txt

'Completed!!!'
