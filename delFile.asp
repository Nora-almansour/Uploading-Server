
<!--#include file="clsUpload.asp"-->
<%

' Database connection - remember to specify the path to your database
Dim Conn,strSQL,objRec
Set Conn = Server.Createobject("ADODB.Connection")
set objRec=server.CreateObject("ADODB.recordset")
Conn.Open "DSN=Task;" & "Uid=fofo;" & "Pwd=123456" 

strSQL = "SELECT FileName FROM inforamtion WHERE ID = '"&Request.QueryString("ID")&"' " 
objRec.open  strSQL,Conn
sFile = objRec.Fields("FileName")




FileFullPath = Server.MapPath(".\sequantional") & "\" & sFile 'isit being viewed by browser ?
Response.write FileFullPath
'o.save


dim ServerFSO
Set ServerFSO=Server.CreateObject("Scripting.FileSystemObject")
if ServerFSO.FileExists(FileFullPath) then
    response.Write(FileFullPath)

    ServerFSO.DeleteFile(FileFullPath)
end if
set ServerFSO=nothing




'update DB       
strSQL = "update inforamtion set FileName = Null  "  
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
