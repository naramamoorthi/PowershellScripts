$dhcpserver=Read-Host

$scopes=@()
$scopeoptions=@()
$leases=@()
$exclusions=@()
$scopestatistics=@()

$scopes=(Get-DhcpServerv4Scope -Computername $dhcpserver)


foreach ($Item in $scopes) {
$scopeoptions+=Get-DhcpServerv4OptionValue -ScopeId $Item.ScopeId -ComputerName $dhcpserver|Select OptionId,Name,Type,Value|Add-Member -Name Scope -Value $Item.ScopeId -MemberType NoteProperty -PassThru

$leases+=Get-DhcpServerv4Lease -ScopeId $Item.ScopeId -ComputerName $dhcpserver|Add-Member -Name Scope -Value $Item.ScopeId -MemberType NoteProperty -PassThru

$exclusions+=Get-DhcpServerv4ExclusionRange -ScopeId $Item.ScopeId -ComputerName $dhcpserver|Add-Member -Name Scope -Value $Item.ScopeId -MemberType NoteProperty -PassThru

$scopestatistics+=Get-DhcpServerv4ScopeStatistics -ScopeId $Item.ScopeId -ComputerName $dhcpserver|Add-Member -Name Scope -Value $Item.ScopeId -MemberType NoteProperty -PassThru
}

Write-Host "DHCP Scopes in $dhcpserver :"
$scopes|Format-table
$scopes|Format-table|Out-File .\DHCP_Results.txt -Append

Write-Host "DHCP Scope Exclusions in $dhcpserver :"
$exclusions|Format-table|Out-File .\DHCP_Results.txt -Append

Write-Host "DHCP Scope Options in $dhcpserver :"
$scopeoptions|Format-table

Write-Host "DHCP Leases in $dhcpserver :" 
$leases|Format-table|Out-File .\DHCP_Results.txt -Append

Write-Host "DHCP Scope Statistics in $dhcpserver :"
$scopestatistics|Format-table|Out-File .\DHCP_Results.txt -Append
