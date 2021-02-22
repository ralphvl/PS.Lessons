# Opdracht 1: Nieuw commando om processen op te halen:
# Wat is het commando om een process in windows op te halen
Get-Process

# Wat is het commando om de standaard help pagina op te vragen van dit commando
Get-Help -Name 'Get-Process' -Online

# Ik wil nu eigelijk alleen de processen Cortana zien. Hoe doe ik dat? 
# (Kan zijn dat je geen cortana hebt op je PC, gebruik dan iets anders.)
Get-Process -Name 'cortana'

# Ik wil nu zien wat er zou gebeuren als als ik het Cortana zou stoppen via PowerShell. Maar ik wil het niet daadwerkelijk uitvoeren
# (Kan zijn dat je geen cortana hebt op je PC, gebruik dan iets anders. Let wel op dat je geen kritish Windows proces pakt en perongeluk stopt.)
Get-Process -Name 'cortana' -Whatif

# Opdracht 2: Ophalen van items
# Met de onderstaande cmdlet kan ik bestanden onder C:/Windows opvragen, maar hoe krijg ik ook alle
# items met de subfolders hierin. TIP: Gebruik het Get-Help command voor mee info over Get-ChildItem
Get-ChildItem -Path "C:\Windows"
Get-ChildItem -Path "C:\Windows" -Recurse

# Ik wil graag via PowerShell een nieuwe folder aanmaken onder het pad C:\powershellisgaaf
# In deze folder wil ik graag 2 bestanden zien met de naam bestand1.txt en bestand2.txt
# Ik wil deze 2 bestanden kunnen ophalen, maar ik wil eigelijk deze in een Format-List formaat zien.
# Dit is een totaal van 4 aparte commando's
New-Item -ItemType Directory -Path 'C:\powershellisgaaf'
New-Item -itemType File -Path 'C:\powershellisgaaf' -Name 'bestand1.txt'
New-Item -itemType File -Path 'C:\powershellisgaaf' -Name 'bestand2.txt'
Get-ChildItem -Path 'C:\powershellisgaaf' | Format-List

# Ik wil graag het bestand, dat we net hebben aangemaakt, met het pad 'C:\powershellisgaaf\bestand2.txt' hernoemen
# met met de naam bestand3.txt. Hoe doe ik dit?
Rename-Item -Path 'C:\powershellisgaaf\bestand2.txt' -NewName 'bestand3.txt'

# Hoe zorg ik dat het bovenstaande commando mij meer informatie geeft over wat er uitgevoerd wordt.
Rename-Item -Path 'C:\powershellisgaaf\bestand2.txt' -NewName 'bestand3.txt' -Verbose

# Opdracht 3: Het schrijven naar de host toe
# Ik wil graag de text: Dinsdag is nog lang geen weekend. Schrijven naar mijn host toe. Hoe doe ik dat?
Write-Host -Object "Dinsdag is nog lang geen weekend"

# Eigelijk wil ik de achtergrond kleur van deze text graag rood hebben. Hoe doe ik dat?
Write-Host -Object "Dinsdag is nog lang geen weekend" -BackgroundColor Red

# Nu wil ik graag er niet meer aan herinnerd worden dat het pas dinsdag is. Welk commando gebruik ik hiervoor?
# (Hiermee bedoel ik, leeg de console met een commando.)
Clear-Host

# Nu wil ik eigelijk zelf text kunnen invoeren. Welk commando kan ik hiervoor gebruiken?
Read-Host

# Opdracht 4: Nieuwe commando's leren.
# Pak voor de onderstaande vragen rustig google erbij

# Het ophalen van alle lokale users binnen Windows.
Get-LocalUser

# Het herstarten van mijn computer
Restart-Computer

# Het toevoegen van content aan een bestand.
Add-Content -Path 'C:\powershellisgaaf\bestand1.txt' -Value "Dinsdag is nog lang geen weekend"

