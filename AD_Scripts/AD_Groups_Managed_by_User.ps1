Get-ADGroup -LDAPFilter "(ManagedBy=$((Get-ADuser -Identity name.lastname).distinguishedname))" | Select Name,GroupCatergory,GroupScope.ObjectClass | Export-Csv C:\Temp\ADQuery.txt -Append

#The code below gets the AD User distingusihed name only
#Get-ADUser name.lastname | Select DistinguishedName
