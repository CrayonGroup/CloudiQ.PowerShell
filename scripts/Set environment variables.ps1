# Sets all the environment variables
$clientId = Read-Host "Client ID"
$clientSecret = Read-Host "Client Secret"
$username = Read-Host "Username"
$password = Read-Host "Password" -AsSecureString

$null = New-Item -Path "Env:\" -Name CloudiQClientId -Value $clientId -Force
$null = New-Item -Path "Env:\" -Name CloudiQClientSecret -Value $clientSecret -Force

$null = New-Item -Path "Env:\" -Name CloudiQUsername -Value $username -Force
$null = New-Item -Path "Env:\" -Name CloudiQPassword -Value(ConvertFrom-SecureString -SecureString $password -AsPlainText) -Force -OutVariable $null