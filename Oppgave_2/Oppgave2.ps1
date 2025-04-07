## Oppgave 2

#Gitt arrayet i mappen "Oppgave 2", skriv et program som filtrerer ut alle oddetall og 
#returnerer en ny liste med bare partall.

#Beregn også summen av alle partall.


$filePath = "C:\Users\Admin\OneDrive\Skrivebord\Legendery-palm-tree\Oppgave_2\array.json"

if (Test-Path $filePath) {
    $json = Get-Content $filePath -Raw | ConvertFrom-Json

    $evenNumbers = $json | Where-Object { $_ % 2 -eq 0 }

    $sum = ($evenNumbers | Measure-Object -Sum).Sum

    Write-Host "Partall funnet:"
    $evenNumbers -join ", " | Write-Host

    Write-Host "Sum av partall: $sum"
}
else {
    Write-Host "Filen ble ikke funnet: $filePath"
}
