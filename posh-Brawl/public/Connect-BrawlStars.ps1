Function Connect-BrawlStars {
   <#
.Synopsis
   Setup to use Brawl API in POSH
.DESCRIPTION
This function imports your configuration during a powershell session for use with other corresponding Posh-Brawl cmdlets.

.EXAMPLE
   Connect-BrawlStars -ConfigPath .\Config.json
.NOTES
   https://developer.brawlstars.com/#/documentation


#>

   [CmdletBinding()]
   Param (
      [String]$ConfigPath = (Get-Module posh-brawl | Select-Object -ExpandProperty ModuleBase) + "\Config.json",
      [String]$KeyRootPath = (Get-Module posh-brawl | Select-Object -ExpandProperty ModuleBase) + "\Keys"
   )

   Begin {
      $Config = Get-Content $ConfigPath | ConvertFrom-Json
      $script:KeyFiles = $Config.Credentials
      $PreferredKeyFile = ($script:KeyFiles | Where-Object -Property Preferred -EQ "True" | Select-Object -ExpandProperty Filename)
      $script:baseUri = "https://api.brawlstars.com/v1"
      $script:PlayersEndPoint = "players"
      $script:ClubsEndpoint = "clubs"
      $script:RankingsEndpoint = "rankings"
      $script:BrawlersEndpoint = "brawlers"
      $script:DefaultPlayerTag = $Config.Defaults.DefaultPlayerTag
   }
   Process {
      If ($PreferredKeyFile.Count -eq 1) {
         $KeyFile = Get-ChildItem -Path $KeyRootPath\$PreferredKeyFile -ErrorAction SilentlyContinue
      } Else {
         throw "Multiple KeyFiles have preferred value of 'True'. Update your JSON file and try again"
      }

      If ($KeyFile) {
         Write-Verbose -Message "$Keyfile"
         $Creds = Import-Clixml -Path $KeyFile
         $Token = $creds.Password | ConvertFrom-SecureString -AsPlainText
         $Script:headers = @{
            authorization = "Bearer $token"
         }
         Invoke-RestMethod -Method Get -Uri $BaseURI -Headers $Script:headers -StatusCodeVariable StatusCode | Out-Null
         if ($StatusCode -eq "200") {
            Write-Host "Connection Successful. $($Creds.Username) contains a valid token"
            $Config
         } Else {
            $statuscode
         }
      } Else {
         Write-Verbose -Message "`$KeyFile is empty."
      }
   }
}