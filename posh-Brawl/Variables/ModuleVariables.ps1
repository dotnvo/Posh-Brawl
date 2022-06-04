#Module base and region files
$Script:moduleBase = (Resolve-Path -Path "$PSScriptRoot\..").Path
$Script:Regions = "$Script:moduleBase\bin\regions.csv"

#API Endpoints
$script:baseUri = "https://api.brawlstars.com/v1"
$script:PlayersEndPoint = "$script:baseUri/players"
$script:ClubsEndpoint = "$script:baseUri/clubs"
$script:RankingsEndpoint = "$script:baseUri/rankings"
$script:BrawlersEndpoint = "$script:baseUri/brawlers"

# Config
$Script:ConfigBase = "$env:USERPROFILE\documents\.posh-brawl"
$Script:KeysDirectory = "$Script:ConfigBase\Keys"
$Script:DefaultKeyFile = "$Script:KeysDirectory\Default.secret"
$Script:ConfigDirectory = "$Script:ConfigBase\Configs"
$Script:DefaultConfig = "$Script:ConfigBase\Configs\Default.json"
