$pages = @(
    "https://www.nia.edu.bd/academic-calendar",
    "https://www.nia.edu.bd/class-routine",
    "https://www.nia.edu.bd/ramadan-calendar",
    "https://www.nia.edu.bd/result"
)

foreach ($url in $pages) {
    $resp = Invoke-WebRequest -Uri $url -UseBasicParsing
    Write-Output "=== $url ==="
    # check for empty tables or messages
    $body = $resp.Content -replace '<script[\s\S]*?</script>', '' -replace '<style[\s\S]*?</style>', ''
    $bodyText = $body -replace '<[^>]+>', ' ' -replace '\s+', ' '
    Write-Output "Snippet: $($bodyText.Substring([Math]::Max(0, [Math]::Min(500, $bodyText.Length)), [Math]::Min(300, $bodyText.Length - [Math]::Min(500, $bodyText.Length))))"
}
