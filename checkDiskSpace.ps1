# Displays total size and freespace of drives
# call with .\CheckDiskSpace.ps1

#Prompt for remote computer name or enter localhost
$remote_computer = Read-Host "Computer Name"


Get-WmiObject Win32_LogicalDisk -ComputerName $remote_computer -Filter DriveType=3 | Select-Object DeviceID, @{'Name'='Size (GB)'; 'Expression'={[math]::truncate($_.size / 1GB)}}, @{'Name'='Freespace (GB)'; 'Expression'={[math]::truncate($_.freespace / 1GB)}}
