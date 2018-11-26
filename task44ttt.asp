<!--#include file="clsUpload.asp"-->
<%
Dim Conn,strSQL,objRec,recored
Set Conn = Server.Createobject("ADODB.Connection")
set o = new clsUpload
Conn.open="DSN=Task;" & "Uid=fofol;" & "Pwd=123"   

'get client file name without path
sFileSplit = split(o.FileNameOf("txtFile"), "\")
sFile = sFileSplit(Ubound(sFileSplit))
o.FileInputName = "txtFile"
o.FileFullPath = Server.MapPath(".\sequantional") & "\" & sFile 'isit being viewed by browser ?
Response.write o.FileFullPath
o.save

Dim r,n,s,m,u,w
r= o.ValueOf("type1")
n= o.ValueOf("sex")
s= o.ValueOf("Mobile")
m= o.ValueOf("City")
u= sFile
w= o.ValueOf("ID")



 if o.Error = "" then
	response.write "Success. File saved to  " & o.FileFullPath & ". Demo Input = " & o.ValueOf("type1")
	
	
sql="insert into information (name,Sex,mobile ,city,ID) values ('"&r&"','"&n&"','"&s&"','"&m&"',IDnum.NEXTVAL)"
conn.execute sql



strSQL = "SELECT max(ID)id  FROM information  "
set objRec=server.CreateObject("ADODB.recordset")
objRec.open  strSQL,Conn
roc = objRec.Fields("id")


strSQL= "insert into info  (FileName,recoredID,ID) values ('"&u&"', "&roc&"  ,ID.NEXTVAL)"
conn.execute strSQL
Response.Write strSQL
Response.Write "Succssfully Inserted"

 end if
set o = nothing
conn.close


%>