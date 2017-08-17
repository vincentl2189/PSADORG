# PSADORG

This is a series of scripts that will organize Active Directory computers based on criteria pulled from the logged in user, leveraging login scripts, csv exports, tables, and Powershell scripts.

The scripts need to be scheduled to run in a specific order.

1. Collection.ps1 should be run on login throughout the day. Duplicate entries into the CSV is not an issue

2. ChassisConversion.ps1 should be run first to convert the chassis types and create the CSV that the other scripts work with

3. SetDescription.ps1 will set all the properties we have been collecting on the computer object

4. MoveComputers.ps1 will complete the proccess and move the computers to thier matching OU

