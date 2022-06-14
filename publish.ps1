$ModulePath = "$PSScriptRoot\output\Posh-Brawl"
Publish-Module -Path $ModulePath -NuGetApiKey $Env:APIKEY -Verbose
