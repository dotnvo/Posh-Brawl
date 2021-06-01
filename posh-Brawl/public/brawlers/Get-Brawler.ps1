Function Get-Brawler {
   <#
.Synopsis
   Get Brawler information 
.DESCRIPTION
   Get-Brawler, simply put, returns brawler information.
.PARAMETER BrawlerID
   Part of the ParameterSet 'BrawlerID'.
.PARAMETER Name
   The Name of the Brawler.
   Part of the ParameterSet 'Name'. 
   This will use a local index to determine the ID to pass to the endpoint.
.PARAMETER All
   Part of the default ParameterSet 'All'. If no parameters are passed and no pipeline data is pass, the all parameterset is used.
   This will return all brawlers from the /brawlers endpoint.
.OUTPUTS
   Depends on the parameter set being used and what value is being returned. For most purposes, they can be accessed and used the same.
   System.Object[] is returned for ParameterSets: All
   PSCustomObject is returned for ParameterSets: BrawlerID, Name
.EXAMPLE
   Get-brawler

      id name          starPowers                                                                    gadgets
      -- ----          ----------                                                                    -------
16000000 SHELLY        {@{id=23000076; name=SHELL SHOCK}, @{id=23000135; name=BAND-AID}}             {@{id=23000255; name=FAST FORWARD}, @{id=23000288; name=CLAY PIGEONS}}
16000001 COLT          {@{id=23000077; name=SLICK BOOTS}, @{id=23000138; name=MAGNUM SPECIAL}}       {@{id=23000273; name=SPEEDLOADER}, @{id=23000319; name=SILVER BULLET}}
16000002 BULL          {@{id=23000078; name=BERSERKER}, @{id=23000137; name=TOUGH GUY}}              {@{id=23000272; name=T-BONE INJECTOR}, @{id=23000310; name=STOMPER}}
16000003 BROCK         {@{id=23000079; name=INCENDIARY}, @{id=23000150; name=ROCKET NO. 4}}          {@{id=23000245; name=ROCKET LACES}, @{id=23000316; name=ROCKET FUEL}}
16000004 RICO          {@{id=23000080; name=SUPER BOUNCY}, @{id=23000156; name=ROBO RETREAT}}        {@{id=23000246; name=MULTIBALL LAUNCHER}}
16000005 SPIKE         {@{id=23000081; name=FERTILIZE}, @{id=23000151; name=CURVEBALL}}              {@{id=23000247; name=POPPING PINCUSHION}}
16000006 BARLEY        {@{id=23000082; name=MEDICAL USE}, @{id=23000158; name=EXTRA NOXIOUS}}        {@{id=23000250; name=STICKY SYRUP MIXER}, @{id=23000293; name=HERBAL TONIC}}
16000007 JESSIE        {@{id=23000083; name=ENERGIZE}, @{id=23000149; name=SHOCKY}}                  {@{id=23000251; name=SPARK PLUG}, @{id=23000295; name=RECOIL SPRING}}
16000008 NITA          {@{id=23000084; name=BEAR WITH ME}, @{id=23000136; name=HYPER BEAR}}          {@{id=23000249; name=BEAR PAWS}, @{id=23000314; name=FAUX FUR}}
16000009 DYNAMIKE      {@{id=23000085; name=DYNA-JUMP}, @{id=23000155; name=DEMOLITION}}             {@{id=23000258; name=FIDGET SPINNER}, @{id=23000294; name=SATCHEL CHARGE}}
16000010 EL PRIMO      {@{id=23000086; name=EL FUEGO}, @{id=23000140; name=METEOR RUSH}}             {@{id=23000264; name=SUPLEX SUPPLEMENT}, @{id=23000292; name=ASTEROID BELT}}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Trimmed Response for Comment-based help~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.EXAMPLE
   Get-Brawler -BrawlerID "16000011"
            id name   starPowers                                                               gadgets
            -- ----   ----------                                                               -------
      16000011 MORTIS {@{id=23000087; name=CREEPY HARVEST}, @{id=23000154; name=COILED SNAKE}} {@{id=23000265; name=COMBO SPINNER}, @{id=23000290; name=SURVIVAL SHOVEL}}
.EXAMPLE
   Get-Brawler -Name Brock
            id name  starPowers                                                           gadgets
            -- ----  ----------                                                           -------
      16000003 BROCK {@{id=23000079; name=INCENDIARY}, @{id=23000150; name=ROCKET NO. 4}} {@{id=23000245; name=ROCKET LACES}, @{id=23000316; name=ROCKET FUEL}}
.EXAMPLE
   "El Primo" | Get-Brawler
            id name     starPowers                                                        gadgets
            -- ----     ----------                                                        -------
      16000010 EL PRIMO {@{id=23000086; name=EL FUEGO}, @{id=23000140; name=METEOR RUSH}} {@{id=23000264; name=SUPLEX SUPPLEMENT}, @{id=23000292; name=ASTEROID BELT}}
.NOTES
   https://developer.brawlstars.com/#/documentation
   GET /brawlers/{brawlerId}
   GET /brawlers
#>

   [CmdletBinding(DefaultParameterSetName = 'All')]
   Param (
      [Alias("ID", "Identifier")]
      [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'BrawlerID')]
      [ArgumentCompleter(
         {
            param($Command, $Parameter, $WordToComplete, $CommandAst, $FakeBoundParams)
            Get-BrawlerIDIndexList
         }
      )]
      [ValidateScript(
         {
            $_ -in (Get-BrawlerIDIndexList)
         }
      )]
      [String]$BrawlerID,
      [Alias("Brawler", "Hero")]
      [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName, ParameterSetName = 'Name', Position = 0)]
      [String]$Name,
      [Parameter(ParameterSetName = 'All')]
      [Switch]$All
   )
   Begin {
      If ($Script:ConnnectionComplete -ne 1) {
         Write-Error -Message "Please run Connect-BrawlStars to configure your current session." -ErrorAction Stop
      }
   }
   Process {
      Write-Verbose -Message "ParameterSetName : $($PSCmdlet.ParameterSetName)"
      switch ($PSCmdlet.ParameterSetName) {
         BrawlerID { 
            [Uri]$Uri = "$script:BrawlersEndpoint/$BrawlerID"
            Write-Verbose "Brawler ID is set to $BrawlerID"
            Invoke-BrawlRequest -URI $URI
         }
         Name {
            $Path = $Script:moduleBase + "\assets" + "\BrawlerIndex.csv"
            $BrawlerIndex = Import-Csv -Path $Path
            $BrawlerID = ($brawlerindex | Where-Object -Property Name -EQ $Name).id
            if ($BrawlerID) {
               [Uri]$Uri = "$script:BrawlersEndpoint/$BrawlerID"
               Invoke-BrawlRequest -URI $URI
            } Else {
               Write-Warning -Message "Brawler : $name not found. Confirm correct spelling of brawler and ensure the index file is updated, then try again..."
            }
         }
         All {
            [Uri]$Uri = "$script:BrawlersEndpoint"
            Invoke-BrawlRequest -Uri $Uri
         }
      }
   }
}