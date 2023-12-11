#--------------------------------------------------------------------------
# Tested on vCenter x.x.x
#--------------------------------------------------------------------------

# Import power-cli module
Import-Module -Name VMware.PowerCLI

# Connect to vCenter Server
Connect-VIServer -Server vcenterserver -Protocol https -User 'username@domain.local' -Password 'password'

# Define variables
$sourceDatastore = "Source Datastore"
$destinationDatastore = "Destination Datastore"
$templateName = "Template Name"

# Get the template
$template = Get-Template -Name $templateName

# Get the source and destination datastores
$sourceDs = Get-Datastore -Name $sourceDatastore
$destinationDs = Get-Datastore -Name $destinationDatastore

# Get the template's current location
$templateLocation = $template | Get-View | Select-Object -ExpandProperty Config | Select-Object -ExpandProperty LocationId

# Build the new template location
$newTemplateLocation = $templateLocation
$newTemplateLocation.destination = $destinationDs.ExtensionData.MoRef

# Move the template to the new location
Move-Template -Template $template -Datastore $destinationDs

# Disconnect from vCenter Server
Disconnect-VIServer -Confirm:$false
