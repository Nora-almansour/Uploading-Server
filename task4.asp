<HTML> 
<HEAD>
<TITLE>Result of Database Query</TITLE> 
</HEAD>
<BODY>

<H1>Insert a new department - Using Oracle</H1> 

<%

ON ERROR RESUME NEXT 
DIM objCommand 
DIM SQLStr 
DIM myConn 
SET objCommand=Server.CreateObject("ADODB.Command") 
SET objCommand.ActiveConnection=getDBConnection() 
SET myConn=objCommand.ActiveConnection 
SQLStr="INSERT INTO inforamtion (type1, sex, City) VALUES (" & 
request("type1") & ",'" & request("sex") & "','" & request("City") & "')"
	
	'SQLStr = "Update information set " 
	'update for insert
	 
	

' see the string generated 
response.write ("<P>Insert Statement:<BR>") 
response.write ("'" & SQLStr &"'</P>") 
SET result=myConn.execute(SQLStr) 
Call ErrorVBScriptReport("Insert Statement") 
Call ErrorADOReport(SQLstmt,myConn)

' check what has been inserted 
SQLStr="SELECT * from information "
' see the string generated 
IF err.number=0 THEN 
    response.write ("<H2>Check data inserted</H2>") 
ELSE 
    response.write ("<P><B>Error occurred. Check if primary key already exists:</B></P>")
END IF 
response.write ("<P>Query String:<BR>") 
response.write ("'" & SQLStr &"'</P>") 
CALL query2table(SQLStr,myConn) myConn.Close

%>
</BODY>
</HTML>