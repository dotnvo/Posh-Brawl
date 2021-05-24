Function New-BrawlConfig {
   <#
.Synopsis
.DESCRIPTION
.EXAMPLE
.NOTES
#>

   [CmdletBinding()]
   Param (
      [Parameter(Mandatory)][ValidatePattern('[#0289PYLQGRJCUV]')]
      [String]$DefaultPlayerTag,
      [Parameter(Mandatory,ValueFromPipeline)]
      [String]$DefaultCountry,
      [String]$ConfigName = "Config.json"
   )

   Begin {
      If ($DefaultPlayerTag -match "^#") {
         $PlayerTag = $PlayerTag -replace "^#", ""
      }
   }
   Process {
      $Properties = [ordered]@{
         Defaults        = [Array][ordered]@{
            DefaultPlayerTag = $DefaultPlayerTag
            DefaultCountry   = $null
         }
         Credentials     = [Array][ordered]@{
            FileName    = $null
            IP          = $null
            Description = $null
            Preferred   = $null
         }
         PlayerIndex = [Array][ordered]@{
            PlayerTag  = $null
            PlayerName = $null
         }
      }
      $Config = New-Object -TypeName PSCustomObject -Property $Properties

   }
}