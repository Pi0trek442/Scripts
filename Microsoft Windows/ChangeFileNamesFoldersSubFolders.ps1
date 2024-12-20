# Chemin vers le dossier cible
$TargetPath = 'C:\Users\Toto\Data'

# Vérifier que le chemin existe
if (Test-Path -Path $TargetPath) {
    Write-Host "Début du processus dans : $TargetPath" -ForegroundColor Green

    # Obtenir tous les fichiers dans les sous-dossiers
    $Files = Get-ChildItem -Path $TargetPath -Recurse -File

    foreach ($File in $Files) {
        $OldName = $File.Name           # Nom actuel du fichier
        $OldPath = $File.FullName       # Chemin complet actuel

        # Vérifier si "CV candidat" est présent dans le nom
        if ($OldName -match '(?i)CV[\s._-]*candidat') {
            Write-Host "Fichier détecté pour modification : $OldPath" -ForegroundColor Yellow

            # Générer le nouveau nom
            $NewName = $OldName -replace '(?i)CV[\s._-]*candidat', 'CM'
            $NewPath = Join-Path -Path $File.DirectoryName -ChildPath $NewName

            Write-Host "Nouveau nom généré : $NewName" -ForegroundColor Cyan

            try {
                # Renommer le fichier
                Rename-Item -Path $OldPath -NewName $NewName -Force
                Write-Host "Fichier renommé avec succès : '$OldName' → '$NewName'" -ForegroundColor Green
            } catch {
                Write-Host "Erreur lors du renommage : $_" -ForegroundColor Red
            }
        } else {
            Write-Host "Fichier ignoré (ne contient pas 'CV candidat') : $OldPath" -ForegroundColor Gray
        }
    }

    Write-Host "Processus terminé : Tous les fichiers ont été analysés." -ForegroundColor Green
} else {
    Write-Host "Le chemin spécifié n'existe pas : $TargetPath" -ForegroundColor Red
}
