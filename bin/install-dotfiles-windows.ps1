<#
.SYNOPSIS
Install-DotFiles-Windows installs dotfiles, as well as custom PowerShell scripts, on a Windows machine

.DESCRIPTION
Dotfiles are symlinked into the user's home directory (using the $HOME environment variable).

PowerShell scripts are also symlinked into a bin directory and the directory is added to the user's path (using the user $PATH environment variable).

Two key scripts that are utlized (which mimic functionality from rcm):
- rcup.ps1
- mkrc.ps1

.PARAMETER dotfilesDir 
Directory of dotfiles

.EXAMPLE
Install-DotFiles-Windows -dotfilesDir "C:\code\dotfiles"

.NOTES
Author: Curtis Alexander
#>

[CmdletBinding()]
Param(
    [Parameter(Mandatory = $true)]
    [string]$dotfilesDir
)

Write-Host "The dotfilesDir is $dotfilesDir"