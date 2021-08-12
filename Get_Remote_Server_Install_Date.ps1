hosts=@(server1,server2,server3)
foreach ($server in $hosts)
Write-Output "Server,InstallDate" >> .\output.txt
{
Write-Host "Checking $server"
$Date=([WMI]'').ConvertToDateTime((Get-WmiObject Win32_OperatingSystem).InstallDate)
Write-Output "$server,$Date" >> .\output.txt

}

cat .\output.txt
