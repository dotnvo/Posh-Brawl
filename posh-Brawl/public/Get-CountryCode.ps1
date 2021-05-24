Function Get-CountryCode {
    <#
.Synopsis
This function allows you to get a two letter country code from any country
.DESCRIPTION
ISO-3166 defines recognized codes for countries, subdivisions, and formerly used codes  This function allows someone to search for a country and return the Alpha-2 (two letter) or Alpha-3 Code.
.EXAMPLE
Get-CountryCode
.NOTES
    Credit for original idea and some of the base code from https://www.leedesmond.com/2018/02/powershell-get-list-of-two-letter-country-iso-3166-code-alpha-2-currency-language-and-more/
#>
    [CmdletBinding()]
    Param (
        [String]$SearchCountry,
        #For most general purposes, alpha-2 codes are used per ISO-3166.
        [ValidateSet(2, 3)]
        [int]$Alpha = 2
    )

    Begin {
        #Build out our dataset using CultureInfo and a custom powershell object to make things easily searchable
        $Cultures = [System.Globalization.CultureInfo]::
        GetCultures(
            [System.Globalization.CultureTypes]::
            SpecificCultures)


        $Obj = @()
        $Cultures | ForEach-Object {
            $DisplayNameSplit = $_.DisplayName.Split([Char[]]"()").Trim()
            $RegionInfo = New-Object System.Globalization.RegionInfo $_.name
            $Obj += [pscustomobject]@{
                Name                     = $RegionInfo.Name
                EnglishName              = $RegionInfo.EnglishName
                TwoLetterISORegionName   = $RegionInfo.TwoLetterISORegionName
                ThreeLetterISORegionName = $RegionInfo.ThreeLetterISORegionName
                Language                 = $DisplayNameSplit[0]
                Country                  = $DisplayNameSplit[1]
            }
        }
    }


    Process {
        if ($Alpha = 2) {
            Write-Verbose -Message "Alpha-2 mode engaged..."
            # Filter out the non ISO-3166 codes. Some objects returned from System.Globalization.RegionInfo do not follow the standard. Examples: Latin America, Caribbean, Europe. 
            # These aren't generally countries, despite being labeled as such from the RegionInfo object.
            $Alpha2 = $Obj | Where-Object { $_.TwoLetterISORegionName.length -le 2 }
            $Search = $Alpha2 | Where-Object { $_.Country -like "*$SearchCountry*" }
            If (!($Search)) {
                Write-Verbose -Message "`$Search is null. No results found..."
                Write-Warning "No Results found. Check your spelling, and ensure you are entering a Country. Please try again."
            } Elseif (($Search | Measure-Object).Count -gt 1) {
                Write-Verbose -Message "Multiple returns found on search. Determining if all returned items have the same country code..."
                if ((($Search | Group-Object TwoLetterISORegionName) | Measure-Object).count -eq 1) {
                    Write-Verbose -Message "Multiple returns all have same country code..."
                    return ($Search | Group-Object TwoLetterISORegionName).Name
                } Else {
                    Write-Warning "Multiple Country Codes found for search. May need to refine search if using this as part of another script"
                    return  ($Search | Group-Object TwoLetterISORegionName).Name
                }
            } Else {
                Write-Verbose -Message "Only one possibly match found in search. Returning value..."
                return $Search.TwoLetterISORegionName
            }
        }
        if ($Alpha = 3) {
            Write-Verbose -Message "Alpha-3 mode engaged..."
            # Filter out the non ISO-3166 codes. Some objects returned from System.Globalization.RegionInfo do not follow the standard. Examples: Latin America, Caribbean, Europe. 
            # These aren't generally countries, despite being labeled as such from the RegionInfo object.
            $Alpha3 = $Obj | Where-Object { $_.ThreeLetterISORegionName -match "^[A-Z]*$" }
            $Search = $Alpha3 | Where-Object { $_.Country -like "*$Country*" }
            If (!($Search)) {
                Write-Warning "No Results found. Check your spelling, and ensure you are entering a Country. Please try again."
            } Elseif (($Search | Measure-Object).Count -gt 1) {
                if ((($Search | Group-Object ThreeLetterISORegionName) | Measure-Object).count -eq 1) {
                    return ($Search | Group-Object ThreeLetterISORegionName).Name
                } Else {
                    Write-Warning "Multiple Country Codes found for search. May need to refine search if using this as part of another script"
                    return  ($Search | Group-Object ThreeLetterISORegionName).Name
                }
            } Else {
                return $Search.ThreeLetterISORegionName
            }
        }
    }
}