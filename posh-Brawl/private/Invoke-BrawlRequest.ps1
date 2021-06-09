Function Invoke-BrawlRequest {
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
    https://developer.brawlstars.com/#/documentation
#>

   [CmdletBinding()]
   Param (
      [Parameter(Mandatory, ValueFromPipeline)]
      [Uri]$Uri
   )
   Begin {
      $ErrorActionPreference = "Stop"
      If (!($Script:ConnectionComplete -ne 1)) {
         Write-Error -Message "Missing Connection Information for Brawl Stars API" -RecommendedAction "Please run Connect-BrawlStars function to configure connection"
      }
   }
   Process {
      $Response = Invoke-RestMethod -Method Get -Uri $Uri -Headers $Script:headers -ContentType "application/json" -SkipHttpErrorCheck -StatusCodeVariable StatusCode
      if ($Response.Reason) {
         Write-Error -Message "Error Occured : $($Response.Reason) , $($Response.Message), StatusCode: $StatusCode."
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