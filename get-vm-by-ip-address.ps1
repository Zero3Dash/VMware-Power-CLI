#get a single vm by ip address
Get-VM * | where-object{$_.Guest.IPAddress -match "[[ip-address]]"}
#
#get multiple vm's using part of an ip address
#i.e. 192.168.
$vmIP="[[part-of-ip-address]]"
Get-VM * | where-object{$_.Guest.IPAddress -match $vmIP}|Select-Object Name, VMHost, PowerState,@{N="IP Address";E={@($_.guest.IPAddress[0])}} ,@{N="OS";E={$_.Guest.OSFullName}},@{N="Hostname";E={$_.Guest.HostName}}|Format-Table