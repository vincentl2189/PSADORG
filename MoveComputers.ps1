<# MoveComputers.ps1
.SYNOPSIS
	Moves computers in Active Directory
.DESCRIPTION
	This script moves computers the their respective OU based on matching criteria
	Make sure to edit and change the PARAM section to match your environment
.PARAMETER OU
	Set the OU you want to move matching computers into
.PARAMETER DESCRIPTION
	Set the desciption you used in previous scripts
.PARAMETER LOCATION
	Set the location if desired, additional matching is not required

.OUTPUTS
	CSV:	Exports the converted table into a CSV
.EXAMPLE
	.\MoveComputers.ps1
	
	
.NOTES
	Script:				MoveComputers.ps1
	Author:				Berry George
	
	Changelog
		1.0				Initial Version
.LINK
	Source:			https://github.com/vincentl2189/PSADORG	
	#>
    
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
