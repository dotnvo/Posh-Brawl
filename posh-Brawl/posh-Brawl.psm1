$Script:moduleBase = $PSScriptRoot
$Script:AssetsDir = "$Script:moduleBase\assets"
$Script:GameFiles = "$Script:moduleBase\assets\gamefiles"
$Script:Regions = "$Script:GameFiles\regions.csv"
$script:baseUri = "https://api.brawlstars.com/v1"
$script:PlayersEndPoint = "$script:baseUri/players"
$script:ClubsEndpoint = "$script:baseUri/clubs"
$script:RankingsEndpoint = "$script:baseUri/rankings"
$script:BrawlersEndpoint = "$script:baseUri/brawlers" 

Get-ChildItem -Path $Script:PSScriptRoot\public\*.ps1, $PSScriptRoot\private\*.ps1 -Recurse -ErrorAction SilentlyContinue |
ForEach-Object {
    . $_.FullName
}



$WarningMessage = @"
No configuration (JSON) files found in Default directory : $Script:moduleBase\{0}. 
Please run New-BrawlConfig or manually specify a properly formatted config file when running Connect-BrawlStars
"@ -f "Configs"
$WarningMessage2 = @"
No credential  files found in Default directory : $Script:moduleBase\{0}. Please run New-BrawlConfig
to generate credentials, or manually do so using Get-Credential. The Variable must be saved
by using Export-CLIXML to the Keys directory with a .SECRET extension. You can also manually specify a credential when using
Connect-BrawlStars
"@ -f "Keys"


if (!(Test-Path "$Script:moduleBase\Keys")) {
    Write-Warning -Message "Creating Keys directory..."
    New-Item -Name Keys -ItemType Directory -Path $Script:moduleBase -Force
}
if (!(Test-Path "$Script:moduleBase\Configs")) {
    Write-Warning -Message "Creating Configs directory..."
    New-Item -Name Configs -ItemType Directory -Path $Script:moduleBase -Force
}
$Script:KeysDirectory = "$Script:moduleBase\Keys"
$Script:DefaultKeyFile = "$Script:KeysDirectory\Default.secret"
$Script:ConfigDirectory = "$Script:moduleBase\Configs"
$Script:DefaultConfig = "$Script:moduleBase\Configs\Default.json"

If (!(Get-ChildItem -Path $Script:moduleBase\Configs\* -Include *.JSON)) {
    Write-Warning -Message $WarningMessage
}

If (!(Get-ChildItem -Path $Script:moduleBase\Keys\* -Include *.Secret)) {
    Write-Warning -Message $WarningMessage2
}

