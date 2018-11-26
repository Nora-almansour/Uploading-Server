<% Option Explicit %>  
<html>  
  
<body>  
<%  
Dim Conn,strSQL,objRec  
Set Conn = Server.Createobject("ADODB.Connection")  
Conn.Open "DSN=Task;" & "Uid=fofo;" & "Pwd=123456"  
strSQL = "SELECT * FROM inforamtion  "  
Set objRec = Server.CreateObject("ADODB.Recordset")  
objRec.Open strSQL, Conn
%>  

<table width="600" border="1">  
<tr> 
<th width="91"> <div align="center">ID </div></th>   
<th width="91"> <div align="center">info_name </div></th>  
<th width="98"> <div align="center">info_Sex </div></th>  
<th width="198"> <div align="center">info_mobile </div></th>  
<th width="59"> <div align="center">info_city </div></th>
<th width="200"> <div align="center">udate</div></th>
<th width="200"> <div align="center">FileName</div></th>    
<th width="59"> <div align="center">Edit</div></th> 
<th width="59"> <div align="center">Delete</div></th>   

</tr>  
<%  
While Not objRec.EOF  
%>  
<tr> 
 <td><div align="center"><%=objRec.Fields("ID").Value%></div></td>  

<td><div align="center"><%=objRec.Fields("info_name").Value%></div></td>  
<td><%=objRec.Fields("info_Sex").Value%></td>  
<td><%=objRec.Fields("info_mobile").Value%></td>   
<td align="right"><%=objRec.Fields("info_city").Value%></td>
<td align="right"><%=objRec.Fields("udate").Value%></td>
<td align="center"> <A target="_blank" href="sequantional\<%=objRec.Fields("FileName")%>"><%=objRec.Fields ("FileName")%></A>  </td>
<td align="center"><a href="TASK5II.asp?ID=
<%=objRec.Fields("ID").Value%>">Edit</a></td> 
<td align="center"><a href="TASK5D.asp?ID=
<%=objRec.Fields("ID").Value%>">Delete</a></td>
</tr>  
<%
objRec.MoveNext  
Wend  
%>  
</table>  
<%  
objRec.Close()  
Conn.Close()  
Set objRec = Nothing  
Set Conn = Nothing  
%>  
</body>  
</html>  
