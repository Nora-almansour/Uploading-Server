<!--#include file="clsUpload.asp"-->
<%

Dim conn,recset 
set conn=server.CreateObject("ADODB.connection")
set recset=server.CreateObject("ADODB.recordset")
set o = new clsUpload
conn.open="DSN=Task;" & "Uid=fofo;" & "Pwd=123456"   

Dim r,n,s,m,w,d,u

'get client file name without path
sFileSplit = split(o.FileNameOf("txtFile"), "\")
sFile = sFileSplit(Ubound(sFileSplit))

r= o.ValueOf("type1")
n= o.ValueOf("sex")
s= o.ValueOf("Mobile")
m= o.ValueOf("City")
u= sFile
w= o.ValueOf("ID")
d= o.ValueOf("timestamp")
Response.Write (d)


o.FileInputName = "txtFile"
o.FileFullPath = Server.MapPath(".\sequantional") & "\" & sFile 'isit being viewed by browser ?
Response.write o.FileFullPath
o.save

 if o.Error = "" then
	response.write "Success. File saved to  " & o.FileFullPath & ". Demo Input = " & o.ValueOf("type1")

	sql ="insert into inforamtion  (info_name,info_Sex,info_mobile,info_city,FileName,ID,udate) values ('"&r&"','"&n&"','"&s&"','"&m&"','"&u&"',idNum.NEXTVAL, To_date ('"&d&"','DD-MM-YYYY HH24:MI:SS'))"

conn.execute sql
Response.Write sql
Response.Write (conn)
Response.Write "Succssfully Inserted"




else
	response.write "Failed due to the following error: " & o.Error
 end if

set o = nothing
conn.close
Response.Redirect "h1.HTML"

%>
