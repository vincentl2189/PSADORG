#Chassis Type Conversion
#Simple hash table to convert chassis type in our CSV to a more readable format.

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
