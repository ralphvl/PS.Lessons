# Voorbereiding

# Installeer 2 Windows Servers zorgt dat de servers met elkaar connectiviteit hebben.
# Noem de eerste server DC01
# Noem de tweede server Client1
# Installeer op DC01 ADDS en configureer deze met het domein school.local
# Zet op Client1 de firewall uit met het onderstaande commando (admin PowerShell)
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False