$pages = @(
    "https://www.nia.edu.bd/history-of-nia",
    "https://www.nia.edu.bd/why-our-school-to-choose",
    "https://www.nia.edu.bd/message-from-the-chairman",
    "https://www.nia.edu.bd/message-from-the-principal",
    "https://www.nia.edu.bd/governing-body",
    "https://www.nia.edu.bd/staffs",
    "https://www.nia.edu.bd/students-list",
    "https://www.nia.edu.bd/admission-procedure",
    "https://www.nia.edu.bd/early-years-ey",
    "https://www.nia.edu.bd/primary-years-programme-pyp",
    "https://www.nia.edu.bd/middle-year-programme-myp-high-years-programme-hyp",
    "https://www.nia.edu.bd/hifzul-quraan-curriculum",
    "https://www.nia.edu.bd/student-evaluation-process",
    "https://www.nia.edu.bd/uniform-of-students",
    "https://www.nia.edu.bd/academic-calendar",
    "https://www.nia.edu.bd/class-routine",
    "https://www.nia.edu.bd/ramadan-calendar",
    "https://www.nia.edu.bd/result",
    "https://www.nia.edu.bd/about/school-history",
    "https://www.nia.edu.bd/admission-form",
    "https://www.nia.edu.bd/this-content-is-currently-under-update"
)

foreach ($url in $pages) {
    try {
        $resp = Invoke-WebRequest -Uri $url -UseBasicParsing -TimeoutSec 15
        $html = $resp.Content
        
        # Check title
        $title = ""
        if ($html -match '<title>(.*?)</title>') { $title = $matches[1].Trim() }
        
        # Check if contains under update notice or empty content container
        $hasUnderUpdate = $html -match "This content is currently under update|under update|No record found|No data found"
        $redirectUrl = ""
        if ($resp.BaseResponse.ResponseUri) {
            $redirectUrl = $resp.BaseResponse.ResponseUri.AbsoluteUri
        }
        
        Write-Output "URL: $url"
        Write-Output "Status: $($resp.StatusCode)"
        Write-Output "UnderUpdate/Placeholder: $hasUnderUpdate"
        if ($redirectUrl -and $redirectUrl -ne $url) {
            Write-Output "Redirected to: $redirectUrl"
        }
        Write-Output "---"
    } catch {
        Write-Output "URL: $url"
        Write-Output "Error: $($_.Exception.Message)"
        Write-Output "---"
    }
}
