$serverlist = Get-Content .\serverlist.txt

$results = @()

foreach ($server in $serverlist)
{
	$details=gwmi -Class Win32_bios -computername $server | Select Manufacturer,SerialNumber,Name,Version
	$results += $details | Add-Member -Name Server -Value $server -MemberType NoteProperty -PassThru
}
$results|Export-Csv .\results.csv


======================================================================================


$serverlist = Get-Content .\serverlist.txt

$results = @()

foreach ($server in $serverlist)
{
	$details=gwmi -Class Win32_ComputerSystem -computername $server | Select Manufacturer, Model
	$results += $details | Add-Member -Name Server -Value $server -MemberType NoteProperty -PassThru
}

$results|Export-Csv .\results.csv
