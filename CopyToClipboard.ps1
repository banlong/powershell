#$c=0; get-Content .\u1.txt |% { $c=$c+1; $_ | set-clipboard; "$c"; Read-Host $_}

$c=0; get-Content .\u1.txt |% { $i="r"; $c=$c+1; while ($i -ne "") { $_ | set-clipboard; $i=Read-Host "$c - $_`n" } }