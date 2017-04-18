#cd C:\Users\nghie\Desktop\IA0059\logs\Admin_Reference_Number\T4

cd C:\Users\nghie\Desktop\IA0059\logs\Admin_Reference_Number\T4
$files = dir *.log
$errStr = '[Error]'
$errType1 = 'extracting OLEs'
$errType2 = 'error initially for cursor'
$errType3 = 'extracting attachments'
$errType4 = 'Invalid parameter passed to function'
$errType5 = 'null content'
$errType6 = 'The file you are attempting to save or retrieve has been blocked from this Web site by the server administrators'
$errType7 = 'Lookup item(s) not found'
$errType8 = 'larger than 50MB'
$errType9 = 'The specified name is already in use'
$errType10 = 'Unable to connect to the remote server'
$errType11 = 'The request failed with the error message'
$errType12 = 'The underlying connection was closed'
$errType13 = 'Cannot migrate User'



$unidRegex = [regex]"([0-9a-zA-Z]{32})"
$filenameRegex = [regex]"([0-9a-zA-Z]{*})"
$dateRegex = [regex]'(?x)
    # 1. Date and time
    # d/m/Y h:n:s a
    (?:(?:[12][0-9]|0?[1-9])[/.-]0?2|(?:30|[12][0-9]|0?[1-9])[/.-](?:0?[469]|11)|(?:3[01]|[12][0-9]|0?[1-9])[/.-](?:0?[13578]|1[02]))[/.-][0-9]{4}[\t ]+(?:1[0-2]|0?[1-9])[:.][0-5]?[0-9][:.][0-5]?[0-9][\t ]+(?:AM|PM)'


$userRegex = [regex]"([i:0#.*])"
$fieldRegex = [regex]"([0-9a-zA-Z.*])"

$errList1 = New-Object System.Collections.ArrayList
$errList2 = New-Object System.Collections.ArrayList
$errList3 = New-Object System.Collections.ArrayList
$errList4 = New-Object System.Collections.ArrayList
$errList5 = New-Object System.Collections.ArrayList
$errList6 = New-Object System.Collections.ArrayList
$errList7 = New-Object System.Collections.ArrayList
$errList8 = New-Object System.Collections.ArrayList
$errList9 = New-Object System.Collections.ArrayList
$errList10 = New-Object System.Collections.ArrayList
$errList11 = New-Object System.Collections.ArrayList
$errList12 = New-Object System.Collections.ArrayList
$errList13 = New-Object System.Collections.ArrayList
$errUniqueList = New-Object System.Collections.ArrayList

$delimiter = "\[Error\]"
$splitOpt =  [System.StringSplitOptions]::RemoveEmptyEntries

'Scanning log files...please wait.'

