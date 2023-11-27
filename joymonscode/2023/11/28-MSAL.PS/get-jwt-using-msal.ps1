Import-Module -Name MSAL.PS

# Get the certificate your way. Below is reading from Windows certificate store.
$cert = Get-Item -Path 'Cert:\LocalMachine\My\<YOUR THUMBPRINT>'
$creds = @{
    'TenantId'          = '<YOUR TENANT ID>'
    'ClientId'          = '<YOUR CLIENT DI'
    'Scope'             = '<YOUR SCOPE>/.default'
    'ClientCertificate' = $cert
}
# The scope differs resource by resource. For Azure SQL it can be https://database.windows.net/.default
Get-MsalToken @creds