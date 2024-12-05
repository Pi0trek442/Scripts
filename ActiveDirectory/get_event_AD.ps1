# Configuration
$LogFile = "C:\AD_Report_$(Get-Date -Format 'yyyy-MM-dd').txt"
#$EmailRecipient = "admin@example.com"
#$SMTPServer = "smtp.example.com"

# Initialisation du rapport
$ReportContent = @()

# Création de comptes utilisateurs
$CreatedUsers = Get-EventLog -LogName Security -InstanceId 4720 -After (Get-Date).AddDays(-1) | ForEach-Object {
    @{
        Action = "Création d'utilisateur"
        ObjectName = $_.ReplacementStrings[0]
        TimeGenerated = $_.TimeGenerated
    }
}

# Suppression de comptes utilisateurs
$DeletedUsers = Get-EventLog -LogName Security -InstanceId 4726 -After (Get-Date).AddDays(-1) | ForEach-Object {
    @{
        Action = "Suppression d'utilisateur"
        ObjectName = $_.ReplacementStrings[0]
        TimeGenerated = $_.TimeGenerated
    }
}

# Création d'OU
$CreatedOUs = Get-EventLog -LogName Security -InstanceId 5137 -After (Get-Date).AddDays(-1) | ForEach-Object {
    @{
        Action = "Création d'OU"
        ObjectName = $_.ReplacementStrings[0]
        TimeGenerated = $_.TimeGenerated
    }
}

# Suppression d'OU
$DeletedOUs = Get-EventLog -LogName Security -InstanceId 5141 -After (Get-Date).AddDays(-1) | ForEach-Object {
    @{
        Action = "Suppression d'OU"
        ObjectName = $_.ReplacementStrings[0]
        TimeGenerated = $_.TimeGenerated
    }
}

# Modification d'OU (ou GPO)
$ModifiedOUs = Get-EventLog -LogName Security -InstanceId 5136 -After (Get-Date).AddDays(-1) | ForEach-Object {
    @{
        Action = "Modification d'OU ou GPO"
        ObjectName = $_.ReplacementStrings[0]
        TimeGenerated = $_.TimeGenerated
    }
}

# Ajouter tous les résultats au rapport
$ReportContent += $CreatedUsers
$ReportContent += $DeletedUsers
$ReportContent += $CreatedOUs
$ReportContent += $DeletedOUs
$ReportContent += $ModifiedOUs

# Formatage et sauvegarde du rapport
$FormattedReport = $ReportContent | Sort-Object TimeGenerated | Format-Table -AutoSize | Out-String
Set-Content -Path $LogFile -Value $FormattedReport

# Envoi par email
#Send-MailMessage -From "AD_Monitor@example.com" -To $EmailRecipient -Subject "Rapport d'actions AD" -Body (Get-Content $LogFile | Out-String) -SmtpServer $SMTPServer

#Write-Host "Rapport généré et envoyé : $LogFile"
