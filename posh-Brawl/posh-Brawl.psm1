

# Module Variables

Resolve-Path "$PSScriptRoot\Variables\*.ps1" -ErrorAction Ignore | ForEach-Object { . $_.ProviderPath }


# Module Functions

Resolve-Path "$PSScriptRoot\Functions\Public\*.ps1" -ErrorAction Ignore | ForEach-Object{ . $_.ProviderPath }
Resolve-Path "$PSScriptRoot\Functions\Private\*.ps1" -ErrorAction Ignore | ForEach-Object{ . $_.ProviderPath }

#Auto Completers

Resolve-Path "$PSScriptRoot\ArgumentCompleters\*.ps1" -ErrorAction Ignore | ForEach-Object{ . $_.ProviderPath }




$WarningMessage = @"
No credential  files found in Config directory : $Script:ConfigBase\{0}. Please run New-BrawlConfig
to generate credentials, or manually do so using Get-Credential. The Variable must be saved
by using Export-CLIXML to the Keys directory with a .SECRET extension. You can also manually specify a credential when using
Connect-BrawlStars
"@ -f "Keys"


if (-not (Test-Path $Script:KeysDirectory)) {
    Write-Warning -Message "Creating Keys directory..."
    New-Item -Name Keys -ItemType Directory -Path $Script:ConfigBase -Force
}
if (-not (Test-Path "$Script:ConfigDirectory")) {
    Write-Warning -Message "Creating Configs directory..."
    New-Item -Name Configs -ItemType Directory -Path $Script:ConfigBase -Force
}

If (-not (Get-ChildItem -Path $Script:KeysDirectory\* -Include *.Secret -ErrorAction SilentlyContinue)) {
    Write-Warning -Message $WarningMessage
}

