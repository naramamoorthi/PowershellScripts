#This script creates new dhcp scopes that have been defined in a csv file then adds the scopes to the specified failover relationship.
#Scope_Data.csv structure: 
#PrimaryDHCPServer: The primary DHCP server for the scope
#Name: Scope Name that will appear in DHCP
#Description: Scope description
#StartIP: Starting IP for the scope (e.g. 10.10.10.10)
#EndIP: Ending IP for the scope (e.g. 10.10.10.254)
#LeaseDuration: Duration of the lease in 'day.Hours:Minute:Seconds' format (e.g. For 8 days 8.00:00:00)
#SubnetMask: SubnetMask to for the scope
#Type: Specifies if the scope servers DHCP only, BootP only or Both
#FailoverRelationshipName: The name of the Failover Relationship to which the scope will be added. If a relationship does not exist, you can use Add-FailoverRelationship to create one.
#ScopeId: ScopeId for the scope
#State: The state the scope will be in after creation. Active or Inactive. In this script it is specified as inactive so the values can be validated before the scope is activated.


$scopedata=Import-Csv .\Scope_Data.csv
$scopedata
foreach ($scope in $scopedata)
{
Add-DHCPServerv4Scope -ComputerName $scope.PrimaryDHCPServer -Name $scope.ScopeName -Description $scope.Description -StartRange $scope.StartIP $EndRange $scope.EndIP -LeaseDuration $scope.LeaseDuration -State Inactive -SubnetMask $scope.SubnetMask -Type Both
Add-DHCPServerv4FailoverScope -ComputerName $scope.PrimaryDHCPServer -Name $scope.FailoverRelationshipName -ScopeId $scope.ScopeId
}
