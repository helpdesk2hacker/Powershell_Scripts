Import-Module ActiveDirectory

#Create an Array of Users from Disabled OU including their group memberships
$Users = Get-ADUser -filter * -SearchBase "DN of Disable User Group" -Properties MemberOf

#Loop through array of users
Foreach($User in $Users){
#check if users are disabled
    If($User.enabled -eq $false){ 
#Create array of groups that user is a members of
    $Groups = $User.MemberOf
#Loop through groups and remove user
    Foreach ($Group in $Groups){
    $User.MemberOf | Remove-ADGroupMember -Member $User -Confirm:$false -Verbose #removes confirmation requirement and outputs action

}
}
}
