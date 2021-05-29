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
      [Parameter(Mandatory,ValueFromPipeline)]
      [Uri]$Uri
   )
   Begin {
      $ErrorActionPreference = "Stop"
      If (!($Script:ConnectionComplete -ne 1)) {
         Write-Error -Message "Missing Connection Information for Brawl Stars API" -RecommendedAction "Please run Connect-BrawlStars function to configure connection"
      }
   }
   Process {

         $Response = Invoke-RestMethod -Method Get -Uri $Uri -Headers $Script:headers -StatusCodeVariable StatusCode -ErrorAction SilentlyContinue
         switch ($StatusCode) {
            200 {
               Write-Verbose -Message  "Status Code :$StatusCode, indicating success..."
               $Response
              }
            400 {
               $StatusCode
               Write-Error -Message  "Status Code :$StatusCode, indicating bad token or no access to resource requested..."
               
              }
            403 {
               $StatusCode
               Write-Error -Message  "Status Code :$StatusCode, indicating client provided incorrect parameters for the request..."
               
              }
            404 {
               $StatusCode
               Write-Error -Message  "Status Code :$StatusCode, indicating resource not found..."

              }
            429 {
               $StatusCode
               Write-Error -Message  "Status Code :$StatusCode, rate limited..."

              }
            500 {
               $StatusCode
               Write-Error -Message  "Status Code :$StatusCode, indicating Unknown Error..."

              }
              503 {
               $StatusCode
               Write-Error -Message  "Status Code :$StatusCode, indicating API currently in maintenance..."

              }
            Default {
               Write-Error -Message  "Status Code of response unknown..."
            }
         }
   }
}




































#>