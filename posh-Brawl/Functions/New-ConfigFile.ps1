Function New-ConfigFile {
   <#
.Synopsis
   Generate JSON file for Authentication against Supercell API
.DESCRIPTION
This function generates a Config File for use. This only need to be ran once. You can
also manually configure your file.
.EXAMPLE
   New-ConfigFile
.PARAMETER APIKEY
   This is the API Key generated from Brawl Stars. See https://developer.brawlstars.com/#/getting-started and https://developer.brawlstars.com/#/account
.PARAMETER DefaultPlayerTag
This will store a default player tag in your sessions so if you run Get-Player without any tag, it will default to this player.
.PARAMETER Path
Path Defaults to the User
.NOTES
   https://developer.brawlstars.com/#/documentation


#>

   [CmdletBinding()]
   Param (
      [Parameter(Mandatory)]
      [String]$APIKey,
      [Parameter(HelpMessage = "Enter your player tag or another player you wish to return stats on easily")]
      [String]$DefaultPlayerTag,
      [String]$Path = "$ENV:USERPROFILE\Documents"
   )
   
   $SecureAPIToken = $APIKey |  ConvertTo-SecureString -AsPlainText -Force
   $APIToken = $SecureAPIToken | ConvertFrom-SecureString
   $Config = @{
      username         = "api"
      apitoken         = $APIToken
      DefaultPlayerTag = $DefaultPlayerTag
   }


   $Config | ConvertTo-JSON | Out-File -FilePath $Path\Posh-Brawl_Config.json
   Clear-Variable -name APIKEY
}