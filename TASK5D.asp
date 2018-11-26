<html>
	<head>
	<title>Delete data in the database</title>
	</head>

	<body>
	<%
	' Database connection - remember to specify the path to your database
Dim Conn,strSQL,objExec  
Set Conn = Server.Createobject("ADODB.Connection")
Conn.Open "DSN=Task;" & "Uid=fofo;" & "Pwd=123456"   
strSQL = "DELETE from inforamtion  "  
strSQL = strSQL&"WHERE ID = '"&Request.QueryString("ID")&"' "
Set objExec = Conn.Execute(strSQL)
If Err.Number = 0 Then  
Response.write("Delete completed.")  
Else  
Response.write("Error Save ["&strSQL&"] ("&Err.Description&")")  
End IF  
Conn.Close()  
Set objExec = Nothing  
Set Conn = Nothing  
Response.Redirect "TASK5I.asp"	
%>


	</body>
	</html>