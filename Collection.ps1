<# Collection.ps1
.SYNOPSIS
	Script to query the for user information on login
.DESCRIPTION
	This script collects various user information and device information for the computer and exports it to a CSV in the form of a table
	Commands must all be able to run under the user context with minial access
	
	Make sure to edit and change the PARAM section to match your environment
.PARAMETER CSV
	Tell the script where the CSV is to be exported
.OUTPUTS
	CSV:	Exports the converted table into a CSV
.EXAMPLE
	.\Collection.ps1
	
	
.NOTES
	Script:				ChassisConversion.ps1
	Author:				Berry George
	
	Changelog
		1.1				Change to select only the first chassis type. Commit ID 95974a8
		1.0				Initial Version
.LINK
	Source:			https://github.com/vincentl2189/PSADORG	
	#>

#Variables
$Username =  $env:USERNAME
$Computername = $env:COMPUTERNAME
$Chassis = Get-WmiObject win32_systemenclosure -computer $Computername| Select -First 1 | foreach { $_.Chassistypes }


#Table constructions keeps the values in a clean readable state.
#Table Structure
$tabName = "Membership"
$table = New-Object system.Data.DataTable "$tabName"
$col1 = New-Object system.Data.DataColumn Computer,([string])
$col2 = New-Object system.Data.DataColumn Username,([string])
$col3 = New-Object system.Data.DataColumn Chassis,([string])
$table.columns.add($col1)
$table.columns.add($col2)
$table.columns.add($col3)
$row = $table.NewRow()
$row.Computer = "$Computername" 
$row.Username = "$Username"
$row.Chassis = "$Chassis"
$table.Rows.Add($row)


#Table Build and export
$tabCsv = $table | export-csv \\Path -Append -noType
