CD C:\Users\nghie\Desktop\XLS
$content = GET-CONTENT OUT.TXT
$content -replace '<=', '' > 'OUT2.TXT'