foreach ($file in $files){
    '....reading file ' + $file
    $content = Get-Content $file.Name
    forEach($line in $content){
        if($line.Contains($errStr) -and $line.Contains($errType1)){
            $detailPos = $line.IndexOf("Error detail:") + 14
            #create obj (hash table), add to list
            $info = @{
                      "unid" = $unidRegex.Match($line).Value;
                      "date" = $dateRegex.Match($line).Value
                      
                      #using substring to cut other
                      "detail" = $line.Substring($detailPos,40)
                    }
                    [void]$errList1.Add($info)
            
        } elseif($line.Contains($errType2)){
            $detailPos = $line.IndexOf("[Error]:") + 9
            $lineLen = $line.Length - $detailPos
            #create obj (hash table), add to list
            $info = @{
                      "unid" = $unidRegex.Match($line).Value;
                      "date" = $dateRegex.Match($line).Value
                      
                      #using substring to cut other
                      "detail" = $line.Substring($detailPos,$lineLen)
                    }
                    [void]$errList2.Add($info)
            
        
        } elseif($line.Contains($errType3)){
            $detailPos = $line.IndexOf("Error detail:") + 14
            $lineLen = $line.Length - $detailPos
            #create obj (hash table), add to list
            $info = @{
                      "unid" = $unidRegex.Match($line).Value;
                      "date" = $dateRegex.Match($line).Value
                      
                      #using substring to cut other
                      "detail" = $line.Substring($detailPos,$lineLen)
                    }
                    [void]$errList3.Add($info)
            
        
        } elseif($line.Contains($errType4)){
            $detailPos = $line.IndexOf("[Error]:") + 9
            $detailLen = $line.IndexOf("Trace:") - $detailPos
            #create obj (hash table), add to list
            $info = @{
                      "unid" = $unidRegex.Match($line).Value;
                      "date" = $dateRegex.Match($line).Value
                      
                      #using substring to cut other
                      "detail" = $line.Substring($detailPos,$detailLen)
                    }
                    [void]$errList4.Add($info)
            
        
        }elseif($line.Contains($errType5)){
            #create obj (hash table), add to list
            $info = @{
                      "unid" = $unidRegex.Match($line).Value;
                      "date" = $dateRegex.Match($line).Value;
                      'detail' = $line
                    }
                    [void]$errList5.Add($info)
            
        
        }elseif($line.Contains($errType6)){
            #create obj (hash table), add to list
            $info = @{
                      "unid" = $unidRegex.Match($line).Value;
                      "date" = $dateRegex.Match($line).Value;
                      'detail' = $line
                    }
                    [void]$errList6.Add($info)
            
        
        }elseif($line.Contains($errType7)){
            #create obj (hash table), add to list
            $info = @{
                      "unid" = $unidRegex.Match($line).Value;
                      "date" = $dateRegex.Match($line).Value;
                      'detail' = $line
                    }
                    [void]$errList7.Add($info)
        
        }elseif($line.Contains($errType8)){
            #create obj (hash table), add to list
            $info = @{
                      "unid" = $unidRegex.Match($line).Value;
                      "date" = $dateRegex.Match($line).Value;
                      'detail' = $line
                    }
                    [void]$errList8.Add($info)
        
        } elseif($line.Contains($errType9)){
            #create obj (hash table), add to list
            $info = @{
                      "unid" = $unidRegex.Match($line).Value;
                      "date" = $dateRegex.Match($line).Value;
                      'detail' = $line
                    }
                    [void]$errList9.Add($info)
        
        }  elseif($line.Contains($errType10) -or $line.Contains($errType12)){
            #create obj (hash table), add to list
            $info = @{
                      "unid" = $unidRegex.Match($line).Value;
                      "date" = $dateRegex.Match($line).Value;
                      'detail' = $line
                    }
                    [void]$errList10.Add($info)
        
        }  elseif($line.Contains($errType11)){
            #create obj (hash table), add to list
            $info = @{
                      "unid" = $unidRegex.Match($line).Value;
                      "date" = $dateRegex.Match($line).Value;
                      'detail' = $line
                    }
                    [void]$errList11.Add($info)
        
        'Cannot migrate User [i:0#.w|DDNET1\CAP324] from field [CopyTo] of record [6777EBDC552DAFDB8525758C0046B832], User is not exits in Sharepoint Permissions.'
        }  elseif($line.Contains($errType13)){
            #create obj (hash table), add to list
            $line
            $info = @{
                      "unid" = $unidRegex.Match($line).Value;
                      "date" = $dateRegex.Match($line).Value;
                      "field" = $fieldRegex.Match($line).Value;
                      "user" = $userRegex.Match($line).Value;
                    }
                    [void]$errList13.Add($info)
        
        }
                      
                          
    }

}

'Scan completed'
'Error Type 1: ' + $errType1 
'Total Links Failed: '+  $errList1.Count 
$errList1 | ForEach-Object {$_.unid + ' - ' + $_.detail} > ole.txt

'Error Type 2: ' + $errType2
'Total Links Failed: '+  $errList2.Count 
$errList2 | ForEach-Object {$_.unid + ' - ' + $_.detail} > cursor.txt

'Error Type 3: ' + $errType3
'Total Links Failed: '+  $errList3.Count 
$errList3 | ForEach-Object {$_.unid + ' - ' + $_.detail} > attachments.txt

'Error Type 4: ' + $errType4 
'Total Links Failed: '+  $errList4.Count 
$errList4 | ForEach-Object {$_.unid + ' - ' + $_.detail} > parameter.txt

