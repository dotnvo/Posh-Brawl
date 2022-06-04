properties {
    # Set this to $true to create a module with a monolithic PSM1
    $PSBPreference.Build.CompileModule = $true
    $PSBPreference.Help.DefaultLocale = 'en-US'
    $PSBPreference.Test.OutputFile = 'out/testResults.xml'
    $PSBPreference.Build.CompileDirectories = @('Enum','Classes', 'Private', 'Public', 'Variables')
    $PSBPreference.Build.CopyDirectories = @('bin', 'ArgumentCompleters', 'Variables' )
}


task Default -depends Test

task Test -FromModule PowerShellBuild -minimumVersion '0.6.1'
