cd C:\Users\nghie\Desktop\IA0059\logs\Memo\T3
$file = 'uniqueIDs.txt'
$output = 'names.txt'
$content = Get-Content $file
$users = New-Object System.Collections.ArrayList
$result =''
$group =''
'Lines = ' + $content.Count
$count = 1
forEach($line in $content){
    $count = $count + 1
    $parts = $line.Split('\/')
    $group = $group + $parts[1].ToUpper() + ';'
    
    if($group.Length -gt 240 -or $count -gt $content.Count){
        $group 
        $result = $result + $group + "`n`n"
        $group = ''
    }
    [void]$users.Add($parts[1].ToUpper())
    
}
$result > $output