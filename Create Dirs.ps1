$rootDir = 'C:\Users\nghie\Desktop\List_RFE'
cd $rootDir

$totalItems = 31159
$batchSize = 500
$count = [math]::Ceiling($totalItems/$batchSize)  #Round Up

do{
    $path = $rootDir + '\G' + $count
    New-Item -ItemType directory -Path $path -Force
    $count = $count - 1
} until($count -eq 0)