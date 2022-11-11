Install-Module -name PackageManagement -force -skippublishercheck
Update-Module -name PackageManagement
Install-Module -name PowershellGet -force -SkipPublisherCheck
Update-Module -name PowershellGet

#turn off certificate warning
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
#install power-cli
Install-Module -Name VMware.PowerCLI -Scope AllUsers
#update power-cli
Update-Module -Name VMware.PowerCLI
#uninstall power-cli
Uninstall-Module -Name VMware.PowerCLI