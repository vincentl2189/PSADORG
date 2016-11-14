#Script to query the computer for logged in user, upon login. I will be using Group Policy to run the script on targeted users.
#You obviously don't want Administartors to take ownership of other users computers, and servers.

#Here is where we get the properties that are going to be included in the CSV. There are better ways to get this information but,
#keep in mind, these must all be run from the user context, and can not include evelated commands, AD access, or modules.


#Variables
$Username =  $env:USERNAME
$Computername = $env:COMPUTERNAME
$chassis = Get-WmiObject win32_systemenclosure -computer $Computername | foreach { $_.Chassistypes }


#Table constructions keeps the values in a clean readable state.
#Table Structure
$tabName = “Membership”
$table = New-Object system.Data.DataTable “$tabName”
$col1 = New-Object system.Data.DataColumn Computer,([string])
$col2 = New-Object system.Data.DataColumn Username,([string])
$col3 = New-Object system.Data.DataColumn Chassis,([string])
$table.columns.add($col1)
$table.columns.add($col2)
$table.columns.add($col3)
$row = $table.NewRow()
$row.Computer = “$Computername” 
$row.Username = “$Username”
$row.Chassis = “$chassis”
$table.Rows.Add($row)


#Table Build and export
$tabCsv = $table | export-csv \\Path -Append -noType
