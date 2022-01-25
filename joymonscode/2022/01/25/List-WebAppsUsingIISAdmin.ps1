function Get-WebAppsUsingIISAdmin {
    $apps = @()
    Write-Verbose "Using IISAdministration module"
    Get-IISSite | ForEach-Object {
        $site = $_
        Write-Verbose "Web Site - Name $($_.name), Apps count: $($_.Applications.Count)"
        $_.Applications | ForEach-Object {
            $app = [PSCustomObject]@{
                Path = $_.Path
                Site = $site
            }
            $apps += $app
        }
    }
    $apps
}
$webApps =  Get-WebAppsUsingIISAdmin
$webApps
