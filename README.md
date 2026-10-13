# Audit & Component Analysis Report: Naafein International Academy (www.nia.edu.bd)

This repository contains an audit and assessment of pages, navigation components, and routes for **Naafein International Academy** ([https://www.nia.edu.bd/](https://www.nia.edu.bd/)).

---

## 📊 Summary of Findings

| Category | Count | Status | Summary |
|---|---|---|---|
| **Server Errors (HTTP 500)** | 1 | 🔴 Critical | Backend crash/exception when loading students list. |
| **Dead / Empty Links (`href=""`)** | 3 | 🟡 Medium | Hostel menu links with empty targets doing nothing on click. |
| **Placeholder / Under Update** | 8 | 🟡 Medium | Menu links redirecting to a generic placeholder page. |
| **Unrendered Template Syntax** | 1 | 🟡 Medium | Literal `${teacher.id}` string rendered into navigation HTML. |
| **Active & Healthy Pages** | 12+ | 🟢 Healthy | Loaded properly with complete content. |

---

## 📑 Full Detailed Audit Table

A ready-to-import CSV file is provided in this repository: [website_audit_report.csv](./website_audit_report.csv).  
You can open or import this CSV directly into **Google Sheets** via **File > Import > Upload**.

For a transcript of the inquiry, decisions, and testing process, see [CONVERSATION_HISTORY.md](./CONVERSATION_HISTORY.md).

| Component / Section | Page Title / Label | Complete URL | Issue Type | HTTP Status | Impact | Recommended Solution |
|---|---|---|---|---|---|---|
| **Academic / Students** | Students List | https://www.nia.edu.bd/students-list | Server Error | 500 Internal Server Error | Users cannot view student records; breaks user experience. | Inspect web application error log (e.g., Laravel `storage/logs/laravel.log` or database query logs). Resolve missing SQL column/table or null pointer exception. Add fallback user-friendly error page. |
| **Navigation / Staff** | Dynamic Teacher Link | https://www.nia.edu.bd/teacher/data/${teacher.id} | Template Syntax Error | 404 / Invalid Route | Produces broken links when users or bots crawl menu navigation. | Fix blade/frontend template interpolation. Ensure `${teacher.id}` is evaluated in JavaScript or Blade syntax `{{ $teacher->id }}` prior to output. |
| **Hostel** | Hostel Rules and Regulations | https://www.nia.edu.bd/ (`href=""`) | Dead / Empty Link | N/A (Empty `href`) | Desktop click does nothing; mobile redirects to home. Users cannot view hostel rules. | Create dedicated route and page `/hostel-rules`, upload hostel policy/regulations, and update menu target. |
| **Hostel** | House Master | https://www.nia.edu.bd/ (`href=""`) | Dead / Empty Link | N/A (Empty `href`) | Desktop click does nothing; mobile redirects to home. House Master profile inaccessible. | Create dedicated route `/hostel-house-master` or section under staff/hostel and link navigation item. |
| **Hostel** | House Tutor | https://www.nia.edu.bd/ (`href=""`) | Dead / Empty Link | N/A (Empty `href`) | Desktop click does nothing; mobile redirects to home. House Tutor information inaccessible. | Create dedicated route `/hostel-house-tutor` or section under staff/hostel and link navigation item. |
| **Discipline** | General Discipline | https://www.nia.edu.bd/this-content-is-currently-under-update | Missing Content / Placeholder | 200 OK | Visitors see a generic placeholder notice instead of student rules. | Create dedicated route and view `/general-discipline`, publish school code of conduct and discipline policy. Update navbar href. |
| **Discipline** | Do's and Don'ts | https://www.nia.edu.bd/this-content-is-currently-under-update | Missing Content / Placeholder | 200 OK | Incomplete school guidelines for parents and students. | Create dedicated route `/dos-and-donts`, add behavioral rules and guidance content, and link from navigation. |
| **Discipline** | Mode of Motivation | https://www.nia.edu.bd/this-content-is-currently-under-update | Missing Content / Placeholder | 200 OK | Incomplete school guidelines. | Add page content explaining rewards, student recognition, and motivation system, or remove item from menu until ready. |
| **Co-Curricular** | Overview / Indoor events | https://www.nia.edu.bd/this-content-is-currently-under-update | Missing Content / Placeholder | 200 OK | Missing co-curricular information. | Create dedicated content describing indoor sports, debates, Quran recitation clubs, etc. |
| **Co-Curricular** | Outdoor Events | https://www.nia.edu.bd/this-content-is-currently-under-update | Missing Content / Placeholder | 200 OK | Missing co-curricular information. | Publish outdoor sports events, sports day records, and field trips. |
| **Co-Curricular** | Science Project | https://www.nia.edu.bd/this-content-is-currently-under-update | Missing Content / Placeholder | 200 OK | Missing information on science fairs and projects. | Upload science fair showcases, student projects, and photos. |
| **Co-Curricular** | Competitions | https://www.nia.edu.bd/this-content-is-currently-under-update | Missing Content / Placeholder | 200 OK | Missing extracurricular competition details. | Document annual academic and athletic competitions. |
| **Co-Curricular** | Study Tour | https://www.nia.edu.bd/this-content-is-currently-under-update | Missing Content / Placeholder | 200 OK | Missing tour and educational visit details. | Add past and upcoming study tour reports with gallery links. |
| **About** | History | https://www.nia.edu.bd/history-of-nia | Healthy | 200 OK | None. | Content is populated and working properly. |
| **About** | Why Choose NIA | https://www.nia.edu.bd/why-our-school-to-choose | Healthy | 200 OK | None. | Content is populated and working properly. |
| **Leadership** | Message from Chairman | https://www.nia.edu.bd/message-from-the-chairman | Healthy | 200 OK | None. | Content is populated and working properly. |
| **Leadership** | Message from Principal | https://www.nia.edu.bd/message-from-the-principal | Healthy | 200 OK | None. | Content is populated and working properly. |
| **Governance** | Governing Body | https://www.nia.edu.bd/governing-body | Healthy | 200 OK | None. | Content is populated and working properly. |
| **Staff** | Faculty / Staff List | https://www.nia.edu.bd/staffs | Healthy | 200 OK | None. | Content is populated and working properly. |
| **Admission** | Admission Procedure | https://www.nia.edu.bd/admission-procedure | Healthy | 200 OK | None. | Content is populated and working properly. |
| **Admission** | Admission Form | https://www.nia.edu.bd/admission-form | Healthy | 200 OK | None. | Form and instructions render properly. |
| **Curriculum** | Early Years (EY) | https://www.nia.edu.bd/early-years-ey | Healthy | 200 OK | None. | Content is populated and working properly. |
| **Curriculum** | Primary Years Programme (PYP) | https://www.nia.edu.bd/primary-years-programme-pyp | Healthy | 200 OK | None. | Content is populated and working properly. |
| **Curriculum** | Middle / High Years (MYP/HYP) | https://www.nia.edu.bd/middle-year-programme-myp-high-years-programme-hyp | Healthy | 200 OK | None. | Content is populated and working properly. |
| **Curriculum** | Hifzul Quraan Curriculum | https://www.nia.edu.bd/hifzul-quraan-curriculum | Healthy | 200 OK | None. | Content is populated and working properly. |
| **Evaluation** | Student Evaluation Process | https://www.nia.edu.bd/student-evaluation-process | Healthy | 200 OK | None. | Content is populated and working properly. |
| **Policy** | Uniform of Students | https://www.nia.edu.bd/uniform-of-students | Healthy | 200 OK | None. | Content is populated and working properly. |
| **Contact** | Contact Us | https://www.nia.edu.bd/contact-us | Healthy | 200 OK | None. | Content is populated and working properly. |

---

## 🛠️ Instructions to Import to Google Sheets

1. Open [Google Sheets](https://sheets.new).
2. Go to **File** > **Import**.
3. Select the **Upload** tab.
4. Drag and drop the `website_audit_report.csv` file from this folder.
5. In the Import file dialog, select **"Replace current sheet"** and separator **"Detect automatically"** (or comma).
6. Click **Import data**.
