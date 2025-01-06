param (
    [string]$Path = "."  # Par défaut, utilise le répertoire actuel si aucun chemin n'est fourni
)

# Contrôler si le chemin spécifié existe
if (-Not (Test-Path -Path $Path)) {
    Write-Host "Le chemin spécifié '$Path' n'existe pas." -ForegroundColor Red
    exit
}

Write-Host "Recherche des fichiers avec des chemins de plus de 256 caractères dans : $Path`n" -ForegroundColor Cyan

# Récupérer tous les fichiers et dossiers récursivement
Get-ChildItem -Path $Path -Recurse -File | ForEach-Object {
    $fullPath = $_.FullName
    if ($fullPath.Length -gt 256) {
        Write-Output $fullPath
    }
} | Out-File -FilePath "TooLongPaths.txt"

Write-Host "`nRecherche terminée. Les chemins longs ont été enregistrés dans 'LongPaths.txt'." -ForegroundColor Green
