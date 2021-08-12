##\*\* is used to denote the recurse depth required.
##=================
#Get the list of folders/files
$table = Get-ChildItem -Path N:\*\*\*

# Prepare to store the results in
$results = @()

#Loop to get ACLs from each entry
foreach ($item in $table)
{
	#Get the path nice and lovely, starts with C:
	$Access = (Get-Acl $item.FullName).Access
	
	#Get the ACLs
	$results += $Access | Add-Member -Name Path -Value $item.FullName -MemberType NoteProperty -PassThru
}

#Export the results to CSV
$results | Export-Csv D:\results.csv

#Open the results, because clicking is not fun
notepad D:\results.csv
