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
New-Item -ItemType File -Path "C:\test" -Name "bestand1.txt"
New-Item -ItemType File -Path "C:\test" -Name "bestand2.txt"
Get-ChildItem -Path "C:\test"