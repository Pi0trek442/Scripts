# Chemin absolu
$TargetPath = 'C:\Users\toto\Data'

# Vérifier que le chemin existe
if (Test-Path -Path $TargetPath) {
    Write-Host "Le chemin existe : $TargetPath" -ForegroundColor Green

    # Étape 1 : Renommer le dossier "Ressources Humaines" ou similaire
    $MainFolder = Get-ChildItem -Path $TargetPath -Directory | Where-Object { $_.Name -match "Ressources[.\s]*Humaines" }

    if ($MainFolder) {
        $NewMainName = "RH"
        $NewMainPath = Join-Path -Path $TargetPath -ChildPath $NewMainName
        Rename-Item -Path $MainFolder.FullName -NewName $NewMainName -Force
        Write-Host "Le dossier principal '$($MainFolder.Name)' a été renommé en '$NewMainName'." -ForegroundColor Green

        # Étape 2 : Renommer TOUS les sous-dossiers dans Ressources
        $SubFolders = Get-ChildItem -Path $NewMainPath -Directory | Where-Object { $_.Name -match '^Ressources[.\s]*Humaines\s*(\d{4})$' }

        foreach ($Folder in $SubFolders) {
            if ($Folder.Name -match '^Ressources[.\s]*Humaines\s*(\d{4})$') {
                $Year = $Matches[1]  # Capturer l'année depuis le nom
                $NewSubName = "Ressources $Year"
                Rename-Item -Path $Folder.FullName -NewName $NewSubName -Force
                Write-Host "Le sous-dossier '$($Folder.Name)' a été renommé en '$NewSubName'." -ForegroundColor Cyan
            }
        }

        Write-Host "Tous les dossiers ont été renommés avec succès !" -ForegroundColor Green
    } else {
        Write-Host "Aucun dossier 'Ressources Humaines' trouvé dans '$TargetPath'." -ForegroundColor Yellow
    }
} else {
    Write-Host "Le chemin n'existe pas : $TargetPath" -ForegroundColor Red
}
