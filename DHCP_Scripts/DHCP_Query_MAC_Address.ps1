cd ~\Desktop
Write-Host "Executing Script"
$mac = (Get-Content .\macaddress.txt)

foreach ($address in $mac)
{
Write-Host "Gathering data for " $address
Get-DHCPServerv4Scope | Get-DHCPServerv4Lease -EA SilentlyContinue -ClientId $address | Out-File .\results.txt -Append
}
cat .\results.txt
pause
