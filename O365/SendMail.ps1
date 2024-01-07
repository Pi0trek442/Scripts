# Create a "password.txt" file containing the mailbox password in the same folder
$User = "john@contoso.fr"
$File = "C:\chemin\du\fichier\password.txt"
$cred=New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, (Get-Content $File | ConvertTo-SecureString -AsPlainText -Force)
$EmailTo = "piotrek@fabrikam.fr"
$EmailFrom = "john@contoso.fr"
$Subject = "Mail test piece jointe"
$Body = "Ceci est un mail de test"
$SMTPServer = "outlook.office365.com"
$filenameAndPath ="C:\Users\piotrek\My\attachment\harley.png"
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 587)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($cred.UserName, $cred.Password);
$SMTPClient.Send($SMTPMessage)
