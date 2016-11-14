#Set computer description to matching user information from CSV export
Import-Module ActiveDirectory

#CSV Import
Import-Csv -Path \\ctscdc01\org\infoconversion.csv | % {  

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
