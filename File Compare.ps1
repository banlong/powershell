﻿CD C:\Users\nghie\Desktop\XLS
$BASE = GET-CONTENT BASE.TXT
$ONSITE = GET-CONTENT ONSITE.TXT
$OUTPUT = 'OUT.TXT'

compare-object $BASE $ONSITE | Out-File $OUTPUT