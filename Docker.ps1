# Find the IP address of the WSL instance
$ipfind = wsl ip address show eth0 | Select-String -Pattern '\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b' | wsl awk '{print $2}'
$ip = $ipfind.split(" ",[System.StringSplitOptions]::RemoveEmptyEntries)[1].split("/")[0]
# Start dockerd
wsl sudo dockerd -H $ip
# Set the DOCKER_HOST Environment Variable for the User. This can be changed to system, but would require admin rights.
$docker = "tcp://${ip}:2375"
[System.Environment]::SetEnvironmentVariable('DOCKER_HOST', $docker, [System.EnvironmentVariableTarget]::User)
