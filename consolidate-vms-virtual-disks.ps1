#some text
Get-VM | Where-Object {$_.Extensiondata.Runtime.ConsolidationNeeded}
Get-VM | Where-Object {$_.Extensiondata.Runtime.ConsolidationNeeded} | ForEach-Object {$_.ExtensionData.ConsolidateVMDisks_Task()}
#some text