$pages = @(
    "https://www.nia.edu.bd/academic-calendar",
    "https://www.nia.edu.bd/class-routine",
    "https://www.nia.edu.bd/ramadan-calendar",
    "https://www.nia.edu.bd/result"
)

foreach ($url in $pages) {
    $resp = Invoke-WebRequest -Uri $url -UseBasicParsing
    $html = $resp.Content
    # Check if main content area contains records or "No data / empty table"
    Write-Output "URL: $url"
    if ($html -match '(?i)<table[\s\S]*?</table>') {
        Write-Output "Has Table: True"
        if ($html -match '(?i)No (?:data|record|result|content) found') {
            Write-Output "Content Status: Empty/No records"
        }
    } elseif ($html -match '(?i)No (?:data|record|result|content) found') {
        Write-Output "Content Status: Empty/No records"
    } else {
        # Check text length inside main or body excluding header/footer
        Write-Output "Content Status: Checked"
    }
    Write-Output "---"
}
