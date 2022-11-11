# Changes the IP inside at the OS level

$nic = Get-NetAdapter | where {$_.InterfaceDescription -like "Microsoft Hyper-V*"}
Set-DnsClientServerAddress -InterfaceIndex $nic.ifIndex -ServerAddresses ("168.63.129.16")
Set-NetIPAddress -InterfaceIndex $nic.ifIndex -PrefixLength 24
New-NetIPAddress -InterfaceIndex $nic.ifIndex -IPAddress "192.168.3.2" -DefaultGateway "192.168.3.1" -PrefixLength 24 -AddressFamily IPv4
