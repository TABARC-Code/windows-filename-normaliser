# windows-filename-normaliser
Normalises filenames by: Unicode normalisation (FormKC) - replacing illegal NTFS filename characters, collapsing whitespace trimming trailing dots and spaces

# Filename Normaliser (PowerShell)

Normalises filenames by:
- Unicode normalisation (FormKC)
- replacing illegal NTFS filename characters
- collapsing whitespace
- trimming trailing dots and spaces

Default behaviour is preview only. Use `-Apply` to rename.

## Requirements

- Windows
- PowerShell 5.1 or PowerShell 7+

## Usage

Preview:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\Filename-Normaliser.ps1 -Path "C:\Data"
Apply:

powershell
Copy code
.\Filename-Normaliser.ps1 -Path "C:\Data" -Apply
### Notes
Renaming can collide if two files normalise to the same name. This script will error in that case, which is correct behaviour.
