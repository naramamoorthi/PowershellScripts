Get-DHCPServerv4Lease -ComputerName <DHCP_Server_Hostname_or_IP> -ScopeId <ScopeId> | Where-Object {$_.ClientId -like "mac_vendor_prefix-**-**-**"}

Example: Get-DHCPServerv4Lease -ComputerName <DHCP_Server_Hostname_or_IP> -ScopeId <ScopeId> | Where-Object {$_.ClientId -like "b8-27-eb-**-**-**"}
