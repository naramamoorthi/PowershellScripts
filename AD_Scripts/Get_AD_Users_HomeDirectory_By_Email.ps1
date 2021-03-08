$emails = Get-Content .\emaillist.txt
$results =@()

foreach ($email in $emails)
{
  $details=get-aduser -filter {EmailAddress -eq $email} -properties HomeDirectory|Select UserPrincipalName,HomeDirectory
  $results += $details
  
}

$results | Export-Csv .\results.csv