'Error Type 5: ' + $errType5 
'Total Failed: '+  $errList5.Count 
$errList5 | ForEach-Object {$_.unid + ' - ' + $_.detail} > NullContentFiles.txt


'Error Type 6: ' + $errType6 
'Total Failed: '+  $errList6.Count 
$errList6 | ForEach-Object {$_.unid + ' - ' + $_.detail} > BlockedFiles.txt


'Error Type 7: ' + $errType7 
'Total Failed: '+  $errList7.Count 
$errList7 | ForEach-Object {$_.unid + ' - ' + $_.detail} > CannotMigrateLookup.txt

'Error Type 8: ' + $errType8 
'Total Failed: '+  $errList8.Count 
$errList8 | ForEach-Object {$_.unid + ' - ' + $_.detail} > ExceedFileLimit.txt

'Error Type 9: ' + $errType9 
'Total Failed: '+  $errList9.Count 
$errList9 | ForEach-Object {$_.unid + ' - ' + $_.detail} > FileInUse.txt


'Error Type 10: ' + $errType10 
'Total Failed: '+  $errList10.Count 
$errList9 | ForEach-Object {$_.unid + ' - ' + $_.detail} > UnableConnect.txt

'Error Type 11: Object moved'
'Total Failed: '+  $errList11.Count 
$errList11 | ForEach-Object {$_.unid + ' - ' + $_.detail} > ObjMoved.txt

'Error Type 12: User not found'
'Total Failed: '+  $errList13.Count 
$errList13 | ForEach-Object {$_.unid + ' - ' + $_.user} > User.txt

#$errList | Foreach-Object { $_.Substring(0,2) } |Select-Object -unique > output.txt
#$errUniqueList = $errList | select -uniq
#$errUniqueList > output.txt

#Error 1
#'[2/7/2017 12:09:12 PM]-[Error]: Error occurred in document 966F661256DD40E9C1256C4E0034A0A3 when extracting OLEs. Error detail: Input string was not in a correct format. .   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
#   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
#   at System.Convert.ToInt32(String value)
#   at Fsoft.Citus.Data.OleDecoder..ctor()
#   at Fsoft.Citus.Data.OleDecoder.get_Decoder()
#   at Fsoft.Citus.Data.NotesDocument.ExportOLE(AttachmentFile& attachmentFile, String folderPath)
#   at Fsoft.Citus.Extractor.ExtractorController.ProcessDocument(String notesFormName, NotesDocument notesDocument, BackgroundWorker worker, List`1 doclinks, List`1 dblinks, List`1 viewlinks)'

#Error 2
#'[2/7/2017 12:12:46 PM]-[Error]: Cannot migrate data from field [WrDescReq] in document [94D3DC72866F20F9C1256A9D00440A9B] because error initially for cursor'

#Error 3 
#'[2/7/2017 12:24:22 PM]-[Error]: Error occurred in document FFC4A4FEB602A089C1256A8B00589674 when extracting attachments. Error detail: Cannot export attachment [extrusion conditions.xls] in Field [WrDescFinRep] of Document UNID [FFC4A4FEB602A089C1256A8B00589674] to [C:\Users\nghie\Desktop\IA0022\tmp\(WRQ) 01. Work Request Header\FFC4A4FEB602A089C1256A8B00589674].
# Because :[Encoded Data Checksum Mismatch - Attachment may be corrupted] .   at Fsoft.Citus.Data.NotesDocument.ExportAttachment(AttachmentFile& attachmentFile, String folderPath)
#   at Fsoft.Citus.Extractor.ExtractorController.ProcessDocument(String notesFormName, NotesDocument notesDocument, BackgroundWorker worker, List`1 doclinks, List`1 dblinks, List`1 viewlinks)'

#Error 4
#'[2/7/2017 12:46:44 PM]-[Error]: Document UNID [3D956C31C98EF9C1C125749E0023E51E] Field [WrBackGroundOrg]   Trace: Method: GetFields -> FillData -> ParseFieldValueChanged -> GetsValue -> ProcessRichtext -> ProcessRTContent -> ProcessAnchorLinkLocation -> LogError -> LogError ->  Reason:Invalid parameter passed to function'