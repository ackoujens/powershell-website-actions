# Replaced by param .\main.ps1 -username "USERNAME" -password "PASSWORD"
#$username = "username"
#$password = "password"

# Param input definition
param (
    [string]$server = "http://defaultserver",
    [Parameter(Mandatory=$true)][string]$username,
    [string]$password = $( Read-Host "Input password, please" )
 )

# IE Config
$ie = New-Object -com InternetExplorer.Application
$ie.visible=$True

# Login
$ie.navigate("http://mfm.mobitel.be/account/login.aspx")
while($ie.ReadyState -ne 4) {start-sleep -Seconds 1}
$ie.document.getElementById("MainContent_LoginUser_UserName").value= "$username"
$ie.document.getElementById("MainContent_LoginUser_Password").value = "$password"
$ie.document.getElementById("MainContent_LoginUser_LoginButton").click()

# Navigate to main page
$ie.navigate("http://mfm.mobitel.be/employees.aspx");