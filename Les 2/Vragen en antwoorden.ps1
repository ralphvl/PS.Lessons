# Voorbereiding

# Installeer 2 Windows Servers zorgt dat de servers met elkaar connectiviteit hebben.
# Noem de eerste server DC01
# Noem de tweede server Client1
# Installeer op DC01 ADDS en configureer deze met het domein school.local
# Zet op Client1 de firewall uit met het onderstaande commando (admin PowerShell)
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

# Opdracht 1: Basis commando's aan elkaar verbinden.
# Ik wil graag de bluetooth service (bthserv) ophalen en tegelijk herstarten via een pipe
Get-Service -Name bthserv | Restart-Service -Force

# Ik wil graag in een regel de items out de folder 'C:\Windows' ophalen, sorteren op LastWriteTime en formateren in een wide formaat.
Get-ChildItem 'C:\Windows\' | Sort-Object LastWriteTime | Format-Wide

# Ik wil graag  alle processen zien met ps en geef deze weer als een lijst (label-waarde).
Get-Process | Select-Object Handles, CPU, ID, ProcessName | Format-List

# Ik wil graag  alle processen zien met ps en deze exporteren naar een CSV bestand
Get-Process | Export-Csv -Path 'C:\temp\processen.csv' -Delimiter ';'

# Kan ik dit ook naar een HTML bestand exporteren
Get-Process | ConvertTo-Html | Out-File 'C:\temp\test.html'

# Opdracht 2: Remote commando's zonder sessie
# Ik wil graag client1 stoppen vanaf DC01 met een enkel remote commando
Stop-Computer -Computername 'Client1.school.local' -Credential (Get-Credential) -Force

# Welke commando's kunnen nog meer op deze manier werken? Verzin er 5
# Opdracht 3: Een remote powershell sessie opzetten
# Zet eerste een Powershell sessie op met Client1
Enter-PSSession -ComputerName 'Client1.school.local' -Credential (Get-Credential) 

# Haal vervolgens de actieve processen op op de server
Get-Process

# Sluit deze sessie weer
exit    

# Opdracht 4
# Ik wil niet constant de credentials met Get-Credential opnieuw opvragen
# Maak een nieuwe variable $credential met hierin de credentials via Get-Credential
$credential = Get-Credential

# Ik wil met deze $Credential variable de application eventlog opvragen via Invoke-Command
Invoke-Command -ComputerName 'Client1.school.local'  -Credential (Get-Credential) -ScriptBlock {Get-EventLog -LogName Application}
