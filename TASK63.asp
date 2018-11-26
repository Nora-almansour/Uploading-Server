<%
	'Dimension variables
          'Holds the SQL query to query the database 
Dim lngRecordNo
strSQL = "SELECT * FROM inforamtion WHERE info_name = '"&r&"'  "  
Set objRec  = Server.CreateObject("ADODB.Recordset")
objRec.Open strSQL, objCONN

objRec.MoveFirst
objRec.Fields ("info_name") = Request.Form("type1")
objRec.Fields ("info_Sex") = Request.Form("sex")
objRec.Fields ("info_mobile") = Request.Form("Mobile")
objRec.Fields ("info_city") = Request.Form("City")


objRec.Update
Response.Write "<div align='center'>" & r & ",<br>"
Response.Write " Your information has been succesffully updated in our database.<br><br>"
objCONN.Close()
Set objRec  = Nothing
Set objCONN = Nothing
%>

