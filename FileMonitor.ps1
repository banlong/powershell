#MOVE & RENAME LOG FILE FOR T3
#Move Log Files when it completed
#$p="Start run job \[(.*?)\]";
$p="Process job \[(.*?)\] completed";
$m ="Finished Post-Process job \[(.*?)\]"; 



#T3 Source directory
$T3_srcPath_1="D:\Vuong\Excecute Tasks\Damai Tools\CitusSuite\20161222\T3-1\CitusSuite_Tool3_v5.2.3.29*\*citus_trace_logs.log";
$T3_destPath_1="C:\Users\nghie\Desktop\List_RFE_2006-2007\T3\";
$T3_fileName_1 = "Request_for_Export_2006_2007"
$T3ext="_T3.log";


#T4 Info
$T4_srcPath_1="D:\Vuong\Excecute Tasks\Damai Tools\CitusSuite\20161222\T4-1\CitusSuite_Tool4_v5.1.5.22*\*Citus_suite_trace_logs.log";
$T4_destPath_1="C:\Users\nghie\Desktop\List_RFE_2006-2007\T4\";
$T4_fileName_1 = "Request_for_Export(2006-2007)"
$T4ext="_T4.log";

#T4 Info
$T4_srcPath_2="D:\Vuong\Excecute Tasks\Damai Tools\CitusSuite\20161222\T4-2\CitusSuite_Tool4_v5.1.5.22*\*Citus_suite_trace_logs.log";
$T4_destPath_2="C:\Users\nghie\Desktop\Memo\T4\";
$T4_fileName_2 = "Memo"


#Monitor Info
$watchFolder = 'D:\Vuong\Excecute Tasks\Damai Tools\CitusSuite\20161222\' # Enter the root path you want to monitor. 
$watchFilter = '*trace_logs.log'  # You can enter a wildcard filter here. 
 
# In the following line, you can change 'IncludeSubdirectories to $true if required.                           
$fsw = New-Object IO.FileSystemWatcher $watchFolder, $watchFilter -Property @{
    IncludeSubdirectories = $true;
    NotifyFilter = [IO.NotifyFilters]'FileName, LastWrite'
} 
'Monitor is in progress'
 
function Stop-Monitor(){
    # To stop the monitoring, run the following commands: 
    Unregister-Event FileDeleted -Force
    Unregister-Event FileCreated -Force
    Unregister-Event FileChanged -Force
    'Event unregistered!!'
}

# Here, all three events are registerd.  You need only subscribe to events that you need: 
 
Register-ObjectEvent $fsw Created -SourceIdentifier FileCreated -Action { 
    $name = $Event.SourceEventArgs.Name 
    $changeType = $Event.SourceEventArgs.ChangeType 
    $timeStamp = $Event.TimeGenerated 
    #Write-Host "The file '$name' was $changeType at $timeStamp" -fore white 
}
 
Register-ObjectEvent $fsw Deleted -SourceIdentifier FileDeleted -Action { 
    $name = $Event.SourceEventArgs.Name 
    $changeType = $Event.SourceEventArgs.ChangeType 
    $timeStamp = $Event.TimeGenerated 
    #Write-Host "The file '$name' was $changeType at $timeStamp" -fore red 
}
 
Register-ObjectEvent $fsw Changed -SourceIdentifier FileChanged -Action { 
    $name = $Event.SourceEventArgs.Name 
    $changeType = $Event.SourceEventArgs.ChangeType 
    $timeStamp = $Event.TimeGenerated 
    #Write-Host "The file '$name' was $changeType at $timeStamp" -fore green
    [console]::beep(500,300)

    #T3-RFE
    sls $T3_srcPath_1 -Pattern $p -List | %{ 
        $dest=-join($T3_destPath_1, $_.Matches.Groups[1].Value,'_', $T3_fileName_1,$T3ext); 
        Move-Item $_.Path $dest -Force; 
        Write-host $dest -fore green
    }

    
    #T4-RFE
    sls $T4_srcPath_1 -Pattern $m -List | %{ 
        $dest=-join($T4_destPath_1, $_.Matches.Groups[1].Value,'_', $T4_fileName_1 , $T4ext); 
        Move-Item $_.Path -Force $dest; 
        Write-host $dest -fore yellow
    }

    
    #T4-MEMO
    sls $T4_srcPath_2 -Pattern $m -List | %{ 
        $dest=-join($T4_destPath_2, $_.Matches.Groups[1].Value,$T4ext); 
        Move-Item $_.Path $dest; 
        Write-host $dest -fore blue
    }
}