<# ChassisConversion.ps1

.SYNOPSIS
	Hash table to convert chassis type
.DESCRIPTION
	This script is a simple hash table to convert chassis type in our CSV to a more readable format.
	
	Make sure to edit and change the PARAM section to match your environment
.PARAMETER CSV
	Tell the script where the CSV file is
.OUTPUTS
	CSV:	Exports the converted hash table into a CSV
.EXAMPLE
	.\ChassisConversion.ps1
	
	
.NOTES
	Script:				ChassisConversion.ps1
	Author:				Berry George
	
	Changelog
		1.0				Initial Version
.LINK
	Source:			https://github.com/vincentl2189/PSADORG	
	#>

#Hash table
$ChassisCoversion = @{
    "3" = "Desktop"
    "4" = "Desktop"
    "5" = "Desktop"
    "6" = "Desktop"
    "7" = "Desktop"
    "8" = "Laptop"
    "9" = "Laptop"
    "10" = "Laptop"
    "11" = "Laptop"
}

#Import CSV and convert values
$csv = Import-Csv -Path "\\Path"
foreach($row in $csv) 
{
    $row.Chassis = $ChassisCoversion[$row.Chassis]
}

#Export CSV with new values, to new location
$csv | Export-Csv -Path "\\PathConverted" -NoTypeInformation
