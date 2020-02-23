Get-DHCPServerv4Reservation -ScopeId 10.0.0.0 | Select ScopeID,Name,ClientID,Type,Description | Export-Csv C:\Temp\DHCP_Reservations.csv
##The code below queries a specific DHCP server
## Get-DHCPServerv4Serversatio -ScopeId 10.0.0.0 -ComputerName dhcp1.domain.com | fl >> C:\Temp\DHCP.txt
