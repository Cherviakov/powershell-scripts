Write-Host "Uncompressing tarball"
Start-Process -FilePath "./docker-image.exe" -ArgumentList "-y" -Wait
Write-Host "Stopping current container"
docker stop docker-container 
Write-Host "Removing old image"
docker image rm docker-container:latest
Write-Host "Load new image from tarball"
docker load --input ./docker-image.tar
Write-Host "Starting new container"
docker run --name docker-container --rm -d docker-container:latest
Write-Host "Install script finished"
