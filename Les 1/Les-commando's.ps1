# Ophalen van alle services
Get-Service

# Ophalen van de specifieke SNMP service
Get-Service -Name SNMP

# Stoppen van service (hiervoor moet je PowerShell in administrator modes openen)
Start-Service -Name SNMP
Stop-Service -Name SNMP

# Ophalen van help info van Get-Service
Get-Help -Name 'Get-Service'
Get-Help -Name 'Get-Service' -Online

# Maken van een folder
New-Item -ItemType Directory -Path "C:\test"

# Aanmaken van nieuwe items
New-Item -ItemType File -Path "C:\test" -Name "bestand1.txt"
New-Item -ItemType File -Path "C:\test" -Name "bestand2.txt"

# Ophalen van items in een folder
Get-ChildItem -Path "C:\test"

# Veel voorkomende parameters
Start-Service -Name SNMP -Verbose
Stop-Service -Name SNMP -WhatIf
Stop-Service -Name SNMP -Confirm
Stop-Service -Name SNMPFOUT -ErrorAction Ignore
New-Item -ItemType File -Path "C:\test" -Name "bestand1.txt" -Force

# Formateren van output
Get-Service | Format-Table
Get-Service | Format-List
Get-Service | Select-Object status, name
Get-Service |Where-Object {$_.status -Like "Running"}

# Nog een paar standaard dingen
Clear-Host
Write-Host "Hallo"
Read-Host