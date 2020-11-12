Function Get-Brawler {
   <#
.Synopsis
   Get list of available brawlers if not parameters are passed or get information about a specific brawler
.DESCRIPTION
   This function imports your configuration during a powershell session for use with other corresponding Posh-Brawl cmdlets.

.EXAMPLE
   Get-Brawler
.EXAMPLE
   Get-Brawler -BrawlerID 16000000
.EXAMPLE
   Get-Brawler -Search Shelly
.EXAMPLE
   16000000 | Get-Brawler
.NOTES
   https://developer.brawlstars.com/#/documentation
   GET /brawlers/{brawlerId}
   GET /brawlers


#>

   [CmdletBinding()]
   Param (
      [String]$Token = $script:Token,
      [Parameter(ValueFromPipeline)]
      [String]$BrawlerID,
      [String]$Search
   )
   Process {
      $headers = @{
         authorization = "Bearer $token"
      }
      If ($null -eq $Token) {
         Throw "`$script:token is null. Please run the function Connect-Brawl to set up your session."
      }
      If ($BrawlerID) {
         Write-Verbose "Brawler ID is set to $BrawlerID"
      }
      [String]$Uri = "$script:baseUri/$script:BrawlersEndpoint/$BrawlerID"
         If ($Search) {
            [String]$Uri = "$script:baseUri/$script:BrawlersEndpoint"
            $response = Invoke-RestMethod -Method Get -Uri $Uri -ContentType "application/json" -Headers $Headers
            Write-Verbose -Message "Search set to $Search"
            Write-Warning -Message "Search will ignore any value passed to `$BrawlerID parameter, including piped values"
            $Response = $Response.items
            $response = $response | Where-Object {$_.name -like "*$Search*"}
            return $Response
         }
         ElseIf (!($BrawlerID)) {
            $Response = Invoke-RestMethod -Method Get -Uri $Uri -ContentType "application/json" -Headers $Headers
            $Response = $Response.items
            return $Response
         }
         Else {
            $Response = Invoke-RestMethod -Method Get -Uri $Uri -ContentType "application/json" -Headers $Headers
            return $Response
         }
   }
}