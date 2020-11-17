$uri = 'http://127.0.0.1:3000'
$headers = @{
  'Authorization' = "Basic auth" 
}
try {
  Invoke-RestMethod -Method Get -Uri $uri
  $headers = @{
    'Authorization' = "Basic auth" 
    'Content-Type' = 'application/json'
  }
  $body = @{
    'name' = 'user'
    'roles' = @()
  }
  Invoke-RestMethod -Method Put -Headers $headers -Body ($body|ConvertTo-Json) -Uri "$uri/users"
  $headers = @{
    'Content-Type' = 'application/json'
    'Authorization' = "Basic auth" 
  }
  $body = @{
    'users' = @{
      'names' = @()
      'roles' = @()
    }
    'clients' = @{
      'names' = @('client1')
      'roles' = @('merchant')
    }
  }
  Invoke-RestMethod -Method Put -Headers $headers -Body ($body|ConvertTo-Json) -Uri $uri/organization
} catch {
  Write-Host "Error happend"
  $err = $_.Exception
  if ($err.Response) {
    $responseStream = $err.Response.GetResponseStream()
    $reader = New-Object System.IO.StreamReader($responseStream)
    $reader.BaseStream.Position = 0
    $reader.DiscardBufferedData()
    $errBody = $reader.ReadToEnd()
    Write-Host ($err.Response|ConvertTo-Json)
    Write-Host $errBody
  } else {
    Write-Host $err.Message
  }
}
