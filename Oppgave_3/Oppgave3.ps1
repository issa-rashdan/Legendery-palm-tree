#Skriv et script som lister alle filene i "Oppgave 3", inkludert undermapper,
# og teller antall filer som matcher bestemt møsnster og filtype. 

#- Filtype: "txt"
#- Mønster: "Sommer"


$folderPath = Split-Path -Parent $MyInvocation.MyCommand.Path

#Del 1: Finn og skriv ut .txt-filer med "Sommer" i filnavnet
$matchingFiles = Get-ChildItem -Path $folderPath -Recurse -Filter *.txt -File |
    Where-Object { $_.Name -like "*Sommer*" }

$countMatching = $matchingFiles.Count

Write-Host "Antall .txt-filer med 'Sommer' i navnet: $countMatching"

if ($countMatching -gt 0) {
    Write-Host "Filer funnet:"
    $matchingFiles | ForEach-Object { Write-Host $_.FullName }
} else {
    Write-Host "Ingen filer funnet som matcher 'Sommer' i navnet."
}

#Del 2: Tell antall .txt-filer per undermappe
Write-Host "Antall .txt-filer per undermappe:"

$subfolders = Get-ChildItem -Path $folderPath -Directory -Recurse

foreach ($folder in $subfolders) {
    $txtFiles = Get-ChildItem -Path $folder.FullName -Filter *.txt -File
    $count = $txtFiles.Count
    Write-Host "$($folder.FullName): $count"
}
