<# SetDescription.ps1
.SYNOPSIS
	Set computer description to matching user information from CSV export 
.DESCRIPTION
	This script moves set the inforatmion in AD to match the table in our CSV export
	Make sure to edit and change the PARAM section to match your environment
.EXAMPLE
	.\SetDescription.ps1
	
	
.NOTES
	Script:				SetDescription.ps1
	Author:				Berry George
	
	Changelog
		1.0				Initial Version
.LINK
	Source:			https://github.com/vincentl2189/PSADORG	
	#>
#Set computer description to matching user information from CSV export
Import-Module ActiveDirectory

#CSV Import
Import-Csv -Path \\Path | % {  

#Variables
$Computer = $_.Computer  
$Username = $_.Username
$Chassis = $_.Chassis

#Get the department of the user
$Dept = Get-ADUser $Username -Properties Department | foreach { $_.Department }

#Get Computer Location of the user
$City = Get-ADUser $Username -Properties City | foreach { $_.City }

#Set the information
Set-ADComputer $Computer -Description "$Dept $Chassis"
Set-ADComputer $Computer -Location $City  
}
