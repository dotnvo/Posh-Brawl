Get-ChildItem (Join-Path -Path $PSScriptRoot '*.ps1') -Recurse |
    ForEach-Object {
    Write-Verbose ("Importing sub-module {0}." -f $_.FullName)
    . $_.FullName | Out-Null
} 
Export-ModuleMember -Function '*' -Cmdlet '*' -Alias '*' -Variable '*'
