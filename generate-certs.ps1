try {
  $path="C:\Program Files\target"
  $subj="/C=US/ST=NY/L=NewYork/O=LocalHost-Certificates/CN=localhost"
  openssl genrsa -out "$path\rootCA.key" 4096
  openssl req -x509 -new -nodes -key "$path\rootCA.key" -sha256 -days 365 -out "$path\rootCA.crt" -subj "$subj"
  openssl req -new -nodes -newkey rsa:4096 -keyout "$path\server.key" -out "$path\server.csr" -subj "$subj"
  openssl x509 -req -sha256 -CA "$path\rootCA.crt" -CAkey "$path\rootCA.key" -CAcreateserial -days 365 -in "$path\server.csr" -signkey "$path\server.key" -out "$path\server.crt"
} catch {
  Write-Host "Error happend"
  $err = $_.Exception
  Write-Host $err.Message
}
