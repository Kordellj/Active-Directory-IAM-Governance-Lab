# Security Investigation Report

## Executive summary

A simulated group assignment gave James Carter, a Sales employee, read and write permissions on the Finance folder. The root cause was an inappropriate role-group assignment in a functioning AGDLP design. I removed the assignment and verified that James’s legitimate Sales membership remained.

## Investigation and impact

1. Used ADUC and `Get-ADPrincipalGroupMembership` to compare James’s Sales role with his assigned groups.
2. Used `Get-ADGroupMember -Identity DL_FINANCE_RW -Recursive` to resolve effective group membership through nesting. The successful query lists James and Sarah. The preceding typo in the [original terminal capture](../screenshots/14-finance-membership-before-remediation.png) produced no result and was corrected in the same session.
3. Inspected the Finance NTFS ACL with `Get-Acl` and calculated James’s permissions in [Windows Effective Access](../screenshots/15-james-finance-effective-access-before.png). The view shows list/read, create/write, and Delete permissions. Full Control and Change permissions are unavailable in the displayed view.

This access could expose Finance data to unauthorized viewing or changes. The scenario evaluated permissions. Observed file use and data loss were outside its scope.

## Remediation and validation

I removed James from `GG_FINANCE_USERS` and preserved `GG_SALES_USERS`. The [ADUC Membership tab](../screenshots/16-james-sales-membership-retained.png) shows Sales and the Domain Users primary group. The [recursive Finance check](../screenshots/17-finance-membership-after-remediation.png) lists Sarah only, corroborating James’s removal from that nested access path. The lab brief records that a final Effective Access check confirmed the expected result. The supplied evidence contains the before-remediation Effective Access image and after-remediation directory checks. The cause of the initial Effective Access discrepancy was undetermined. Password-change and logon-type restrictions blocked live file testing under employee identities.
