# Lab architecture and IAM workflows

## Directory and resource

```mermaid
flowchart TB
    V["Oracle VirtualBox"] --> W["Windows Server 2025 · IAM-DC01"]
    W --> D["iam.example.test · IAM"]
    W --> R["NTFS Finance folder"]
    D --> C["Corp OU"]
    C --> B["Finance · HR · IT · Sales OUs"]
    C --> G["Security Groups OU"]
    C --> X["Disabled Accounts OU"]
    G -->|Resource group grants Modify| R
```

## Finance entitlement and remediation

```mermaid
flowchart TB
    S["Sarah · Finance"] --> F["GG_FINANCE_USERS"]
    J["James · Sales"] --> G["GG_SALES_USERS"]
    J -. "Simulated membership · removed" .-> F
    F --> L["DL_FINANCE_RW"]
    L -->|Modify| R["Finance NTFS ACL"]
    A["SYSTEM and Administrators"] -->|"Full Control"| R
```

The exception arose at the role assignment. Removing James from the Finance global group preserved the Finance role’s access path for its authorized member and preserved James’s Sales access.

## Employee lifecycle

```mermaid
stateDiagram-v2
    [*] --> Provisioned
    Provisioned --> Reviewed: Compare role and entitlements
    Reviewed --> Remediated: Revoke inappropriate membership
    Remediated --> Reviewed: Recheck groups and resource
    Reviewed --> Offboarded: Simulated HR termination
    Offboarded --> Retained: Disable, revoke, move to Disabled Accounts
    Retained --> [*]: Capture evidence
```
