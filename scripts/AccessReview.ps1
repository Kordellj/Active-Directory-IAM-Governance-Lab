<#
.SYNOPSIS
Exports an Active Directory access review inventory from the Corp OU.

.DESCRIPTION
Reconstructed from the lab screenshots and brief. Uses the Active Directory
PowerShell module and a session with read access to the target OU. The output
directory must exist and be writable. The CSV contains account status and direct
MemberOf group names. Primary group, nested entitlements, and effective resource
permissions require separate checks. The lab used simple group CNs.

.EXAMPLE
.\AccessReview.ps1 -SearchBase 'OU=Corp,DC=iam,DC=example,DC=test' -OutputPath 'C:\CorpResources\AccessReview.csv'
#>
[CmdletBinding()]
param(
    [string]$SearchBase = 'OU=Corp,DC=iam,DC=example,DC=test',
    [string]$OutputPath = 'C:\CorpResources\AccessReview.csv'
)

Import-Module ActiveDirectory -ErrorAction Stop

Get-ADUser -Filter * -SearchBase $SearchBase -SearchScope Subtree -Properties MemberOf -ErrorAction Stop |
    Select-Object Name, SamAccountName, Enabled, @{
        Name = 'Groups'
        Expression = {
            ($_.MemberOf | ForEach-Object { ($_ -split ',', 2)[0] -replace '^CN=', '' }) -join '; '
        }
    } |
    Export-Csv -LiteralPath $OutputPath -NoTypeInformation -Encoding UTF8 -ErrorAction Stop

Write-Output 'Access review report generated successfully.'
Write-Output "Report location: $OutputPath"
