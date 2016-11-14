#Move computers based on matching Description and location to specific OU
Import-Module ActiveDirectory

#Variables
#All the OU's that computers can be moved to
    $OU1 = "OU=Example,DC=Domain,DC=com"
    $OU2 = "OU=Example,DC=Domain,DC=com"

    
#Functions
#Computers are moved based on Matching Description and Location
 Get-ADComputer -Filter {(Description -like "Department Chassis") -and (Location -like "New York")} -ResultSetSize $null| Move-ADObject -TargetPath $OU1
 Get-ADComputer -Filter {(Description -like "Department Chassis") -and (Location -like "Tokyo")} -ResultSetSize $null| Move-ADObject -TargetPath $OU2
