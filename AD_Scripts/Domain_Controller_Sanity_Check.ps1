cd d:\
gpresult /v | Out-File .\"$env:computername GP_Results.txt" -Append
repadmin /showrepl <hostname>| Out-File .\"$env:computername AD_Replication.txt" -Append
dcdiag /v | Out-File .\"$env:computername DCDiag.txt" -Append
Write-Output "Checking RDP sessions on server: $env:computername" `n | Out-File .\"$env:computername RDP.txt" -Append
qwinsta | Out-File .\"$env:computername RDP.txt" -Append
Write-Output "Checking DHCP on server: $env:computername" `n | Out-File .\"$env:computername DHCP.txt" -Append
Get-DhcpServerInDC |Select IPAddress,DnsName | Where DnsName -like $env:computername | Out-File .\"$env:computername DHCP.txt" -Append
Get-DhcpServerv4ScopeStatistics -ComputerName $env:computername | Select-Object ScopeID, Free, InUse, Pending, PercentageInUse | Out-File .\"$env:computername DHCP.txt" -Append
