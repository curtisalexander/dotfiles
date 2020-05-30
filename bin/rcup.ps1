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
https://github.com/curtisalexander/dotfiles

.LINK
https://github.com/thoughtbot/rcm

.NOTES
PowerShell Author: Curtis Alexander

Original API and Concept: thoughtbot
#>

[CmdletBinding()]
Param(
    [Parameter(Mandatory = $true)]
    [ValidateScript( {
            if (-not (Test-Path -Path $_)) {
                throw "The dotfilesDir directory does not exist."
            }
            if (-not (Test-Path -Path $_ -PathType Container) ) {
                throw "The dotfilesDir argument must be a directory."
            }
            return $true
        })]
    [string]$dotfilesDir
)

Write-Host "The dotfilesDir is $dotfilesDir"