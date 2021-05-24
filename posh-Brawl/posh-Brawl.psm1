$Script:moduleBase = $PSScriptRoot

Get-ChildItem -Path $PSScriptRoot\public\*.ps1, $PSScriptRoot\private\*.ps1 -Recurse -ErrorAction SilentlyContinue |
ForEach-Object {
    . $_.FullName
}
