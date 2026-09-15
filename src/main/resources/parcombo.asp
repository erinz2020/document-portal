<title>Engineering Information</title>

<%

' ============================================================
' AI NOTE:
' Everything below uses Request.Form(...) to read values
' submitted from the previous ASP page.
'
' For the Design Criteria page, the important values are:
'
' FOLDERDESC
' SUBDESC
' WORKDESC
'
' The other fields suggest this file was written as a reusable
' search/query builder for several possible search combinations.
' ============================================================


'ALLPROP = Request.form("DisplayAllProp")
'ALLDIST = Request.form("DisplayAllDist")

FOLDERRSN = Request.form("FOLDERRSN")
FOLDERDESC = Request.form("FOLDERDESC")
SUBDESC = Request.form("SUBDESC")
WORKDESC = Request.form("WORKDESC")
ATTACHMENTDESC = Request.form("ATTACHMENTDESC")
ATTACHMENTDETAIL = Request.form("ATTACHMENTDETAIL")
DOSPATH = Request.form("DOSPATH")
ATTACHMENTRSN = Request.form("ATTACHMENTRSN")


' ============================================================
' AI NOTE:
' These assignments do NOT query the database.
'
' They only copy values from the HTTP form request into
' VBScript variables.
'
' Example:
'
' Request.Form("SUBDESC")
'              ↓
'        "Design Criteria"
'              ↓
'          SUBDESC
' ============================================================



'===== Start search any one field =====

'Search ONLY - FOLDERDESC (1)

If request.form("FOLDERDESC") = _
   "Engineering Standard Drawings & Design Criteria" _
   and request.form("SUBDESC") <> "None" _
   and request.form("WORKDESC") = "None" then


    ' ========================================================
    ' AI NOTE:
    ' Despite the old comment saying "FOLDERDESC",
    ' this branch actually filters by SUBDESC.
    '
    ' This code is BUILDING a SQL string in strSql.
    ' It is NOT executing the SQL yet.
    ' ========================================================

    strSql = "Select DISTINCT FOLDERRSN, FOLDERDESC, SUBDESC, WORKDESC, ATTACHMENTDESC, " & _
             "ATTACHMENTDETAIL, DOSPATH, ATTACHMENTRSN From ENGINEERING_DATA_VIEW " & _
             "WHERE SUBDESC = '" & request.form("SUBDESC") & "' " & _
             "order by ATTACHMENTDESC ASC"



'Search ONLY - WORKDESC (3)

Elseif request.form("FOLDERDESC") = _
       "Engineering Standard Drawings & Design Criteria" _
       and request.form("SUBDESC") = "None" _
       and request.form("WORKDESC") <> "None" then


    ' ========================================================
    ' AI NOTE:
    ' This branch searches using only WORKDESC.
    ' ========================================================

    strSql = "Select DISTINCT FOLDERRSN, FOLDERDESC, SUBDESC, WORKDESC, ATTACHMENTDESC, " & _
             "ATTACHMENTDETAIL, DOSPATH, ATTACHMENTRSN From ENGINEERING_DATA_VIEW " & _
             "WHERE WORKDESC = '" & request.form("WORKDESC") & "' " & _
             "order by ATTACHMENTDESC ASC"


'===== End search any one field =====



'===== Start search any two fields =====

'Search FOLDERDESC & SUBDESC (1,2)

Elseif request.form("FOLDERDESC") <> "None" _
       and request.form("SUBDESC") <> "None" _
       and request.form("WORKDESC") = "None" then


    ' ========================================================
    ' AI NOTE:
    ' Two criteria are present:
    '
    ' FOLDERDESC + SUBDESC
    '
    ' Both are added to the WHERE clause.
    ' ========================================================

    strSql = "Select DISTINCT FOLDERRSN, FOLDERDESC, SUBDESC, WORKDESC, ATTACHMENTDESC, " & _
             "ATTACHMENTDETAIL, DOSPATH, ATTACHMENTRSN From ENGINEERING_DATA_VIEW " & _
             "WHERE FOLDERDESC = '" & request.form("FOLDERDESC") & "' and " & _
             "SUBDESC = '" & request.form("SUBDESC") & "' " & _
             "order by ATTACHMENTDESC ASC"



