Function Invoke-BrawlRequest {
   <#
.SYNOPSIS
   Private function that is invoked when a command is ran
.DESCRIPTION
   This essentially acts as a wrapper for an API call to the Brawl Stars API.
   It utilizes Invoke-Restmethod under the hood. This is a private function so it will not be
   available upon import.
.EXAMPLE
   Invoke-BrawlRequest -uri $uri
.PARAMETER Uri
   URI of the resource/endpoint for Brawl Stars API.
.NOTES
    https://developer.brawlstars.com/#/documentation
#>

   [CmdletBinding()]
   Param (
      [Parameter(Mandatory, ValueFromPipeline)]
      [Uri]$Uri
   )
   Begin {
      $ErrorActionPreference = "Stop"
   }
   Process {
      Write-Verbose -Message "Invoke-BrawlRequest: URI set to $URI"
      $Response = Invoke-RestMethod -Method Get -Uri $Uri -Headers $Script:headers -ContentType "application/json" -SkipHttpErrorCheck -StatusCodeVariable StatusCode
      if ($Response.Reason) {
         Write-Error -Message "$($Response.Reason),$($Response.Message),StatusCode: $StatusCode."
      }
      switch -wildcard ($URI) {
         "$Script:PlayersEndPoint/%23$PlayerTag/battlelog" { $Response.items }
         "$script:ClubsEndpoint/%23$ClubTag/members" { $Response.items }
         "$script:BrawlersEndpoint" { $Response.items }
         "$script:RankingsEndpoint*" {$Response.Items}
         Default { $Response }
      }

   }
}
