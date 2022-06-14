PowerShell Wrapper for Brawl Stars API

## Overview

This module is in the early phases of creation and is mostly a personal project of mine to setup some CI and publishing.

## Prerequisites

Powershell 7. Since Brawl Stars API keys are extremely long, and `Get-Credential` password field is limited to 255 characters in the GUI that appears, Powershell 7.1 gets around this limitation, so we can use Windows DPAPI.
I will probably make this compatiable with older versions of PowerShell at some point.

## Installation

Install-Module posh-brawl


### How to Setup Environment

1. Create an account and get a free Key (which stores your token) at [https://developer.brawlstars.com/](https://developer.brawlstars.com/).
2. Generate a key file using `New-BrawlKeyFile`. You can also do this manually, but this basically encrypts a file using Windows DPAPI and `Export-Clixml`.

### Establishing a Connection
Run `Connect-BrawlStars`. You can specify a keyfile or use the default one generated by New-BrawlKeyFile.
