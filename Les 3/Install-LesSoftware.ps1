<#
.SYNOPSIS
Install-LesSoftware installeert Visual Studio Code en of GitHub Desktop op de computer.
.DESCRIPTION
Installeert Visual Studio Code en Github Desktop terwijl er een paar gave dingen gebeuren
met het bijhouden van fouten en errors.
.PARAMETER vscode
Als deze parameter wordt meegegeven dan wordt Visual Studio Code niet geinstalleerd.
.PARAMETER githubdesktop
Als deze parameter wordt meegegeven dan wordt GitHub Desktop niet geinstalleerd.
.EXAMPLE
Install-LesSoftware -vscode -githubdesktop
.NOTES
Auteur: Ralph van Leeuwen
Datum: 06-03-2021
#>
param (
    [switch]$novscode = $false,
    [switch]$nogithubdesktop = $false
)

Write-Progress -Activity 'Software aan het installeren' -Status 'Instellen van wat te installeren.' -PercentComplete 0 -Id 0
# Variable waar alle te installeren software in staat.
$installs = @()
if ($novscode -eq $false){
    $installs += @{
        Name = 'Visual Studio Code';
        URL = 'https://az764295.vo.msecnd.net/stable/622cb03f7e070a9670c94bae1a45d78d7181fbd4/VSCodeUserSetup-x64-1.53.2.exe';
        Filename = 'VSCodeUserSetup-x64-1.53.2.exe';
        Arguments = '/VERYSILENT /NORESTART /MERGETASKS=!runcode'
    }
}if($nogithubdesktop -eq $false){
    $installs += @{
        Name = 'GitHub Desktop';
        URL = 'https://desktop.githubusercontent.com/releases/2.6.4-1864024f/GitHubDesktopSetup.exe';
        Filename = 'GitHubDesktopSetup.exe';
        Arguments = '-s';
    }
}

# Daadwerkelijk start van het script
Try{
    # Controleer of er al een installatie folder bestaat
    Write-Progress -Activity 'Software aan het installeren' -Status 'Bestaat de installatie folder?' -PercentComplete 2 -Id 0
    $install_available = Test-Path -Path 'C:\Install' -Verbose

    # Als er nog geen installatie folder bestaat maak deze dan aan
    Write-Progress -Activity 'Software aan het installeren' -Status 'Bestaat de installatie folder klaar?' -PercentComplete 4 -Id 0
    if ($install_available -eq $false){
        New-Item -ItemType Directory -Path 'C:\Install' -ErrorAction Stop -Verbose
        Write-Verbose "Nieuwe folder 'C:\Install' aangemaakt voor de installatie." -Verbose 
    }

    foreach ($install in $installs){
        Write-Progress -Activity 'Software aan het installeren' -Status 'De daadwerkelijke installatie' -PercentComplete 40 -Id 0
        Write-Progress -Activity $install['Name'] -Status 'Begonnen' -PercentComplete 10 -Id 1 -ParentId 0

        # Downloaden van software
        Write-Progress -Activity $install['Name'] -Status 'Downloaden van programma via URL.' -PercentComplete 20 -Id 1 -ParentId 0
        Write-Verbose 'Begonnen met download van software.' -Verbose
        $ProgressPreference = 'SilentlyContinue' 
        Invoke-WebRequest -uri $install['URL'] -OutFile "C:\install\$($install['Filename'])" -Verbose -ErrorAction Stop
        $ProgressPreference = 'Continue'  
        Write-Verbose 'Klaar met download van software.' -Verbose
        Write-Progress -Activity $install['Name'] -Status 'Downloaden van programma via URL.' -PercentComplete 50 -Id 1 -ParentId 0
        

        # Installeren van software
        Write-Progress -Activity $install['Name'] -Status 'Installeren van software.' -PercentComplete 60 -Id 1 -ParentId 0
        Write-Verbose 'Begonnen met download van software' -Verbose
        Start-Process -FilePath "C:\install\$($install['Filename'])" -ArgumentList $install['Arguments'] -Verbose -ErrorAction Stop -Wait
        Write-Verbose 'Klaar met download van software' -Verbose
        Write-Progress -Activity $install['Name'] -Status 'Klaar met installeren van software.' -PercentComplete 80 -Id 1 -ParentId 0
        
        # Verwijderen van bestand
        Write-Progress -Activity $install['Name'] -Status 'Verwijderen van installatie bestand.' -PercentComplete 85 -Id 1 -ParentId 0
        Remove-Item -Path "C:\install\$($install['Filename'])" -Verbose -ErrorAction Stop
        Write-Verbose 'Installatiebestand verwijderd.' -Verbose
        Write-Progress -Activity $install['Name'] -Status 'Installatiebestand verwijderd.' -PercentComplete 95 -Id 1 -ParentId 0

    }

    Write-Progress -Activity 'Software aan het installeren' -Status 'Klaar met installeren' -PercentComplete 90 -Id 0

}Catch{
    Write-Host 'Er is iets fout gegaan.'
}Finally{
    Write-Progress -Activity 'Software aan het installeren' -Status 'Afronding' -PercentComplete 95 -Id 0
    if ($install_available -eq $false){
        Remove-Item -Path 'C:\Install' -Force -Verbose
        Write-Verbose "Installatie folder verwijderd." -Verbose
    }
}
