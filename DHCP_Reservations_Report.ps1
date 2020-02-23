Get-DHCPServerv4Reservation -ScopeId 10.0.0.0 | Select ScopeID,Name,ClientID,Type,Description | Export-Csv C:\Temp\DHCP_Reservations.csv
