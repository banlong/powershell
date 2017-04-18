cd C:\Users\nghie\Desktop\P\GEN
$files = gci *.txt
$createdListNames = New-Object System.Collections.ArrayList
$filenameRegex = [regex]"Create List: \[(.*?)\]"
$dateRegex = [regex]'(?x)
    # 1. Date and time
    # d/m/Y h:n:s a
    (?:(?:[12][0-9]|0?[1-9])[/.-]0?2|(?:30|[12][0-9]|0?[1-9])[/.-](?:0?[469]|11)|(?:3[01]|[12][0-9]|0?[1-9])[/.-](?:0?[13578]|1[02]))[/.-][0-9]{4}[\t ]+(?:1[0-2]|0?[1-9])[:.][0-5]?[0-9][:.][0-5]?[0-9][\t ]+(?:AM|PM)'

'Scanning log files...please wait.'
sls .\*.txt -Pattern "Create List: \[(.*?)\]" |% { [void]$createdListNames.Add($_.Matches.Groups[1].Value) }  

$createdListNames > lists.txt