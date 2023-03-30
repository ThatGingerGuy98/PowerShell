if ($eventLogs) {} else {
    #Get-EventLog -LogName whatever lol idk
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
        'quit' { return $null }
        Default {
            Write-Host -ForegroundColor Red "Please enter an Event ID as defined in the Intel Matrix."
        }
    }
}
