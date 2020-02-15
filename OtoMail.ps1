# Powershell ile mail gönderme scriptidir. Örneğin her hafta birilerine standart bir mail göndermeniz gerekiyorsa görev zamanlayıcıya bu scripti ekleyebilirsiniz. 
$User = "mail hesabı" #Mail gönderecek hesap
$to = "gönderilecek kişi", "gönderilecek kişi" #Gönderilecek kişi birden fazla eklenecek ise " " içinde ve , ile ayrılmalıdır. 
$cc = "bilgiye eklenecek kişi"
$PWord = ConvertTo-SecureString -String "mail şifresi" -AsPlainText -Force #Mail şifresini convert eder.
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $PWord #Kullanıcı adını ve şifreyi "credential" değişkenine atar.
#Mail içeriğini html formatında fontunu, puntosunu, rengini, satır atlamalarını belirtecek şekilde düzenleyebilirsiniz.  
$Body = "<font face='Calibri' -size:12pt color='009ad7'> Merhaba; <br> Mail içeriğine yazılmak istenilen metin.<br><br> İyi çalışmalar.<br><br></font>"
#Mail gönderme işlemini yapar. 
Send-MailMessage -From $User -to $to -Cc $cc -Subject "Mail konusu" -Body $Body -Encoding utf8 -BodyAsHtml -smtpserver 'smtp adresi yazılacak' -port '587' -Credential $Credential