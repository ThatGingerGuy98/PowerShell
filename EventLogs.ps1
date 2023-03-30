if ($eventLogs) {} else {
    <#$eventLogs = ingest eventlogs, however you wish#>
}
while ($true){
$eventID = Read-Host -Prompt "Please enter an eventID you would like to investigate`nType 'quit' to exit program"
    switch ($eventID)
    {
        '4663' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={$_.ReplacementStrings[6]};L="Object"}, @{E={[uint32]$_.ReplacementStrings[9]};L="Process ID"}, @{E={$_.ReplacementStrings[10]};L="Process Name"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits attempts to access an object."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4656' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={$_.ReplacementStrings[6]};L="Object"}, @{E={[uint32]$_.ReplacementStrings[9]};L="Process ID"}, @{E={$_.ReplacementStrings[10]};L="Process Name"}, @{E={$_.ReplacementStrings[11]};L="Privileges"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits handles to objects being requested."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4720' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={$_.ReplacementStrings[6]};L="New User"}, @{E={$_.ReplacementStrings[29]};L="New User Privs"} |Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits user accounts being created."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4738' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={$_.ReplacementStrings[6]};L="New User"}, @{E={$_.ReplacementStrings[29]};L="New User Privs"} |Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits user accounts changing."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4732' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={$_.ReplacementStrings[5]};L="Targeted User"}, @{E={$_.ReplacementStrings[7]};L="Group"} |Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits users being added to local security groups."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4634' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={switch ($_.ReplacementStrings[4])
                {
                    '2' { Return "$_ Interactive/Local"}
                    '3' { Return "$_ Network"}
                    '4' { Return "$_ Scheduled Task"}
                    '5' { Return "$_ Service"}
                    '8' { Return "$_ Network Cleartext"}
                    '9' { Return "$_ New Credentials"}
                    '10' { Return "$_ Remote Interactive"}
                    Default {}
                }};L="Logon Type"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits user logoffs."
                break
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4798' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={$_.ReplacementStrings[5]};L="Enumerated User"}, @{E={[uint32]$_.ReplacementStrings[7]};L="Requesting Process PID"}, @{E={$_.ReplacementStrings[8]};L="Requesting Process Name"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits when users have their local groups enumerated"
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4799' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={$_.ReplacementStrings[5]};L="Enumerated User"}, @{E={[uint32]$_.ReplacementStrings[7]};L="Requesting Process PID"}, @{E={$_.ReplacementStrings[8]};L="Requesting Process Name"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits when security-enabled members have their local groups enumerated"
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4624' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[5]};L="User"}, @{E={switch ($_.ReplacementStrings[8])
                {
                    '2' { Return "$_ Interactive/Local"}
                    '3' { Return "$_ Network"}
                    '4' { Return "$_ Scheduled Task"}
                    '5' { Return "$_ Service"}
                    '7' { Return "$_ Unlock"}
                    '8' { Return "$_ Network Cleartext"}
                    '9' { Return "$_ New Credentials"}
                    '10' { Return "$_ Remote Interactive"}
                    '11' { Return "$_ Cached Interactive"}
                    Default {}
                }};L="Logon Type"}, @{E={switch ($_.ReplacementStrings[20])
                {
                    '%%1832' { Return "$_ Identification"}
                    '%%1833' { Return "$_ Impersonation"}
                    '%%1840' { Return "$_ Delegation"}
                    '%%1841' { Return "$_ Denied by Process Trust Label ACE"}
                    '%%1842' { Return "$_ Yes"}
                    '%%1843' { Return "$_ No"}
                    '%%1844' { Return "$_ System"}
                    '%%1845' { Return "$_ Not Available"}
                    '%%1846' { Return "$_ Default"}
                    '%%1847' { Return "$_ DisallowMmConfig"}
                    '%%1848' { Return "$_ Off"}
                    '%%1894' { Return "$_ Auto"}
                    Default {}
                }};L="Impersonation Level"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits user logins."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4688' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="Creator"}, @{E={$_.ReplacementStrings[5]};L="Target Account"}, @{E={[uint32]$_.ReplacementStrings[4]};L="New Process ID"}, @{E={$_.ReplacementStrings[5]};L="New Process Name"}, @{E={switch ($_.ReplacementStrings[6])
                {
                    '%%1936' { Return "$_ Local Administrator Account"}
                    '%%1937' { Return "$_ User w/ Administrative Rights"}
                    '%%1938' { Return "$_ User"}
                    Default {}
                }};L="Token"}, @{E={switch ((($_.ReplacementStrings[14]) -split "-")[-1])
                {
                    '0' { Return "$_ Untrusted"}
                    '4096' { Return "$_ Low integrity"}
                    '8192' { Return "$_ Medium integrity (Generally normal User activation)"}
                    '8448' { Return "$_ Medium High integrity"}
                    '12288' { Return "$_ High integrity (Generally Administrative User activation)"}
                    '16384' { Return "$_ System integrity"}
                    '20480' { Return "$_ Protected process"}
                    Default {}
                }};L="Integrity"}, @{E={[uint32]$_.ReplacementStrings[7]};L="Parent Process PID"}, @{E={$_.ReplacementStrings[13]};L="Parent Process Name"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits when processes are created."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4689' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={[uint32]$_.ReplacementStrings[5]};L="Process ID"}, @{E={$_.ReplacementStrings[6]};L="Process Name"}, @{E={[uint32]$_.ReplacementStrings[7]};L="Exit Code"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits when processes exit."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4648' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={$_.ReplacementStrings[5]};L="Credentials Used"}, @{E={$_.ReplacementStrings[8]};L="Targeted Server"}, @{E={$_.ReplacementStrings[9]};L="Target Server Info"}, @{E={[uint32]$_.ReplacementStrings[10]};L="Process PID"}, @{E={$_.ReplacementStrings[11]};L="Process Name"}, @{E={$_.ReplacementStrings[12]};L="Target Server IP"}, @{E={$_.ReplacementStrings[13]};L="Target Server Port"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits when an attempt using explicit credentials."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4776' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={switch ($_.ReplacementStrings[3])
                {
                    '0xC0000064' { Return "$_ Username Doesn't Exist"}
                    '0xC000006A' { Return "$_ Misspelled or Bad Password"}
                    '0xC000006D' { Return "$_ Generic logon failure"}
                    '0xC000006F' { Return "$_ Outside authorized hours"}
                    '0xC0000070' { Return "$_ Non-authrized workstation"}
                    '0xC0000071' { Return "$_ Password expired"}
                    '0xC0000072' { Return "$_ Account Disabled by Administrator"}
                    '0xC0000193' { Return "$_ Account Expired"}
                    '0xC0000224' { Return "$_ Account must change password"}
                    '0xC0000234' { Return "$_ Account is locked"}
                    '0xC0000371' { Return "$_ The local account store does not contain secret material for the specified account."}
                    '0x0' { Return "$_ No Errors"}
                    Default {}
                }};L="Error Code"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits when computer attempted to validate the credentials for an account."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4740' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={$_.ReplacementStrings[4]};L="Locked Out Account"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits when a user becomes locked out."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '5136' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={$_.ReplacementStrings[8]};L="Directory Object"}, @{E={$_.ReplacementStrings[10]};L="Object Class"}, @{E={switch ($_.ReplacementStrings[14])
                {
                    '%%14674' { Return "$_ Value Added"}
                    '%%14675' { Return "$_ Value Deleted"}
                    Default {}
                }};L="Action"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits when a directory service object is modified."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4616' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={$_.ReplacementStrings[4]};L="Previous Time"}, @{E={$_.ReplacementStrings[5]};L="Current Time"}, @{E={[uint32]$_.ReplacementStrings[6]};L="Process PID"}, @{E={$_.ReplacementStrings[7]};L="Process Name"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits when system time was changed."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4657' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={switch ($_.ReplacementStrings[4])
                {
                    'REGISTRYMACHINE' { Return "HKLM"}
                    "REGISTRYUSER*" { Return "HKCU"}
                    'REGISTRYMACHINESOFTWAREClasses' { Return "HKCR"}
                    'REGISTRYUSERS' { Return "HKU"}
                    'REGISTRYMACHINESYSTEMControlSet001Hardware ProfilesCurrent' { Return "HKCC"}
                    Default {}
                }};L="Registry Hive"}, @{E={$_.ReplacementStrings[5]};L="Registry Key"}, @{E={[uint32]$_.ReplacementStrings[12]};L="Process PID"}, @{E={$_.ReplacementStrings[13]};L="Process Name"}, @{E={$_.ReplacementStrings[8]};L="Old Value Type"}, @{E={$_.ReplacementStrings[9]};L="Old Value"}, @{E={$_.ReplacementStrings[10]};L="New Value Type"}, @{E={$_.ReplacementStrings[11]};L="New Value"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits when a registry key value is changed."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4717' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={$_.ReplacementStrings[4]};L="Targeted User"}, @{E={$_.ReplacementStrings[5]};L="Granted right"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits when local logon user right policy is changed to add a permission."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4718' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={$_.ReplacementStrings[4]};L="Targeted User"}, @{E={$_.ReplacementStrings[5]};L="Right removed"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits when local logon user right policy is changed to remove a permission."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4704' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={$_.ReplacementStrings[4]};L="Targeted User"}, @{E={$_.ReplacementStrings[5]};L="Granted right"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits when local logon user right policy is assigned."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4705' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={$_.ReplacementStrings[4]};L="Targeted User"}, @{E={$_.ReplacementStrings[5]};L="Right removed"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits when local logon user right policy is assigned."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4673' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={$_.ReplacementStrings[5]};L="Targeted Service"}, @{E={[uint32]$_.ReplacementStrings[6]};L="Process PID"}, @{E={$_.ReplacementStrings[7]};L="Process Name"}, @{E={$_.ReplacementStrings[8]};L="Requested Privilage"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits when local logon user right policy is assigned."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '5137' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={$_.ReplacementStrings[8]};L="Directory Object"}, @{E={$_.ReplacementStrings[10]};L="Object Class"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits when a directory service object is created."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '5138' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={$_.ReplacementStrings[8]};L="Directory Object"}, @{E={$_.ReplacementStrings[10]};L="Object Class"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits when a directory service object is undeleted."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '5139' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={$_.ReplacementStrings[8]};L="Old Directory Location"}, @{E={$_.ReplacementStrings[9]};L="New Directory Location"}, @{E={$_.ReplacementStrings[10]};L="Object Class"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits when a directory service object is undeleted."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '5141' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={$_.ReplacementStrings[8]};L="Directory Object"}, @{E={$_.ReplacementStrings[10]};L="Object Class"}, @{E={$_.ReplacementStrings[12]};L="Tree Delete"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits when a directory service object is deleted."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '5140' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={$_.ReplacementStrings[4]};L="Object Type"}, @{E={$_.ReplacementStrings[5]};L="Source IP"}, @{E={$_.ReplacementStrings[6]};L="Source Port"}, @{E={$_.ReplacementStrings[7]};L="Share Name"}, @{E={$_.ReplacementStrings[8]};L="Share Path"}, @{E={$_.ReplacementStrings[10]};L="Access"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits when a network share object was accessed."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '5144' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={$_.ReplacementStrings[4]};L="Share Name"}, @{E={$_.ReplacementStrings[5]};L="Share Path"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits when a network share object was accessed."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '5140' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={$_.ReplacementStrings[4]};L="Object Type"}, @{E={$_.ReplacementStrings[5]};L="Source IP"}, @{E={$_.ReplacementStrings[6]};L="Source Port"}, @{E={$_.ReplacementStrings[7]};L="Share Name"}, @{E={$_.ReplacementStrings[8]};L="Share Path"}, @{E={$_.ReplacementStrings[11]};L="Requested Accesses"}, @{E={$_.ReplacementStrings[12]};L="Granted Accesses"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits when a network share object was accessed."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4768' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="User"}, @{E={$_.ReplacementStrings[3]};L="Service Name"}, @{E={switch ($_.ReplacementStrings[4])
                {
                    {$_ -match "S-1-5-d{2}(-d{10}){2}-d{9}-502"} { Return "$_"}
                    Default { Return "NON-STANDARD VALUE - $_" }
                }};L="Service SID"}, @{E={$_.ReplacementStrings[9]};L="Client IP"}, @{E={$_.ReplacementStrings[10]};L="Client Port"}, @{E={switch ($_.ReplacementStrings[5])
                {
                    {$_ -match "0x40810010" -or $_ -match "0x40810000" -or $_ -match "0x60810010"} { Return "Common Value: $_"}
                    Default { Return "Uncommon Value: $_" }
                }};L="Ticket Option"}, @{E={switch ($_.ReplacementStrings[6])
                {
                    0x0 { Return "$_ Success"}
                    0x6 { Return "$_ Username does not exist"}
                    0x7 { Return "$_ Domain Controller server not found"}
                    0x8 { Return "$_ Multiple DCs of same name found, failure"}
                    0x9 { Return "$_ No master key found"}
                    0xA { Return "$_ Client time ahead of server time"}
                    0xB { Return "$_ Client server time mismatch"}
                    0xC { Return "$_ Logon restriction detected"}
                    0xD { Return "$_ Credential Delegation not authorized"}
                    0xE { Return "$_ Encryption type not supported"}
                    0xF { Return "$_ Checksum not supported"}
                    0x10 { Return "$_ Smart card logon not accepted, proper certificate not found"}
                    0x12 { Return "$_ Client revoked, likely a disabled, expired, or locked out account"}
                    0x14 { Return "$_ TGT revoked, PKCROSS ticket expired"}
                    0x17 { Return "$_ User's password has expired"}
                    0x18 { Return "$_ User's password is incorrect"}
                    0x19 { Return "$_ Pre-auth failure"}
                    0x1F { Return "$_ Authenticator encrypted with something other than session key.  Worth investigation"}
                    0x20 { Return "$_ Ticket Expired"}
                    0x21 { Return "$_ Server time ahead of client time"}
                    0x22 { Return "$_ Duplicate request"}
                    0x23 { Return "$_ Ticket sent to wrong server"}
                    0x24 { Return "$_ Ticket and authenticator do not match"}
                    0x25 { Return "$_ Time difference exceeds authroized difference"}
                    0x26 { Return "$_ IP header does not match address in request"}
                    0x27 { Return "$_ Kerberos version mismatch"}
                    0x28 { Return "$_ Error type unsuppored"}
                    0x29 { Return "$_ Checksum does not match"}
                    0x2A { Return "$_ Packet sequence out of order, or packet is missing"}
                    0x2C { Return "$_ Version of key not available"}
                    0x2D { Return "$_ Key not available"}
                    0x32 { Return "$_ Checksum not supported"}
                    0x34 { Return "$_ Ticket too large"}
                    0x3C { Return "$_ Generic Error"}
                    0x3D { Return "$_ Specific field too long"}
                    0x3E { Return "$_ Client not trusted"}
                    0x3F { Return "$_ Server not trusted"}
                    0x40 { Return "$_ Invalid signature"}
                    0x41 { Return "$_ Encryption to weak"}
                    0x42 { Return "$_ User to user authorization is required"}
                    0x43 { Return "$_ No TGT available"}
                    0x44 { Return "$_ Incorrect domain or principal"}
                    {($_ -ge 0x1 -and $_ -le 0x5) -or $_ -eq (0x11, 0x13, 0x15, 0x16, 0x1A, 0x1D, 0x2E, 0x2F, 0x31, 0x33, 0x30)} { Return "Weird: $_"}
                    Default { Return "Extra Wierd: $_" }
                }};L="Status"}, @{E={switch ($_.ReplacementStrings[7])
                {
                    0x1 { Return "$_ CRC - Deprecated"}
                    0x3 { Return "$_ MD5 - Deprecated"}
                    0x11 { Return "$_ AES128"}
                    0x12 { Return "$_ AES256"}
                    0x17 { Return "$_ RC4-HMAC"}
                    0x18 { Return "$_ RC4-HMAC-EXP"}
                    Default { Return "$_ Audit Failure" }
                }};L="Encryption Type"}, @{E={switch ($_.ReplacementStrings[8])
                {
                    0 { Return "$_ No Pre-Authentication"}
                    2 { Return "$_ Username/Passowrd Authentication"}
                    15 { Return "$_ Smart Card Authentication"}
                    20 { Return "$_ Used in KDC Referral tickets"}
                    138 { Return "$_ Logon using Kerveros Armoring (FAST)"}
                    {$_ -eq (11, 17, 19)} { Return "$_ Wierd"}
                }};L="Pre-Authentication Types"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits Kerberos authentication ticket requests.  This should only be found on Domain Controllers."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4769' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[0]};L="User"}, @{E={$_.ReplacementStrings[2]};L="Service Name"}, @{E={switch ($_.ReplacementStrings[3])
                {
                    {$_ -match "S-1-5-d{2}(-d{10}){2}-d{9}-502"} { Return "$_"}
                    Default { Return "NON-STANDARD VALUE - $_" }
                }};L="Service SID"}, @{E={$_.ReplacementStrings[6]};L="Client IP"}, @{E={$_.ReplacementStrings[7]};L="Client Port"}, @{E={switch ($_.ReplacementStrings[4])
                {
                    {$_ -match "0x40810010" -or $_ -match "0x40810000" -or $_ -match "0x60810010"} { Return "Common Value: $_"}
                    Default { Return "Uncommon Value: $_" }
                }};L="Ticket Option"}, @{E={switch ($_.ReplacementStrings[8])
                {
                    0x0 { Return "$_ Success"}
                    0x6 { Return "$_ Username does not exist"}
                    0x7 { Return "$_ Domain Controller server not found"}
                    0x8 { Return "$_ Multiple DCs of same name found, failure"}
                    0x9 { Return "$_ No master key found"}
                    0xA { Return "$_ Client time ahead of server time"}
                    0xB { Return "$_ Client server time mismatch"}
                    0xC { Return "$_ Logon restriction detected"}
                    0xD { Return "$_ Credential Delegation not authorized"}
                    0xE { Return "$_ Encryption type not supported"}
                    0xF { Return "$_ Checksum not supported"}
                    0x10 { Return "$_ Smart card logon not accepted, proper certificate not found"}
                    0x12 { Return "$_ Client revoked, likely a disabled, expired, or locked out account"}
                    0x14 { Return "$_ TGT revoked, PKCROSS ticket expired"}
                    0x17 { Return "$_ User's password has expired"}
                    0x18 { Return "$_ User's password is incorrect"}
                    0x19 { Return "$_ Pre-auth failure"}
                    0x1F { Return "$_ Authenticator encrypted with something other than session key.  Worth investigation"}
                    0x20 { Return "$_ Ticket Expired"}
                    0x21 { Return "$_ Server time ahead of client time"}
                    0x22 { Return "$_ Duplicate request"}
                    0x23 { Return "$_ Ticket sent to wrong server"}
                    0x24 { Return "$_ Ticket and authenticator do not match"}
                    0x25 { Return "$_ Time difference exceeds authroized difference"}
                    0x26 { Return "$_ IP header does not match address in request"}
                    0x27 { Return "$_ Kerberos version mismatch"}
                    0x28 { Return "$_ Error type unsuppored"}
                    0x29 { Return "$_ Checksum does not match"}
                    0x2A { Return "$_ Packet sequence out of order, or packet is missing"}
                    0x2C { Return "$_ Version of key not available"}
                    0x2D { Return "$_ Key not available"}
                    0x32 { Return "$_ Checksum not supported"}
                    0x34 { Return "$_ Ticket too large"}
                    0x3C { Return "$_ Generic Error"}
                    0x3D { Return "$_ Specific field too long"}
                    0x3E { Return "$_ Client not trusted"}
                    0x3F { Return "$_ Server not trusted"}
                    0x40 { Return "$_ Invalid signature"}
                    0x41 { Return "$_ Encryption to weak"}
                    0x42 { Return "$_ User to user authorization is required"}
                    0x43 { Return "$_ No TGT available"}
                    0x44 { Return "$_ Incorrect domain or principal"}
                    {($_ -ge 0x1 -and $_ -le 0x5) -or $_ -eq (0x11, 0x13, 0x15, 0x16, 0x1A, 0x1D, 0x2E, 0x2F, 0x31, 0x33, 0x30)} { Return "Weird: $_"}
                    Default { Return "Extra Wierd: $_" }
                }};L="Status"}, @{E={switch ($_.ReplacementStrings[5])
                {
                    0x1 { Return "$_ CRC - Deprecated"}
                    0x3 { Return "$_ MD5 - Deprecated"}
                    0x11 { Return "$_ AES128"}
                    0x12 { Return "$_ AES256"}
                    0x17 { Return "$_ RC4-HMAC"}
                    0x18 { Return "$_ RC4-HMAC-EXP"}
                    Default { Return "$_ Audit Failure" }
                }};L="Encryption Type"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits Kerberos service ticket requests.  This should only be found on Domain Controllers."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4770' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[0]};L="User"}, @{E={$_.ReplacementStrings[2]};L="Service Name"}, @{E={switch ($_.ReplacementStrings[3])
                {
                    {$_ -match "S-1-5-d{2}(-d{10}){2}-d{9}-502"} { Return "$_"}
                    Default { Return "NON-STANDARD VALUE - $_" }
                }};L="Service SID"}, @{E={$_.ReplacementStrings[6]};L="Client IP"}, @{E={$_.ReplacementStrings[7]};L="Client Port"}, @{E={switch ($_.ReplacementStrings[4])
                {
                    {$_ -match "0x40810010" -or $_ -match "0x40810000" -or $_ -match "0x60810010"} { Return "Common Value: $_"}
                    Default { Return "Uncommon Value: $_" }
                }};L="Ticket Option"},  | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits Kerberos service ticket requests.  This should only be found on Domain Controllers."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4771' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[0]};L="User"}, @{E={$_.ReplacementStrings[2]};L="Service Name"}, @{E={switch ($_.ReplacementStrings[1])
                {
                    {$_ -match "S-1-5-d{2}(-d{10}){2}-d{9}-502"} { Return "$_"}
                    Default { Return "NON-STANDARD VALUE - $_" }
                }};L="Service SID"}, @{E={$_.ReplacementStrings[6]};L="Client IP"}, @{E={$_.ReplacementStrings[7]};L="Client Port"}, @{E={switch ($_.ReplacementStrings[4])
                {
                    {$_ -match "0x40810010" -or $_ -match "0x40810000" -or $_ -match "0x60810010"} { Return "Common Value: $_"}
                    Default { Return "Uncommon Value: $_" }
                }};L="Ticket Option"}, @{E={switch ($_.ReplacementStrings[5])
                {
                    0x0 { Return "$_ Success"}
                    0x6 { Return "$_ Username does not exist"}
                    0x7 { Return "$_ Domain Controller server not found"}
                    0x8 { Return "$_ Multiple DCs of same name found, failure"}
                    0x9 { Return "$_ No master key found"}
                    0xA { Return "$_ Client time ahead of server time"}
                    0xB { Return "$_ Client server time mismatch"}
                    0xC { Return "$_ Logon restriction detected"}
                    0xD { Return "$_ Credential Delegation not authorized"}
                    0xE { Return "$_ Encryption type not supported"}
                    0xF { Return "$_ Checksum not supported"}
                    0x10 { Return "$_ Smart card logon not accepted, proper certificate not found"}
                    0x12 { Return "$_ Client revoked, likely a disabled, expired, or locked out account"}
                    0x14 { Return "$_ TGT revoked, PKCROSS ticket expired"}
                    0x17 { Return "$_ User's password has expired"}
                    0x18 { Return "$_ User's password is incorrect"}
                    0x19 { Return "$_ Pre-auth failure"}
                    0x1F { Return "$_ Authenticator encrypted with something other than session key.  Worth investigation"}
                    0x20 { Return "$_ Ticket Expired"}
                    0x21 { Return "$_ Server time ahead of client time"}
                    0x22 { Return "$_ Duplicate request"}
                    0x23 { Return "$_ Ticket sent to wrong server"}
                    0x24 { Return "$_ Ticket and authenticator do not match"}
                    0x25 { Return "$_ Time difference exceeds authroized difference"}
                    0x26 { Return "$_ IP header does not match address in request"}
                    0x27 { Return "$_ Kerberos version mismatch"}
                    0x28 { Return "$_ Error type unsuppored"}
                    0x29 { Return "$_ Checksum does not match"}
                    0x2A { Return "$_ Packet sequence out of order, or packet is missing"}
                    0x2C { Return "$_ Version of key not available"}
                    0x2D { Return "$_ Key not available"}
                    0x32 { Return "$_ Checksum not supported"}
                    0x34 { Return "$_ Ticket too large"}
                    0x3C { Return "$_ Generic Error"}
                    0x3D { Return "$_ Specific field too long"}
                    0x3E { Return "$_ Client not trusted"}
                    0x3F { Return "$_ Server not trusted"}
                    0x40 { Return "$_ Invalid signature"}
                    0x41 { Return "$_ Encryption to weak"}
                    0x42 { Return "$_ User to user authorization is required"}
                    0x43 { Return "$_ No TGT available"}
                    0x44 { Return "$_ Incorrect domain or principal"}
                    {($_ -ge 0x1 -and $_ -le 0x5) -or $_ -eq (0x11, 0x13, 0x15, 0x16, 0x1A, 0x1D, 0x2E, 0x2F, 0x31, 0x33, 0x30)} { Return "Weird: $_"}
                    Default { Return "Extra Wierd: $_" }
                }};L="Status"}, @{E={switch ($_.ReplacementStrings[5])
                {
                    0x1 { Return "$_ CRC - Deprecated"}
                    0x3 { Return "$_ MD5 - Deprecated"}
                    0x11 { Return "$_ AES128"}
                    0x12 { Return "$_ AES256"}
                    0x17 { Return "$_ RC4-HMAC"}
                    0x18 { Return "$_ RC4-HMAC-EXP"}
                    Default { Return "$_ Audit Failure" }
                }};L="Encryption Type"}, @{E={switch ($_.ReplacementStrings[6])
                {
                    0 { Return "$_ No Pre-Authentication"}
                    2 { Return "$_ Username/Passowrd Authentication"}
                    15 { Return "$_ Smart Card Authentication"}
                    20 { Return "$_ Used in KDC Referral tickets"}
                    138 { Return "$_ Logon using Kerveros Armoring (FAST)"}
                    {$_ -eq (11, 17, 19)} { Return "$_ Wierd"}
                }};L="Pre-Authentication Types"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits Kerberos service ticket requests.  This should only be found on Domain Controllers."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        'quit' { return $null }
        Default {
            Write-Host -ForegroundColor Red "Please enter an Event ID as defined in the Intel Matrix."
        }
    }
}
