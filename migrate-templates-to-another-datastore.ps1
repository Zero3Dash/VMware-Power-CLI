$DS = "[[Target-DataStore-Name]]"
$template_list = get-template
foreach ($template in $template_list) {
    Write-Output "convert template  $template to vm"
    Get-Template $template | Set-Template -ToVM -Confirm:$false
    Write-Output "Move-vm to Datastore $DS"
    get-vm $template | Move-vm -Datastore $DS
    Write-Output "convert $template vm to template"
    Get-Vm $template | Set-Vm -ToTemplate -Confirm:$false
    Write-Output "done"
 }