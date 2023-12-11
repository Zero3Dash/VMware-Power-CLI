# Define variables
$sourceDatastore = "Source Datastore"
$destinationDatastore = "Destination Datastore"

# Get templates on the source datastore
$template_list = Get-Datastore $sourceDatastore | Get-Template

# Move the template to the new location
foreach ($template in $template_list) {
    Write-Output "convert template  $template to vm"
    Get-Template $template | Set-Template -ToVM -Confirm:$false
    Write-Output "Move-vm to Datastore $destinationDatastore"
    get-vm $template | Move-vm -Datastore $destinationDatastore
    Write-Output "convert $template vm to template"
    Get-Vm $template | Set-Vm -ToTemplate -Confirm:$false
    Write-Output "done"
 }
