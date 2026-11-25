# Security Control Mapping

This personal lab illustrates selected control concepts. The mappings describe the demonstrated scope and provide no certification or formal compliance determination.

| Framework | Reference | Lab application |
| --- | --- | --- |
| NIST SP 800-53 Rev. 5 | AC-2 Account Management | Created and inventoried role-based employee accounts, reviewed assignments, and disabled the simulated terminated account. |
| NIST SP 800-53 Rev. 5 | AC-3 Access Enforcement and AC-6 Least Privilege | Used NTFS ACLs and nested security groups to enforce a role-based Finance entitlement and removed an unnecessary assignment. |
| NIST CSF 2.0 | PR.AA-01 and PR.AA-05 | Managed employee identities and reviewed, evaluated, and revoked a resource entitlement with least privilege in mind. |
| ISO/IEC 27001:2022 Annex A | A.5.15 Access control, A.5.16 Identity management, A.5.18 Access rights | Applied a role-based access rule, demonstrated onboarding and offboarding, and reviewed and revoked access rights. ISO/IEC 27002:2022 provides implementation guidance for these controls. |
| CIS Controls v8.1 | 5.1 Inventory of Accounts | Produced a point-in-time two-account directory inventory. A full inventory and scheduled validation were outside scope. |
| CIS Controls v8.1 | 6.1 Granting, 6.2 Revoking, 6.8 RBAC | Assigned departmental roles, revoked inappropriate and terminated-user access, and reviewed the resulting entitlements. Formal scheduling and sign-off were outside scope. |

## Verification evidence

The final Windows Effective Access calculations support the access enforcement, least privilege, and revocation mappings above. The Finance folder no longer granted list/read, create/write, or Delete permissions to [James after remediation](../screenshots/18-james-finance-effective-access-after.png) or [Sarah after offboarding](../screenshots/20-sarah-finance-effective-access-after-offboarding.png). These results apply to the folder’s calculated NTFS permissions. Password-change and logon-type restrictions blocked live file access testing under employee identities.

## Sources

- [NIST SP 800-53 Rev. 5](https://csrc.nist.gov/pubs/sp/800/53/r5/upd1/final)
- [NIST Cybersecurity Framework 2.0, Appendix A](https://doi.org/10.6028/NIST.CSWP.29)
- [ISO/IEC 27001:2022](https://www.iso.org/standard/27001) and [ISO/IEC 27002:2022](https://www.iso.org/standard/75652.html)
- [CIS Controls Navigator v8.1](https://www.cisecurity.org/controls/cis-controls-navigator)
