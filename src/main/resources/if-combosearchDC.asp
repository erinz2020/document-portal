<%@ Language=VBScript %>

<!-- =========================================================
     AI NOTE:
     This is a SERVER-SIDE INCLUDE.

     ASP effectively inserts ParComboDC.asp here before
     executing this page.

     After this include runs, strSql should already contain
     the SQL query built from the submitted criteria.
========================================================== -->

<!-- #include file="ParComboDC.asp" -->


<%

' ============================================================
' AI NOTE:
' Create an ADO database connection object.
'
' Think of objCONN as the legacy equivalent of the database
' connection infrastructure that Spring Boot would manage
' through a DataSource/JDBC driver.
' ============================================================

set objCONN = Server.CreateObject("ADODB.Connection")


With objCONN

    .Provider = "MSDAORA"

    ' ========================================================
    ' AI NOTE:
    ' MSDAORA = Microsoft's legacy Oracle provider.
    '
    ' This is strong evidence that this ASP application is
    ' connecting to Oracle.
    ' ========================================================


    .Open "Data Source=AMP;[CREDENTIALS REDACTED]"

    ' ========================================================
    ' AI NOTE:
    ' This is where the database connection is OPENED.
    '
    ' AMP is the configured data source used by this legacy app.
    '
    ' The original screenshot contains credentials.
    ' They are intentionally not reproduced here.
    ' ========================================================

End With



set objRS = objCONN.Execute(strSql)

' ============================================================
' AI NOTE:
' THIS IS THE ACTUAL DATABASE QUERY.
'
' strSql came from ParComboDC.asp.
'
' objCONN.Execute(strSql)
'
'           ↓
'
' sends the SQL to Oracle
'
'           ↓
'
' ENGINEERING_DATA_VIEW is queried
'
'           ↓
'
' the returned rows are stored in objRS.
'
'
' objRS = ADO RecordSet
'
' Conceptually, it is similar to a JDBC ResultSet.
' ============================================================

%>


<html>

<head>

<title>Engineering Information</title>

<!-- stylesheets omitted here -->


<!-- PRINT FRAME FUNCTION -->

<script>

function printWindow(){

    bv = parseInt(navigator.appVersion)

    if (bv >= 4) window.print()

}

</script>

<!-- END PRINT SCRIPT -->

</head>


<body style="font-family:BrandonGrotesqueWeb-bold, sans-serif;">

<table width="95%"
       border="0"
       cellspacing="0"
       cellpadding="0">


<!-- Main Content Starts Here -->

<form name="EngSearch"
      method="post"
      action="">


<table width="95%"
       cellpadding="0"
       cellspacing="0"
       border="0">


<!-- ... existing layout HTML ... -->


<%

Dim rsArray


' ============================================================
' AI NOTE:
' EOF = End Of File.
'
' If objRS.EOF is FALSE, the database returned at least
' one document.
' ============================================================

if not objRS.EOF then


    rsArray = objRS.GetRows()

    ' ========================================================
    ' AI NOTE:
    ' Copy all rows from the RecordSet into an array.
    ' ========================================================


    nr = UBound(rsArray, 2) + 1

    ' ========================================================
    ' AI NOTE:
    ' Calculate the number of returned rows.
    '
    ' If Oracle returned 22 rows:
    '
    ' nr = 22
    '
    ' This is the number displayed on the page.
    ' ========================================================


    response.write _
        "<strong>There were <font color='red'>" _
        & nr & _
        "</font>matches.</strong>" & _

        "<!--tr><td valign=top>&nbsp;</td>" & _
        "<td colspan=2 align=left valign=top><hr width='100%' align='left'></td></tr>" & _

        "<tr><td valign=top>&nbsp;</td>" & _
        "<td colspan=2 align=left valign=top><a href='if-DC.asp' class='yesNoButton' style='text-decoration: none;'>New Search</a></td></tr-->"


    ' ========================================================
    ' AI NOTE:
    ' The HTML above generates the:
    '
    '     "There were 22 matches."
    '
    ' message you see on the current page.
    '
    ' The old "New Search" HTML appears to be commented out.
    ' This helps explain why the current public page does not
    ' behave like a user-facing search form.
    ' ========================================================


    objRS.MoveFirst

    ' ========================================================
    ' AI NOTE:
    ' GetRows() moved through the RecordSet.
    ' MoveFirst resets it back to the first document so the
    ' code below can loop through the results again.
    ' ========================================================


else


    response.write _
        "<p><strong><font color='red'>No matches found.</font></strong></p>" & _
        "</td></tr>" & _
        "<tr><td valign=top>&nbsp;</td><td colspan=2 align=left valign=top><hr></td></tr>"


    ' ========================================================
    ' AI NOTE:
    ' If the query returned zero rows, display:
    '
    '     No matches found.
    ' ========================================================


end if

%>


<!-- ... existing HTML ... -->


<TR>

    <TH WIDTH="50%"
        ALIGN="left"
        valign="top">
        Documents (PDF)
    </TH>

</TR>


<%

' ============================================================
' AI NOTE:
' Now loop through EVERY document returned from Oracle.
'
' objRS points to one database row at a time.
' ============================================================

While Not objRS.EOF


    FOLDERRSN = objRS("FOLDERRSN").VALUE

    ' ========================================================
    ' AI NOTE:
    ' Read FOLDERRSN from the CURRENT database row.
    '
    ' Other fields used by the link are outside the clearly
    ' visible portion of the photograph.
    ' ========================================================

%>


<TR>

    <TD width="50%"
        align="left"
        valign="top"
        BGCOLOR="#E8E8FF">

        <a href="https://www3.markham.ca/Markham/aspc/engineeringPortal85/engineeringdrawings/getPDF.asp...">

            <!-- ==============================================
                 AI NOTE:
                 This <a> element is the PDF link shown to
                 the user.

                 IMPORTANT:
                 This page itself is NOT visibly reading the
                 PDF binary here.

                 Instead, clicking the link calls getPDF.asp.

                 Therefore:

                 if-comboSearchDC.asp
                       = finds/list documents

                 getPDF.asp
                       = likely retrieves/serves the actual PDF
            =============================================== -->

        </a>

    </TD>

</TR>


<%

    objRS.MoveNext()

    ' ========================================================
    ' AI NOTE:
    ' Move to the next database row/document.
    '
    ' Equivalent idea in Java:
    '
    ' while (resultSet.next()) {
    '     ...
    ' }
    ' ========================================================

Wend


objRS.Close

' ============================================================
' AI NOTE:
' Close the RecordSet after all documents have been rendered.
' ============================================================


Set objRS = Nothing

' ============================================================
' AI NOTE:
' Release the RecordSet object.
' ============================================================

%>


<!-- remaining original page/layout HTML -->