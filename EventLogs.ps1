if ($eventLogs) {} else {
    <#$eventLogs = importcsv file#>
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
                    '2' { Return "Interactive/Local"}
                    '3' { Return "Network"}
                    '4' { Return "Scheduled Task"}
                    '5' { Return "Service"}
                    '8' { Return "Network Cleartext"}
                    '9' { Return "New Credentials"}
                    '10' { Return "Remote Interactive"}
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
                    '2' { Return "Interactive/Local"}
                    '3' { Return "Network"}
                    '4' { Return "Scheduled Task"}
                    '5' { Return "Service"}
                    '7' { Return "Unlock"}
                    '8' { Return "Network Cleartext"}
                    '9' { Return "New Credentials"}
                    '10' { Return "Remote Interactive"}
                    '11' { Return "Cached Interactive"}
                    Default {}
                }};L="Logon Type"}, @{E={switch ($_.ReplacementStrings[20])
                {
                    '%%1832' { Return "Identification"}
                    '%%1833' { Return "Impersonation"}
                    '%%1840' { Return "Delegation"}
                    '%%1841' { Return "Denied by Process Trust Label ACE"}
                    '%%1842' { Return "Yes"}
                    '%%1843' { Return "No"}
                    '%%1844' { Return "System"}
                    '%%1845' { Return "Not Available"}
                    '%%1846' { Return "Default"}
                    '%%1847' { Return "DisallowMmConfig"}
                    '%%1848' { Return "Off"}
                    '%%1894' { Return "Auto"}
                    Default {}
                }};L="Impersonation Level"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits user logins."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4688' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[1]};L="Creator"}, @{E={$_.ReplacementStrings[5]};L="Target Account"}, @{E={[uint32]$_.ReplacementStrings[4]};L="New Process ID"}, @{E={$_.ReplacementStrings[5]};L="New Process Name"}, @{E={switch ($_.ReplacementStrings[6])
                {
                    '%%1936' { Return "Local Administrator Account"}
                    '%%1937' { Return "User w/ Administrative Rights"}
                    '%%1938' { Return "User"}
                    Default {}
                }};L="Token"}, @{E={switch ((($_.ReplacementStrings[14]) -split "-")[-1])
                {
                    '0' { Return "Untrusted"}
                    '4096' { Return "Low integrity"}
                    '8192' { Return "Medium integrity (Generally normal User activation)"}
                    '8448' { Return "Medium High integrity"}
                    '12288' { Return "High integrity (Generally Administrative User activation)"}
                    '16384' { Return "System integrity"}
                    '20480' { Return "Protected process"}
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
                    '0xC0000064' { Return "Username Doesn't Exist"}
                    '0xC000006A' { Return "Misspelled or Bad Password"}
                    '0xC000006D' { Return "Generic logon failure"}
                    '0xC000006F' { Return "Outside authorized hours"}
                    '0xC0000070' { Return "Non-authrized workstation"}
                    '0xC0000071' { Return "Password expired"}
                    '0xC0000072' { Return "Account Disabled by Administrator"}
                    '0xC0000193' { Return "Account Expired"}
                    '0xC0000224' { Return "Account must change password"}
                    '0xC0000234' { Return "Account is locked"}
                    '0xC0000371' { Return "The local account store does not contain secret material for the specified account."}
                    '0x0' { Return "No Errors"}
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
                    '%%14674' { Return "Value Added"}
                    '%%14675' { Return "Value Deleted"}
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
                    '\REGISTRY\MACHINE' { Return "HKLM"}
                    "\REGISTRY\USER\*" { Return "HKCU"}
                    '\REGISTRY\MACHINE\SOFTWARE\Classes' { Return "HKCR"}
                    '\REGISTRY\USERS' { Return "HKU"}
                    '\REGISTRY\MACHINE\SYSTEM\ControlSet001\Hardware Profiles\Current' { Return "HKCC"}
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
                    {$_ -match "S-1-5-\d{2}(-\d{10}){2}-\d{9}-502"} { Return "$_"}
                    Default { Return "NON-STANDARD VALUE - $_" }
                }};L="Service SID"}, @{E={$_.ReplacementStrings[9]};L="Client IP"}, @{E={$_.ReplacementStrings[10]};L="Client Port"}, @{E={switch ($_.ReplacementStrings[5])
                {
                    {$_ -match "0x40810010" -or $_ -match "0x40810000" -or $_ -match "0x60810010"} { Return "Common Value: $_"}
                    Default { Return "Uncommon Value: $_" }
                }};L="Ticket Option"}, @{E={switch ($_.ReplacementStrings[6])
                {
                    0x0 {Return "Success"}
                    0x6 {Return "Username does not exist"}
                    0x7 {Return "Domain Controller server not found"}
                    0x8 {Return "Multiple DCs of same name found, failure"}
                    0x9 {Return "No master key found"}
                    0xA {Return "Client time ahead of server time"}
                    0xB {Return "Client server time mismatch"}
                    0xC {Return "Logon restriction detected"}
                    0xD {Return "Credential Delegation not authorized"}
                    0xE {Return "Encryption type not supported"}
                    0xF {Return "Checksum not supported"}
                    0x10 {Return "Smart card logon not accepted, proper certificate not found"}
                    0x12 {Return "Client revoked, likely a disabled, expired, or locked out account"}
                    0x14 {Return "TGT revoked, PKCROSS ticket expired"}
                    0x17 {Return "User's password has expired"}
                    0x18 {Return "User's password is incorrect"}
                    0x19 {Return "Pre-auth failure"}
                    0x1F {Return "Authenticator encrypted with something other than session key.  Worth investigation"}
                    0x20 {Return "Ticket Expired"}
                    0x21 {Return "Server time ahead of client time"}
                    0x22 {Return "Duplicate request"}
                    0x23 {Return "Ticket sent to wrong server"}
                    0x24 {Return "Ticket and authenticator do not match"}
                    0x25 {Return "Time difference exceeds authroized difference"}
                    0x26 {Return "IP header does not match address in request"}
                    0x27 {Return "Kerberos version mismatch"}
                    0x28 {Return "Error type unsuppored"}
                    0x29 {Return "Checksum does not match"}
                    0x2A {Return "Packet sequence out of order, or packet is missing"}
                    0x2C {Return "Version of key not available"}
                    0x2D {Return "Key not available"}
                    0x32 {Return "Checksum not supported"}
                    0x34 {Return "Ticket too large"}
                    0x3C {Return "Generic Error"}
                    0x3D {Return "Specific field too long"}
                    0x3E {Return "Client not trusted"}
                    0x3F {Return "Server not trusted"}
                    0x40 {Return "Invalid signature"}
                    0x41 {Return "Encryption to weak"}
                    0x42 {Return "User to user authorization is required"}
                    0x43 {Return "No TGT available"}
                    0x44 {Return "Incorrect domain or principal"}
                    {($_ -ge 0x1 -and $_ -le 0x5) -or $_ -eq (0x11, 0x13, 0x15, 0x16, 0x1A, 0x1D, 0x2E, 0x2F, 0x31, 0x33, 0x30)} { Return "Weird: $_"}
                    Default { Return "Extra Wierd: $_" }
                }};L="Status"}, @{E={switch ($_.ReplacementStrings[7])
                {
                    0x1 {Return "CRC - Deprecated"}
                    0x3 {Return "MD5 - Deprecated"}
                    0x11 {Return "AES128"}
                    0x12 {Return "AES256"}
                    0x17 {Return "RC4-HMAC"}
                    0x18 {Return "RC4-HMAC-EXP"}
                    Default { Return "Audit Failure" }
                }};L="Encryption Type"}, @{E={switch ($_.ReplacementStrings[8])
                {
                    0 {Return "No Pre-Authentication"}
                    2 {Return "Username/Passowrd Authentication"}
                    15 {Return "Smart Card Authentication"}
                    20 {Return "Used in KDC Referral tickets"}
                    138 {Return "Logon using Kerveros Armoring (FAST)"}
                    {$_ -eq (11, 17, 19)} {Return "Wierd"}
                }};L="Pre-Authentication Types"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits Kerberos authentication ticket requests.  This should only be found on Domain Controllers."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4769' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[0]};L="User"}, @{E={$_.ReplacementStrings[2]};L="Service Name"}, @{E={switch ($_.ReplacementStrings[3])
                {
                    {$_ -match "S-1-5-\d{2}(-\d{10}){2}-\d{9}-502"} { Return "$_"}
                    Default { Return "NON-STANDARD VALUE - $_" }
                }};L="Service SID"}, @{E={$_.ReplacementStrings[6]};L="Client IP"}, @{E={$_.ReplacementStrings[7]};L="Client Port"}, @{E={switch ($_.ReplacementStrings[4])
                {
                    {$_ -match "0x40810010" -or $_ -match "0x40810000" -or $_ -match "0x60810010"} { Return "Common Value: $_"}
                    Default { Return "Uncommon Value: $_" }
                }};L="Ticket Option"}, @{E={switch ($_.ReplacementStrings[8])
                {
                    0x0 {Return "Success"}
                    0x6 {Return "Username does not exist"}
                    0x7 {Return "Domain Controller server not found"}
                    0x8 {Return "Multiple DCs of same name found, failure"}
                    0x9 {Return "No master key found"}
                    0xA {Return "Client time ahead of server time"}
                    0xB {Return "Client server time mismatch"}
                    0xC {Return "Logon restriction detected"}
                    0xD {Return "Credential Delegation not authorized"}
                    0xE {Return "Encryption type not supported"}
                    0xF {Return "Checksum not supported"}
                    0x10 {Return "Smart card logon not accepted, proper certificate not found"}
                    0x12 {Return "Client revoked, likely a disabled, expired, or locked out account"}
                    0x14 {Return "TGT revoked, PKCROSS ticket expired"}
                    0x17 {Return "User's password has expired"}
                    0x18 {Return "User's password is incorrect"}
                    0x19 {Return "Pre-auth failure"}
                    0x1F {Return "Authenticator encrypted with something other than session key.  Worth investigation"}
                    0x20 {Return "Ticket Expired"}
                    0x21 {Return "Server time ahead of client time"}
                    0x22 {Return "Duplicate request"}
                    0x23 {Return "Ticket sent to wrong server"}
                    0x24 {Return "Ticket and authenticator do not match"}
                    0x25 {Return "Time difference exceeds authroized difference"}
                    0x26 {Return "IP header does not match address in request"}
                    0x27 {Return "Kerberos version mismatch"}
                    0x28 {Return "Error type unsuppored"}
                    0x29 {Return "Checksum does not match"}
                    0x2A {Return "Packet sequence out of order, or packet is missing"}
                    0x2C {Return "Version of key not available"}
                    0x2D {Return "Key not available"}
                    0x32 {Return "Checksum not supported"}
                    0x34 {Return "Ticket too large"}
                    0x3C {Return "Generic Error"}
                    0x3D {Return "Specific field too long"}
                    0x3E {Return "Client not trusted"}
                    0x3F {Return "Server not trusted"}
                    0x40 {Return "Invalid signature"}
                    0x41 {Return "Encryption to weak"}
                    0x42 {Return "User to user authorization is required"}
                    0x43 {Return "No TGT available"}
                    0x44 {Return "Incorrect domain or principal"}
                    {($_ -ge 0x1 -and $_ -le 0x5) -or $_ -eq (0x11, 0x13, 0x15, 0x16, 0x1A, 0x1D, 0x2E, 0x2F, 0x31, 0x33, 0x30)} { Return "Weird: $_"}
                    Default { Return "Extra Wierd: $_" }
                }};L="Status"}, @{E={switch ($_.ReplacementStrings[5])
                {
                    0x1 {Return "CRC - Deprecated"}
                    0x3 {Return "MD5 - Deprecated"}
                    0x11 {Return "AES128"}
                    0x12 {Return "AES256"}
                    0x17 {Return "RC4-HMAC"}
                    0x18 {Return "RC4-HMAC-EXP"}
                    Default { Return "Audit Failure" }
                }};L="Encryption Type"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits Kerberos service ticket requests.  This should only be found on Domain Controllers."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        '4770' {
            if ($eventLogs | where EventID -eq $eventID) {
                $eventLogs | where EventID -eq $eventID | Select TimeGenerated, EntryType, @{E={$_.ReplacementStrings[0]};L="User"}, @{E={$_.ReplacementStrings[2]};L="Service Name"}, @{E={switch ($_.ReplacementStrings[3])
                {
                    {$_ -match "S-1-5-\d{2}(-\d{10}){2}-\d{9}-502"} { Return "$_"}
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
                    {$_ -match "S-1-5-\d{2}(-\d{10}){2}-\d{9}-502"} { Return "$_"}
                    Default { Return "NON-STANDARD VALUE - $_" }
                }};L="Service SID"}, @{E={$_.ReplacementStrings[6]};L="Client IP"}, @{E={$_.ReplacementStrings[7]};L="Client Port"}, @{E={switch ($_.ReplacementStrings[4])
                {
                    {$_ -match "0x40810010" -or $_ -match "0x40810000" -or $_ -match "0x60810010"} { Return "Common Value: $_"}
                    Default { Return "Uncommon Value: $_" }
                }};L="Ticket Option"}, @{E={switch ($_.ReplacementStrings[5])
                {
                    0x0 {Return "Success"}
                    0x6 {Return "Username does not exist"}
                    0x7 {Return "Domain Controller server not found"}
                    0x8 {Return "Multiple DCs of same name found, failure"}
                    0x9 {Return "No master key found"}
                    0xA {Return "Client time ahead of server time"}
                    0xB {Return "Client server time mismatch"}
                    0xC {Return "Logon restriction detected"}
                    0xD {Return "Credential Delegation not authorized"}
                    0xE {Return "Encryption type not supported"}
                    0xF {Return "Checksum not supported"}
                    0x10 {Return "Smart card logon not accepted, proper certificate not found"}
                    0x12 {Return "Client revoked, likely a disabled, expired, or locked out account"}
                    0x14 {Return "TGT revoked, PKCROSS ticket expired"}
                    0x17 {Return "User's password has expired"}
                    0x18 {Return "User's password is incorrect"}
                    0x19 {Return "Pre-auth failure"}
                    0x1F {Return "Authenticator encrypted with something other than session key.  Worth investigation"}
                    0x20 {Return "Ticket Expired"}
                    0x21 {Return "Server time ahead of client time"}
                    0x22 {Return "Duplicate request"}
                    0x23 {Return "Ticket sent to wrong server"}
                    0x24 {Return "Ticket and authenticator do not match"}
                    0x25 {Return "Time difference exceeds authroized difference"}
                    0x26 {Return "IP header does not match address in request"}
                    0x27 {Return "Kerberos version mismatch"}
                    0x28 {Return "Error type unsuppored"}
                    0x29 {Return "Checksum does not match"}
                    0x2A {Return "Packet sequence out of order, or packet is missing"}
                    0x2C {Return "Version of key not available"}
                    0x2D {Return "Key not available"}
                    0x32 {Return "Checksum not supported"}
                    0x34 {Return "Ticket too large"}
                    0x3C {Return "Generic Error"}
                    0x3D {Return "Specific field too long"}
                    0x3E {Return "Client not trusted"}
                    0x3F {Return "Server not trusted"}
                    0x40 {Return "Invalid signature"}
                    0x41 {Return "Encryption to weak"}
                    0x42 {Return "User to user authorization is required"}
                    0x43 {Return "No TGT available"}
                    0x44 {Return "Incorrect domain or principal"}
                    {($_ -ge 0x1 -and $_ -le 0x5) -or $_ -eq (0x11, 0x13, 0x15, 0x16, 0x1A, 0x1D, 0x2E, 0x2F, 0x31, 0x33, 0x30)} { Return "Weird: $_"}
                    Default { Return "Extra Wierd: $_" }
                }};L="Status"}, @{E={switch ($_.ReplacementStrings[5])
                {
                    0x1 {Return "CRC - Deprecated"}
                    0x3 {Return "MD5 - Deprecated"}
                    0x11 {Return "AES128"}
                    0x12 {Return "AES256"}
                    0x17 {Return "RC4-HMAC"}
                    0x18 {Return "RC4-HMAC-EXP"}
                    Default { Return "Audit Failure" }
                }};L="Encryption Type"}, @{E={switch ($_.ReplacementStrings[6])
                {
                    0 {Return "No Pre-Authentication"}
                    2 {Return "Username/Passowrd Authentication"}
                    15 {Return "Smart Card Authentication"}
                    20 {Return "Used in KDC Referral tickets"}
                    138 {Return "Logon using Kerveros Armoring (FAST)"}
                    {$_ -eq (11, 17, 19)} {Return "Wierd"}
                }};L="Pre-Authentication Types"} | Out-GridView -Title "Information for EventID $eventID ~ There are $(($eventLogs | where EventID -eq $eventID).count) of this event.  This event audits Kerberos service ticket requests.  This should only be found on Domain Controllers."
            } else { Write-Host -ForegroundColor Yellow "No events of this EventID." }
        }
        'quit' { return $null }
        Default {
            Write-Host -ForegroundColor Red "Please enter an Event ID as defined in the Intel Matrix."
        }
    }
}
