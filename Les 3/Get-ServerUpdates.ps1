<#
.SYNOPSIS
Get-ServerUpdates haalt updates en opstart tijd van server op door remote commando's
.DESCRIPTION
Eerst haalt deze functie alle commputers op die beginnen met de beginnaam. Vervolgens haalt deze
functie aantal updates en de boottime op. Vervolgens gaat de functie deze formateren en overzetten richting
een CSV bestand. 
.PARAMETER startname
Naam waar de server mee moet beginnen.
.PARAMETER outputpath
Pad (zonder bestand) waar de output naartoe moet gaan
.EXAMPLE
Get-ServerUpdates -startname 'DC' -outputpath 'C:\temp'
.NOTES
Auteur: Ralph van Leeuwen
Datum: 06-03-2021
#>
param (
    $startname,
    $outputpath
)
