# Turn off certificate warning
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false

# Install power-cli
Install-Module -Name VMware.PowerCLI -Scope AllUsers -SkipPublisherCheck

# Import power-cli module
Import-Module VMware.PowerCLI

# Define variables
$sourceDatastore = "Source Datastore"
$destinationDatastore = "Destination Datastore"
$vCenterServer = "vcenter.domain.local"
$vcenterUsername = "vcenterUsername"
$vCenterPassword = "vCenterPassword"

# Connect to vCenter Server
Connect-VIServer -Server $vCenterServer -User $vcenterUsername -Password $vCenterPassword

# Define variables
$sourceDatastore = "Source Datastore"
$destinationDatastore = "Destination Datastore"

# Get templates on the source datastore
$template_list = Get-Datastore $sourceDatastore | Get-Template

# Move the template to the new location
foreach ($template in $template_list) {
    Write-Output "Convert Template $template to VM"
    Get-Template $template | Set-Template -ToVM -Confirm:$false
    Write-Output "Moving VM to Datastore $destinationDatastore"
    get-vm $template | Move-vm -Datastore $destinationDatastore
    Write-Output "Convert $template VM to Template"
    Get-Vm $template | Set-Vm -ToTemplate -Confirm:$false
    Write-Output "$template Completed"
 }
