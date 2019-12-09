<#
.SYNOPSIS
rcup symlinks all files from the tag-windows directory to the user's home directory

.DESCRIPTION
All windows dotfiles are kept separately within the 'tag-windows' directory.  This is different than how the rcup command from rcm works (it symlinks all files within the root of the dotfiles directory).

The symlinks are created in the user's $HOME directory.

.PARAMETER dotfilesDir 
Root directory of dotfiles

.EXAMPLE
rcup -dotfilesDir "C:\code\dotfiles"

.LINK

.NOTES
Author: Curtis Alexander
#>

[CmdletBinding()]
Param(
    [Parameter(Mandatory = $true)]
    [string]$dotfilesDir
)

Write-Host "The dotfilesDir is $dotfilesDir"