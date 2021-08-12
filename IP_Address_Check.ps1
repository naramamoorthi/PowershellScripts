cd ~\Desktop
Write-Host "Executing Script"
$servers = (get-content .\serverlist.txt)
foreach ($computer in $servers)
{
Write-Output $computer >> .\IP_Check_Results.txt
Get-NetIPAddress -CimSession $computer | Where-Object {$_.InterfaceAlias -eq "PROD"} | Select IPAddress,InterfaceAlias | Out-File .\IP_Check_Results.txt -Append
}
cat .\IP_Check_Results.txt
Write-Host "Script Execution Complete"
