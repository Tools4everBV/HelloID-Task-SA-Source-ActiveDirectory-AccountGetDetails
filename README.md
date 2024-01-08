# HelloID-Task-SA-Source-ActiveDirectory-AccountGetDetails

## Prerequisites

- [ ] The HelloID SA on-premises agent installed
- [ ] The ActiveDirectory module is installed on the server where the HelloID SA on-premises agent is running.
- [ ] Data source input parameter (required parameter) named `selectedUser`. The linked form-element should at least return a model containing the `UserPrincipalName` property


## Description

This code snippet executes the following tasks:

1. Define `$userPrincipalName` based on the `selectedUser` data source input `$dataSource.selectedUser.UserPrincipalName`
2. Imports the ActiveDirectory module.
3. Define a list of AD properties to retrieve from the AD user
3. Retrieve the configured AD user properties using the `Get-ADUser` cmdlet.
6. Return a hash table for each AD user property using the `Write-Output` cmdlet.

> To view an example of the data source output, please refer to the JSON code pasted below and select the `Interpreted as JSON` option in HelloID

```json
{
    "UserPrincipalName": "a.acevedo@domain.local"
}
```