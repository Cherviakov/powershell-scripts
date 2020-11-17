function Convert-StringToBase64 ($String) {
  return [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($String))
}

$user = "user"
$password = "password"
$auth = Convert-StringToBase64 "${user}:${password}"
Write-Host $auth
