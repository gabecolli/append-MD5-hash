$folderPath = "filepath"
$filter = "*.*"

$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $folderPath
$watcher.Filter = $filter
$watcher.IncludeSubdirectories = $false
$watcher.EnableRaisingEvents = $true

$onChange = Register-ObjectEvent $watcher "Created" -Action {
    $filePath = $Event.SourceEventArgs.FullPath
    $md5 = (Get-FileHash $filePath -Algorithm MD5).Hash
    $newFilePath = $filePath -replace "\.([^\.]+)$", "_$md5.`$1"
    Rename-Item $filePath -NewName $newFilePath
}

$onChange = Register-ObjectEvent $watcher "Changed" -Action {
    $filePath = $Event.SourceEventArgs.FullPath
    $md5 = (Get-FileHash $filePath -Algorithm MD5).Hash
    $newFilePath = $filePath -replace "\.([^\.]+)$", "_$md5.`$1"
    Rename-Item $filePath -NewName $newFilePath
}

$onChange = Register-ObjectEvent $watcher "Renamed" -Action {
    $filePath = $Event.SourceEventArgs.FullPath
    $md5 = (Get-FileHash $filePath -Algorithm MD5).Hash
    $newFilePath = $filePath -replace "\.([^\.]+)$", "_$md5.`$1"
    Rename-Item $filePath -NewName $newFilePath
}

while ($true) { Start-Sleep -Seconds 1 }
