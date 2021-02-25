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

# Formateren van het een en ander
Get-Command -Verb Format | Select-Object Name


# Ophalen van object commapndo's
Get-Command -Module Microsoft.PowerShell.Utility | Where-Object {$_.Name -like "*Object"} | Select-Object Name


# Paar voorbeelden
Get-Service | Where-Object {$_.Status -eq 'Running'}
Get-Service | Group-Object Status
Get-Service | Sort-Object Status
Get-Service | Measure-Object

# Ophalen van object commapndo's
Get-Command -Module Microsoft.PowerShell.Utility | Where-Object {$_.Name -like "*Out*"} | Select-Object Name


# Iets meer over variables
$service = Get-Service
$path = 'C:\Temp'
$nummers = '7, 8, 9, 10'

# Voorbeeld
Get-ChildItem -Path $path

# Firewall disablen
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False


# Restarten van PC
Restart-Computer -Computername 'Client1.school.local' -Credential (Get-Credential) -Force

# Remote commands
Enter-PSSession -ComputerName 'Client1.school.local' -Credential (Get-Credential) 
Get-Service
Get-ComputerInfo
exit    

# Invoke commands
Invoke-Command -ComputerName 'Client1.school.local'  -Credential (Get-Credential) -ScriptBlock {Get-Service}


