Function New-BrawlConfig {
<#
.SYNOPSIS
   Short description
.DESCRIPTION
   Long description
.EXAMPLE
   PS C:\> <example usage>
   Explanation of what the example does
.INPUTS
   Inputs (if any)
.OUTPUTS
   Output (if any)
.NOTES
   General notes
#>

   [CmdletBinding()]
   Param (
      [Parameter(Mandatory)][ValidatePattern('^#[0289PYLQGRJCUV]{8,10}$')]
      [String]$DefaultPlayerTag,
      [String]$ConfigFile = "$Script:DefaultConfig",
      [Parameter(Mandatory)]
      [String]$BrawlerName,
      [Parameter()][ValidatePattern('^[A-Za-z]{2}$')]
      [String]$CountryCode = ($Regions | Where-Object -Property DisplayName -EQ ((Get-Culture | Select-Object -ExpandProperty DisplayName).Split([char[]]"()"))[1]).Name,
      [Switch]$GenerateKeyFile

   )

   Begin {
      $Regions = Import-CSV $Script:Regions | Where-Object {($_.Name).length -eq 2} | Select-Object Name, DisplayName | Sort-Object DisplayName
      If (!($CountryCode)) {
      } Else {
         $CountryCode.ToUpper()
         If (!($Regions | Where-Object -Property Name -EQ $CountryCode)) {
            Write-Warning -Message "Country Code invalid. It won't be written to configuration file. [Optional]: Manually update Config file : $ConfigFile."
            Clear-Variable $CountryCode
         }
      }
   }
   Process {
      if ($GenerateKeyFile) {
         $CredentialInfo = New-BrawlKeyFile
      }
      $Properties = [ordered]@{
         Defaults        = [Array][ordered]@{
            DefaultPlayerTag = $DefaultPlayerTag
            DefaultCountry   = $CountryCode
         }
         Credentials     = [Array][ordered]@{
            FileName    = $CredentialInfo.FileName
            Description = $CredentialInfo.Description
         }
         FavoritePlayers = [Array][ordered]@{
            PlayerTag  = $DefaultPlayerTag
            PlayerName = $BrawlerName
         }
         FavoriteClubs = [Array][ordered]@{
            ClubTag  = $null
            ClubName = $null
         }
      }
      $Config = (New-Object -TypeName PSCustomObject -Property $Properties) | ConvertTo-Json
      If (!(Test-Path -Path $ConfigFile)) {
      $Config | Out-File -FilePath $ConfigFile
      } Else {
         $Config | Out-File -FilePath "$Script:ConfigDirectory\Config-$(Get-date -Format FileDateTime).json"
      }
   }
}