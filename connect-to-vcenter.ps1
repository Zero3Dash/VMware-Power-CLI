#turn off sending data to vmware
Set-PowerCLIConfiguration -Scope User -ParticipateInCEIP $false
#ignore certificate warnings
Set-PowerCLIConfiguration  -InvalidCertificateAction Ignore
#import power-cli module
Import-Module VMware.PowerCLI
#connect to vcenter server
Connect-VIServer -Server [[vcenter-fqdn/ip-address]] -Protocol https -User '[[user-account]]' -Password '[[password]]'