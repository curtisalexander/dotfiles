<#
.SYNOPSIS
Install-DotFiles-Windows installs my dotfiles, as well as my custom PowerShell scripts, into my Windows machine

.DESCRIPTION
Dotfiles are symlinked into the user home directory.

PowerShell scripts are also symlinked into a bin directory and the directory is added to the user's path.

Two key scripts that are symlinked which mimic functionality from rcm:
- rcup-win.ps1
- mkrc-win.ps1

.PARAMETER dotfilesDir 
Directory of dotfiles

.EXAMPLE
Install-DotFiles-Windows -dotfilesDir "C:\Users\myusername\code\dotfiles"

.NOTES
Author: Curtis Alexander
#>

[CmdletBinding()]
Param(
    [Parameter(Mandatory = $true)]
    [string]$dotfilesDir
)

Write-Host "The dotfilesDir is $dotfilesDir"