$path = "OU=Users,OU=Country,DC=AM,DC=Acme,DC=com"
$results = get-aduser =SearchBase $path -filter * -properties Name,UserPrincipalName,HomeDirectory
results | Export-Csv .\results.csv
