# Download latest Docker.exe and add to path
$win_docker_ver = $(wsl basename "$(wsl curl -fsSLo /dev/null -w "%{url_effective}" https://github.com/StefanScherer/docker-cli-builder/releases/latest)")
mkdir "C:\Program Files\Docker\bin"
Invoke-WebRequest -Uri "https://github.com/StefanScherer/docker-cli-builder/releases/download/$win_docker_ver/docker.exe" -OutFile "C:\Program Files\Docker\bin\docker.exe"
[Environment]::SetEnvironmentVariable("Path", [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + "C:\Program Files\Docker\bin;", [EnvironmentVariableTarget]::Machine)
