Get-Service -Name bthserv | Restart-Service -Force

Get-ChildItem 'C:\Windows\' | Sort-Object LastWriteTime | Format-Wide

Get-Process | Export-Csv -Path 'C:\temp\processen.csv' -Delimiter ';'