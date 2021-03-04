Try{
    # Controleer of er al een installatie folder bestaat
    $install_available = Test-Path -Path 'C:\Install' -Verbose

    # Als er nog geen installatie folder bestaat maak deze dan aan
    if ($install_available -eq $false){
        New-Item -ItemType Directory -Path 'C:\Install' -ErrorAction Stop -Verbose
    }

    # Downloaden van programma
    $ProgressPreference = 'SilentlyContinue'  # Voor snel downloaden progress uitzetten
    Invoke-WebRequest -Uri 'https://az764295.vo.msecnd.net/stable/622cb03f7e070a9670c94bae1a45d78d7181fbd4/VSCodeUserSetup-x64-1.53.2.exe' -OutFile 'C:\Install\VSCodeUserSetup-x64-1.53.2.exe' -ErrorAction Stop
    $ProgressPreference = 'Continue' # Weer progress naar normaal zetten

    # Het daadwerkelijk installeren
    Start-Process -FilePath 'C:\Install\VSCodeUserSetup-x64-1.53.2.exe' -ArgumentList '\s' -Verbose
}Catch{
    Write-Host 'Er is iets fout gegaan tijdens de installatie.' -BackgroundColor 'Red'
}Finally{
    # Installatie bestand verwijderen
    Remove-Item -Path 'C:\Install\VSCodeUserSetup-x64-1.53.2.exe' -Verbose

    if ($install_available -eq $false){
        Remove-Item -Path 'C:\Install' -Verbose
    }
}
