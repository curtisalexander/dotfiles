<#
.SYNOPSIS
mkrc takes over management of an rc file

.DESCRIPTION
The file selected is moved from its current location into the dotfiles repository.  Then a new symbolic link is created in the original location, linking back to the just-moved file.

A mapping of dotfiles and locations is added to the dotfiles-map.json file.

.PARAMETER file
The dotfile to manage

.EXAMPLE
mkrc -file "C:\Users\myusername\.npmrc"

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
                throw "The file $_ does not exist."
            }
            if (Test-Path -Path $_ -PathType Container) {
                throw "The file parameter must be a file and not a directory."
            }
            return $true
        })]
    [System.IO.FileInfo]$file
)


Write-Host "The file to link is $file"