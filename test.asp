<!--#include file="clsUpload.asp"-->

<%

Dim conn,recset 
set conn=server.CreateObject("ADODB.connection")
set recset=server.CreateObject("ADODB.recordset")
set o = new clsUpload
conn.open="DSN=Task;" & "Uid=fofo;" & "Pwd=123456"



'get client file name without path
sFileSplit = split(o.FileNameOf("txtFile"), "\")
sFile = sFileSplit(Ubound(sFileSplit))

o.FileInputName = "txtFile"
o.FileFullPath = Server.MapPath(".\sequantional") & "\" & sFile 'isit being viewed by browser ?
Response.write o.FileFullPath
o.save

 if o.Error = "" then
	response.write "Success. File saved to  " & o.FileFullPath & ". Demo Input = " & o.ValueOf("type1")
	
 else
	response.write "Failed due to the following error: " & o.Error
 end if

set o = nothing
conn.close

%>