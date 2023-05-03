### Description: Get the Current Status of a User including username, enabled, locked out, OU, and group memberships ####


#take users name on execution
$User = $args[0]
### Call with:  .\CheckUserStatus.ps1 "Lastname, Firstname"
    ## requires quotation if space
    ## can use wildcards like "Lastname, F*"


#If no argument passed on call, input username, does not require quotations
if ( $User -eq $null )
{
   $User = Read-Host "Enter Lastname, Firstname"
}

Get-ADUser -Filter 'Name -like $User' -Properties * | Select-Object Name,SamAccountName,Enabled,LockedOut,DistinguishedName,Description,MemberOf
