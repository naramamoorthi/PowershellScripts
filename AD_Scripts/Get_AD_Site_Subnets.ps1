Get-AdReplicationSubnet -Server <Domain Controller Name> -Filter {Site -eq "CN=<Sitename>,CN=Sites,CN=Configuration,DC=acme,DC=com"|Select Name,Site|Export-Csv .\Sites.csv
