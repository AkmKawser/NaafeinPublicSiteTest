$text = Get-Content 'C:\Users\user\.gemini\antigravity\brain\0b8905e6-8fd1-4de0-a84c-a8bd4afa08bc\.system_generated\steps\9\content.md' -Raw
$matches = [regex]::Matches($text, '<a[^>]*href=["'']([^"'']+)["''][^>]*>(.*?)</a>', [System.Text.RegularExpressions.RegexOptions]::Singleline)
foreach ($m in $matches) {
    if ($m.Groups[1].Value -match "under-update") {
        Write-Output "Text: $($m.Groups[2].Value.Trim()) -> Href: $($m.Groups[1].Value)"
    }
}
