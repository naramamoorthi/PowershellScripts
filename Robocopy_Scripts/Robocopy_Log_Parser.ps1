#I wrote this script to parse the heads and tails of Robocopy log files. The need arose one day when I had to perform Robocopy #on a large file server while generating separate logs. I needed a way to quickly review all the logs gathering the summary #along with start and end times. It's not much but it does the trick for me.

$directory="C:\Temp\Robocopy\Logs"
cd $directory
$files=Get-ChildItem .\
foreach ($item in $files)
{
Write-Host "Parsing Robocopy log file: $item"
$data=gc $item
$data | Select -First 20 | Out-File C:\Temp\Robocopy_Parsed_Log.txt -Append
$data | select -Last 10 | Format-Table | Out-File C:\Temp\Robocopy_Parsed_Log.txt -Append
$data | Select-String -SimpleMatch "Started" | Out-File C:\Temp\Robocopy_Parsed_Time_Log.txt -Append
$data | Select-String -SimpleMatch "Ended" | Out-File C:\Temp\Robocopy_Parsed_Time_Log.txt -Append
}

