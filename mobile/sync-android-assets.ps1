$webRoot = Split-Path -Parent $PSScriptRoot
$assetRoot = Join-Path $PSScriptRoot 'android\app\src\main\assets\www'
New-Item -ItemType Directory -Path $assetRoot -Force | Out-Null
Copy-Item -LiteralPath (Join-Path $webRoot 'index.html') -Destination $assetRoot -Force
Copy-Item -LiteralPath (Join-Path $webRoot 'style.css') -Destination $assetRoot -Force
Copy-Item -LiteralPath (Join-Path $webRoot 'game.js') -Destination $assetRoot -Force
$audioTarget = Join-Path $assetRoot 'audio'
New-Item -ItemType Directory -Path $audioTarget -Force | Out-Null
Get-ChildItem -LiteralPath (Join-Path $webRoot 'audio') -Filter '*.mp3' -File |
    Where-Object { $_.Name -ne 'legacy-fein-duplicate.mp3' } |
    Copy-Item -Destination $audioTarget -Force
$imageSource = Join-Path $webRoot 'assets\images'
if (Test-Path -LiteralPath $imageSource) {
    $imageTarget = Join-Path $assetRoot 'images'
    New-Item -ItemType Directory -Path $imageTarget -Force | Out-Null
    Get-ChildItem -LiteralPath $imageSource -File -Recurse | ForEach-Object {
        $relative = $_.FullName.Substring($imageSource.Length).TrimStart('\')
        $target = Join-Path $imageTarget $relative
        New-Item -ItemType Directory -Path (Split-Path -Parent $target) -Force | Out-Null
        Copy-Item -LiteralPath $_.FullName -Destination $target -Force
    }
}
