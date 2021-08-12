$serverlist = Get-Content serverlist.txt
$source = 'C:\Temp\Patching'

Foreach ($server in $serverlist) 

{ 

$destination="\\$server\C$\Temp\Patching"

Write-Host "Starting file copy to $server" 
Robocopy.exe $source $destination /MIR /R:2 /W:0
$file=Test-Path "$destination\windows8.1-kb4088876-x64.msu"
If($file) {
Write-Host "File copy to $server COMPLETED"
Write-Output "File copy to $server COMPLETED" >> PatchCopyLog.txt
} 
Else 
{
Write-host "File copy to $server FAILED"
Write-Output "File copy to $server FAILED" >> PatchCopyLog.txt
}

}
