#Cluster Wise Remove Snapshot Script
$cluster = $null
$snapshots = $null
$cluster = Get-Cluster | ForEach-Object {"$PSItem"}
$i=0
While($i -lt $cluster.Length){
    $snapshots = Get-cluster "$($cluster[$i])" | Get-VM | Get-Snapshot | Where-Object {$_.Created -lt (Get-Date).AddDays(-365)} | Select-Object VM, Name, Created
    Remove-Snapshot -Snapshot $snapshots -Confirm:$false -RemoveChildren
    $i++
}