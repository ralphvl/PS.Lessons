# Registreren van Microsoft Signature key, registreren van microsoft redhat repo en repo's updaten
Register the Microsoft signature key
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
curl https://packages.microsoft.com/config/rhel/7/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo
sudo dnf check-update

# Installeren van dependency
sudo dnf install -y compat-openssl10

# De daadwerklijke install van PowerShell
sudo dnf install -y powershell

# Starten van PowerShell
pwsh