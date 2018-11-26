 
<html>   
<body> 
<!--#include file="clsUpload.asp"-->

 
<%  
Dim Conn,strSQL,objExec,result 
set o = new clsUpload 
Set Conn = Server.Createobject("ADODB.Connection")
SET result = SERVER.createobject("adodb.recordset")  
Conn.Open "DSN=Task;" & "Uid=fofo;" & "Pwd=123456"  
 
  
sFileSplit = split(o.FileNameOf("txtFile"), "\")
sFile = sFileSplit(Ubound(sFileSplit))

o.FileInputName = "txtFile"
o.FileFullPath = Server.MapPath(".\sequantional") & "\" & sFile 'isit being viewed by browser ?
Response.write o.FileFullPath
o.save

strSQL = "Update inforamtion SET "
 
strSQL = strSQL&"info_name = '"& o.ValueOf("type1")&"' "  
strSQL = strSQL&",info_Sex = '"&o.ValueOf("sex")&"' "  
strSQL = strSQL&",info_mobile = '"&o.ValueOf("mobile")&"' "  
strSQL = strSQL&",info_city = '"&o.ValueOf("City")&"' "
strSQL = strSQL&",FileName = '"&sFile&"' "
strSQL = strSQL&",udate = TO_DATE('"&o.ValueOf("timestamp")&"','DD-MM-YYYY HH24:MI:SS') "  
strSQL = strSQL&"WHERE ID = '"&Request.QueryString("ID")&"' "
Response.write(strSQL)

Set objExec = Conn.Execute(strSQL)  
If Err.Number = 0 Then  
Response.write("Save completed.")   
Else  
Response.write("Error Save ["&strSQL&"] ("&Err.Description&")")  
End IF  
Conn.Close()  
Set objExec = Nothing  
Set Conn = Nothing  
'Return to the update page in case another info  needs deleting
Response.Redirect "TASK5I.asp"
%>  
<!--<input type="submit"  value="update">-->


</body>  
</html> 