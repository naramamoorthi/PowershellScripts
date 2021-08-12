$emails = Get-Content .\emaillist.txt  
$TargetOU =  "OU=Users,OU=Marketing,OU=Singapore,DC=ACME,DC=com" 
 
ForEach ($email in $emails) 
{ 
     $UserDN  = (get-aduser -Filter {EmailAddress -eq $email}).distinguishedname
     Write-Host " Moving Accounts ..... " 
     # Move user to target OU. 
     Move-ADObject  -Identity $UserDN  -TargetPath $TargetOU
#$details = get-aduser -Filter {EmailAddress -eq $email}|Select UserPrincipalName,DistinguishedName
	#$results += $details
 } 
 Write-Host " Completed move " 
#$results|Export-Csv .\results.csv 
 #$total = ($MoveList).count 
 #Write-Host "  $total accounts have been moved succesfully..."
