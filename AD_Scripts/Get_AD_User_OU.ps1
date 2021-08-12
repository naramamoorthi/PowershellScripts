#get-aduser -Filter {EmailAddress -eq $email}|Select UserPrincipalName, DistinguishedName| Format-Table -Autosize


$emails = Get-Content .\emaillist.txt

$results = @()

foreach ($email in $emails)
{
	$details=get-aduser -Filter {EmailAddress -eq $email}|Select UserPrincipalName, DistinguishedName
	$results += $details
}

$results|Export-Csv .\results.csv
