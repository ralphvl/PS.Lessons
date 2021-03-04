Try{
    # Controleer of er al een installatie folder bestaat
    $install_available = Test-Path -Path 'C:\Install' -Verbose

    # Als er nog geen installatie folder bestaat maak deze dan aan
    if ($install_available -eq $false){
        New-Item -ItemType Directory -Path 'C:\Install' -ErrorAction Stop -Verbose
    }

    # Downloaden van programma
    $ProgressPreference = 'SilentlyContinue'  # Voor snel downloaden progress uitzetten
    Invoke-WebRequest -Uri 'https://desktop.githubusercontent.com/releases/2.6.4-1864024f/GitHubDesktopSetup.exe' -OutFile 'C:\Install\GitHubDesktopSetup.exe' -ErrorAction Stop
    $ProgressPreference = 'Continue' # Weer progress naar normaal zetten

    # Het daadwerkelijk installeren
    Start-Process -FilePath 'C:\Install\GitHubDesktopSetup.exe' -ArgumentList '\s' -Verbose
}Catch{
    Write-Host 'Er is iets fout gegaan tijdens de installatie.' -BackgroundColor 'Red'
}Finally{
    # Installatie bestand verwijderen
    Remove-Item -Path 'C:\Install\GitHubDesktopSetup.exe' -Verbose

    if ($install_available -eq $false){
        Remove-Item -Path 'C:\Install' -Verbose
    }
}
