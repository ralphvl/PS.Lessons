# Start-Service via pipe aan Get-Service
Get-Service -Name 'SNMP' | Start-Service

# Stop-Service via tussen haakjes
Stop-Service -Name (Get-Service -Name 'SNMP').Name

# Start service maar piped vanuit een variablen
$service = Get-Service -Name 'SNMP'
$service | Start-Service

# Leuke oneliner
Get-CimClass -ClassName *disk* | Where-Object {$_.CimClassName -like "Win32_*"} | Where-Object {$_.CimClassMethods.Count -gt 1} | Sort-Object -Property CimClassName -Descending | Select-Object CimClassName, CimClassMethods -First 5 | Format-List

Get-CimClass -ClassName *disk* | 
 Where-Object {$_.CimClassName -like "Win32_*"} | 
 Where-Object {$_.CimClassMethods.Count -gt 1} | 
 Sort-Object -Property CimClassName -Descending | 
 Select-Object CimClassName, CimClassMethods -First 5 | 
 Format-List  

# Kan zelfs tussen paramerers door
Install-ADDSForest -CreateDnsDelegation:$false `
    -DatabasePath 'C:\Windows\NTDS' `
    -DomainMode '7' `
    -DomainName 'studie.local' `
    -ForestMode '7' `
    -InstallDns:$true `
    -LogPath “C:\Windows\NTDS” `
    -NoRebootOnCompletion:$false `
    -SysvolPath “C:\Windows\SYSVOL” `
    -Force:$true -Verbose