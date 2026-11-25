# Access Review Report

## Scope and decision criteria

This point-in-time review covered the two employee identities beneath `OU=Corp,DC=iam,DC=example,DC=test` and the role-based entitlement to `C:\CorpResources\Finance`. Finance Modify access required a Finance business role, Sales membership was retained for the active Sales employee, and a terminated employee’s account was disabled and departmental access revoked. Business decisions and approvals were simulated.

## Findings and decisions

| Account | Finding | Decision | Verification |
| --- | --- | --- | --- |
| James Carter (`jcarter`) | Finance membership was inappropriate for a Sales employee and granted effective folder read/write in the simulated exception. | Revoke Finance and retain Sales. | [ADUC Sales membership](../screenshots/16-james-sales-membership-retained.png), [recursive Finance check](../screenshots/17-finance-membership-after-remediation.png), and the final CSV. |
| Sarah Mitchell (`Smitchell`) | Finance membership was appropriate while employed. Simulated termination ended the business need. | Disable the account, revoke Finance and retain the object in Disabled Accounts. | [OU placement](../screenshots/19-disabled-accounts-ou.png), [account status and group check](../screenshots/21-sarah-finance-membership-verification.png), and the final CSV. |

## Final inventory

| Name | SAM account name | Enabled | Direct groups in MemberOf |
| --- | --- | --- | --- |
| Sarah Mitchell | Smitchell | False | Empty |
| James Carter | jcarter | True | GG_SALES_USERS |

The [CSV import screenshot](../screenshots/23-access-review-csv-verification.png) corroborates these rows. The [CSV in this repository](AccessReview.csv) was reconstructed from that output. A blank Groups field represents an empty direct `MemberOf` list. It omits the primary group and cannot prove absence of all effective rights. Final resource permissions were evaluated separately in the lab according to the brief. The retained screenshots support the final directory state.
