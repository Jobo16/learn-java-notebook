param(
    [Parameter(Mandatory=$false)]
    [string]$Tag = 'java'
)

$root = Split-Path -Parent $PSScriptRoot
$files = Get-ChildItem -Path $root -Recurse -File -Filter *.md
$results = foreach ($file in $files) {
    $lines = Get-Content -Path $file.FullName -TotalCount 20
    $titleMatch = $lines | ForEach-Object { [regex]::Match($_, '^title:\s*(.+)$') } | Where-Object { $_.Success } | Select-Object -First 1
    $tagsMatch = $lines | ForEach-Object { [regex]::Match($_, '^tags:\s*\[(.+)\]') } | Where-Object { $_.Success } | Select-Object -First 1
    $tags = @()
    if ($tagsMatch) {
        $tags = $tagsMatch.Groups[1].Value.Split(',') | ForEach-Object { $_.Trim() }
    }
    if ($tags -contains $Tag) {
        $titleText = if ($titleMatch) { $titleMatch.Groups[1].Value.Trim() } else { [System.IO.Path]::GetFileNameWithoutExtension($file.Name) }
        $relPath = $file.FullName.Substring(($root + [System.IO.Path]::DirectorySeparatorChar).Length)
        [PSCustomObject]@{Title=$titleText; Path=$relPath; Tags=($tags -join ', ')}
    }
}

if (-not $results) {
    Write-Host "No notes tagged with '$Tag'."
} else {
    $results | Sort-Object Title | Format-Table -AutoSize
}
