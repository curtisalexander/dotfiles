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


# Validate input
Write-Host "The file to link is $($file.FullName)"

# Check for json map; add to map
$binDir = Split-Path -Parent $PSCommandPath
$dotfilesDir = $binDir.Parent

$jsonDir = $binDir
$jsonFile = "dotfiles-map.json" # hard-coded for now
$jsonPath = Join-Path $jsonDir $jsonFile

Write-Host "Checking for $jsonFile within $jsonDir"

# Check if JSON file exists, if not then create it
if (-not (Test-Path -Path $jsonPath)) {
    Write-Host "Unable to find file $jsonFile within $jsonDir"
    Write-Host "Creating a new $jsonFile within $jsonDir"
    New-Item -ItemType File $jsonPath | Out-Null
}

# Read JSON file
try {
    Get-Content -Path $jsonPath | ConvertFrom-Json 
} catch {
    Write-Host "Unable to read $jsonPath as a JSON file"
    Write-Host "Please correct and re-try mkrc"
    break
}

# Move file into tag-windows directory (don't require using -t)

# Check to see if dotfile already exists

# If exists, prompt to overwrite

# If does not exist, move

# Symlink just moved file back into the target directory (derive the target directory)

