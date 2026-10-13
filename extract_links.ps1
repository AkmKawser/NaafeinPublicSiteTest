$path = 'C:\Users\user\.gemini\antigravity\brain\0b8905e6-8fd1-4de0-a84c-a8bd4afa08bc\.system_generated\steps\9\content.md'
$text = Get-Content $path -Raw
$matches = [regex]::Matches($text, 'href="(https?://(?:www\.)?nia\.edu\.bd/[^"#\s]*)"')
$urls = @()
foreach ($m in $matches) {
    $urls += $m.Groups[1].Value
}
$urls = $urls | Sort-Object -Unique
$urls | Out-File -FilePath 'links.txt'
$urls