'Search FOLDERDESC & WORKDESC (1,3)

Elseif request.form("FOLDERDESC") <> "None" _
       and request.form("SUBDESC") = "None" _
       and request.form("WORKDESC") <> "None" then


    ' ========================================================
    ' AI NOTE:
    ' Two criteria:
    '
    ' FOLDERDESC + WORKDESC
    ' ========================================================

    strSql = "Select DISTINCT FOLDERRSN, FOLDERDESC, SUBDESC, WORKDESC, ATTACHMENTDESC, " & _
             "ATTACHMENTDETAIL, DOSPATH, ATTACHMENTRSN From ENGINEERING_DATA_VIEW " & _
             "WHERE FOLDERDESC = '" & request.form("FOLDERDESC") & "' and " & _
             "WORKDESC = '" & request.form("WORKDESC") & "' " & _
             "order by ATTACHMENTDESC ASC"



'Search SUBDESC & WORKDESC (2,3)

Elseif request.form("FOLDERDESC") = _
       "Engineering Standard Drawings & Design Criteria" _
       and request.form("SUBDESC") <> "None" _
       and request.form("WORKDESC") <> "None" then


    ' ========================================================
    ' AI NOTE:
    ' This branch filters using SUBDESC + WORKDESC.
    '
    ' Notice that FOLDERDESC is checked in the IF condition,
    ' but the SQL shown here filters SUBDESC and WORKDESC.
    ' ========================================================

    strSql = "Select DISTINCT FOLDERRSN, FOLDERDESC, SUBDESC, WORKDESC, ATTACHMENTDESC, " & _
             "ATTACHMENTDETAIL, DOSPATH, ATTACHMENTRSN From ENGINEERING_DATA_VIEW " & _
             "WHERE SUBDESC = '" & request.form("SUBDESC") & "' and " & _
             "WORKDESC = '" & request.form("WORKDESC") & "' " & _
             "order by ATTACHMENTDESC ASC"


'===== End search any two fields =====



'===== Start search ALL fields =====

'Search FOLDERDESC & SUBDESC & WORKDESC (1,2,3)

Elseif request.form("FOLDERDESC") <> "None" _
       and request.form("SUBDESC") <> "None" _
       and request.form("WORKDESC") <> "None" then


    ' ========================================================
    ' AI NOTE:
    ' All three criteria have values.
    '
    ' This is the most interesting branch for the page you
    ' showed, because if-DC.asp supplies:
    '
    ' FOLDERDESC = Engineering Standard Drawings & Design Criteria
    ' SUBDESC    = Design Criteria
    ' WORKDESC   = Guidelines
    '
    ' Therefore this appears to be the branch used for the
    ' current "Design Criteria - Guidelines" page.
    ' ========================================================

    strSql = "Select DISTINCT FOLDERRSN, FOLDERDESC, SUBDESC, WORKDESC, ATTACHMENTDESC, " & _
             "ATTACHMENTDETAIL, DOSPATH, ATTACHMENTRSN From ENGINEERING_DATA_VIEW " & _
             "WHERE FOLDERDESC = '" & request.form("FOLDERDESC") & "' and " & _
             "SUBDESC = '" & request.form("SUBDESC") & "' and " & _
             "WORKDESC = '" & request.form("WORKDESC") & "' " & _
             "order by ATTACHMENTDESC ASC"


'===== End search ALL fields =====


Else

    ' ========================================================
    ' AI NOTE:
    ' If none of the expected combinations match,
    ' send the browser back to if-DC.asp.
    ' ========================================================

    response.Redirect("if-DC.asp")

End If


' ============================================================
' AI NOTE:
' IMPORTANT:
'
' ParComboDC.asp ends with a STRING named strSql.
'
' It has NOT connected to Oracle.
' It has NOT executed the query.
' It has NOT retrieved any documents.
'
' Its main job is:
'
'     form values
'          ↓
'     build strSql
'
' The next file executes strSql.
' ============================================================

%>