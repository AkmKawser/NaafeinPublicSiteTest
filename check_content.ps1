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
    "https://www.nia.edu.bd/gallery",
    "https://www.nia.edu.bd/news",
    "https://www.nia.edu.bd/notices",
    "https://www.nia.edu.bd/contact-us"
)

$results = @()

foreach ($url in $pages) {
    try {
        $resp = Invoke-WebRequest -Uri $url -UseBasicParsing -TimeoutSec 15
        $html = $resp.Content
        # Check text length / placeholder indicators
        $isUnderUpdate = $html -match "under update|currently under update|No data found|Coming Soon"
        $results += [PSCustomObject]@{
            Url = $url
            Status = $resp.StatusCode
            Length = $html.Length
            UnderUpdate = $isUnderUpdate
        }
    } catch {
        $results += [PSCustomObject]@{
            Url = $url
            Status = $_.Exception.Message
            Length = 0
            UnderUpdate = $false
        }
    }
}

$results | Format-Table -AutoSize
