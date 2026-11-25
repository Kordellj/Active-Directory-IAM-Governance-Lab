# Employee Offboarding Report

## Simulated termination request

Revoke Sarah Mitchell’s access following a simulated HR-authorized termination. Preserve the disabled Active Directory object for the lab’s audit and retention scenario.

| Action | Evidence or result |
| --- | --- |
| Disable the account | PowerShell shows `Enabled: False`, corroborated by the final CSV import. |
| Remove the Finance role group | `MemberOf` is empty. The recursive Finance resource group query shows no returned members in the captured session. |
| Move the object to Disabled Accounts | ADUC displays Sarah under Corp → Disabled Accounts. The PowerShell distinguished-name query did not return the expected OU evidence. |
| Validate Finance folder access | [Final Windows Effective Access](../screenshots/20-sarah-finance-effective-access-after-offboarding.png) shows Sarah no longer had list/read, create/write, or Delete permissions on the Finance folder. |

[ADUC placement](../screenshots/19-disabled-accounts-ou.png) · [PowerShell checks](../screenshots/21-sarah-finance-membership-verification.png) · [CSV import](../screenshots/23-access-review-csv-verification.png)

Retaining the object preserves its directory identity for later investigation. For a production evidence record, associate the approval, execution timestamps, reviewer sign-off, and retention policy with the account change. Password-change and logon-type restrictions blocked live file access testing under employee identities. Session revocation, other applications, shared credentials and mailbox or file ownership transfers were outside this lab’s scope.
