$groups = Get-Content C:\AD-Groups.txt

$results = foreach ($group in $groups)
{
Get-ADGroupMember $group | select name, @{n='GroupName';e={$group}}
}

$results

$results | Export-csv C:\GroupMembers.csv -NoTypeInformation
