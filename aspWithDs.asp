
<%	
SET myConn=SERVER.createobject("adodb.connection")
SET result = SERVER.createobject("adodb.recordset")
myConn.Open "DSN=Task;" & "Uid=fofo;" & "Pwd=123456"

SQLStr="SELECT * FROM inforamtion " 
result.Open SQLStr, myConn

IF NOT result.EOF THEN 
  response.write("<H2>Oracle ASP Example</H2>") 
  response.write("<P>Connecting to the Task3 database using ODBC & a DSN connection</P>")
  response.write("<TABLE BORDER=4 width=60% BGCOLOR=#0099CC><TR><TH>info_name</TH>" & _
    "<TH>info_Sex</TH><TH>info_mobile</TH><TH>info_city</TH></TR>") 
  WHILE NOT result.EOF 
    response.write("<TR><TD>" & result("info_name") & "</TD>") 
    response.write("<TD>" & result("info_Sex") & "</TD>") 
    response.write("<TD>" & result("info_mobile") & "</TD>") 
	response.write("<TD>" & result("info_city") & "</TD></TR>") 
    result.movenext() 
  WEND 
  response.write("</TABLE>") 
ELSE 
  response.write("<P>Error retrieving userInfo data!!</P>") 
END IF 

myConn.Close
%>