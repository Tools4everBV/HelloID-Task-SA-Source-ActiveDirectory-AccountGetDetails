try {
    $userPrincipalName = $dataSource.selectedUser.UserPrincipalName
    Write-Information "Searching AD user [$userPrincipalName]"
    
    Import-Module ActiveDirectory -ErrorAction Stop
    
    $adProperties = "displayname", "samaccountname", "userPrincipalName", "mail", "employeeID", "Enabled"
    $adUser = Get-ADuser -Filter { UserPrincipalName -eq $userPrincipalName } -Properties $adProperties | Select-Object $adProperties

    if([String]::IsNullOrEmpty($adUser) -eq $true) {
        $msg = "Could not find AD user [$userPrincipalName]"
        Write-Error $msg
    } else {
        Write-Information "Found AD user [$userPrincipalName]"
        
        foreach($tmp in $adUser.psObject.properties)
        {
            $returnObject = @{name=$tmp.Name; value=$tmp.value}
            Write-Output $returnObject
        }
    }
} catch {
    $msg = "Error retrieving AD user [$userPrincipalName] attributes. Error: $($_.Exception.Message)"
    Write-Error $msg
}