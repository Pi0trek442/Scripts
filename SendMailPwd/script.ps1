# Paramètres SMTP
$SMTPServer = "smtp.office365.com" # Serveur SMTP d'Office 365
$SMTPPort = 587                   # Port pour SMTP sécurisé
$From = "user@domain.fr"   # Adresse expéditrice
$SMTPUsername = "user@domain.fr" # Identifiants de connexion SMTP
$SMTPPassword = "MyPassword"   # Mot de passe ou mot de passe d'application

# Import destinateires depuis le CSV
$Users = Import-Csv -Path ".\user.csv"

# Parcourir chaque utilisateur et envoyer un email
foreach ($User in $Users) {
    $To = $User.Email
    $Password = $User.Password

    $Subject = "[Migration de messagerie] - Vos informations de connexion"
    $Body = @"
Bonjour,

Voici votre futur mot de passe pour acceder a votre messagerie Office 365 :
$Password

Cordialement,
John Doe
"@

    # Envoi de l'email
    Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body -SmtpServer $SMTPServer -Port $SMTPPort -UseSsl -Credential (New-Object PSCredential ($SMTPUsername, (ConvertTo-SecureString $SMTPPassword -AsPlainText -Force)))
}
