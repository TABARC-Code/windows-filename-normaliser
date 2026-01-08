# TABARC-Code
param(
  [Parameter(Mandatory=$true)][string]$Path,
  [switch]$Apply
)

Add-Type -AssemblyName System.Text
$Path = (Resolve-Path -LiteralPath $Path).Path

function Normalise-Name([string]$name) {
  $n = $name.Normalize([Text.NormalizationForm]::FormKC)
  $n = $n -replace '[<>:"/\\|?*]', ' '
  $n = $n -replace '\s+', ' '
  $n = $n.Trim()
  $n = $n.TrimEnd('.',' ')
  if ($n.Length -eq 0) { $n = "unnamed" }
  $n
}

Get-ChildItem -LiteralPath $Path -Recurse -File -Force | ForEach-Object {
  $old = $_.Name
  $new = Normalise-Name $old
  if ($new -ne $old) {
    Write-Host "Rename: '$old' -> '$new'"
    if ($Apply) {
      Rename-Item -LiteralPath $_.FullName -NewName $new -ErrorAction Stop
    }
  }
}
