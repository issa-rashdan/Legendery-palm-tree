### Oppgave 1

#Skriv et program som tar en inngangsstreng og returnerer den 
#samme strengen i omvendt rekkefølge. For eksempel, hvis innput er "hello", skal output være "olleh".

#- Bruk "file.txt" som ligger i mappen "Oppgave 1"


$filePath = ".\file.txt"

if (Test-Path $filePath) {
    $lines = Get-Content $filePath

    foreach ($line in $lines) {
        $charArray = $line.ToCharArray()
        [array]::Reverse($charArray)
        $reversed = -join $charArray
        Write-Output $reversed
    }
}

else {
    Write-Host "Filen ble ikke funnet: $filePath"
}