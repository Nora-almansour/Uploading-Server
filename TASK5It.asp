<% Option Explicit %>  
<html>  
  
<body>  
<%  
Dim Conn,strSQL,objRec  
Set Conn = Server.Createobject("ADODB.Connection")  
Conn.Open "DSN=Task;" & "Uid=fofol;" & "Pwd=123"  
strSQL = "SELECT * FROM information  "  
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
<th width="59"> <div align="center">Edit</div></th> 
<th width="59"> <div align="center">Delete</div></th>   

</tr>  
<%  
While Not objRec.EOF  
%>  
<tr> 
 <td><div align="center"><%=objRec.Fields("ID").Value%></div></td>  

<td><div align="center"><%=objRec.Fields("name").Value%></div></td>  
<td><%=objRec.Fields("Sex").Value%></td>  
<td><%=objRec.Fields("mobile").Value%></td>   
<td align="right"><%=objRec.Fields("city").Value%></td>

<td align="center"><a href="TASK5Ilt.asp?ID=
<%=objRec.Fields("ID").Value%>">Edit</a></td> 
<td align="center"><a href="TASK5DT.asp?ID=
<%=objRec.Fields("ID").Value%>">Delete</a></td>
</tr>  
<%
objRec.MoveNext  
Wend  
%>  
</table>  


<%  
strSQL = "SELECT * FROM info  "  
Set objRec = Server.CreateObject("ADODB.Recordset")  
objRec.Open strSQL, Conn
%>  

<table width="600" border="1">  
<tr> 
<th width="91"> <div align="center">ID </div></th>   
<th width="200"> <div align="center">FileName</div></th>   
<th width="98"> <div align="center">recoredID </div></th>  

</tr>  
<%  
While Not objRec.EOF  
%>  
<tr> 
 <td><div align="center"><%=objRec.Fields("ID").Value%></div></td>  

<td align="center"> <A target="_blank" href="sequantional\<%=objRec.Fields("FileName")%>"><%=objRec.Fields ("FileName")%></A>  </td>
<td><%=objRec.Fields("recoredID")%></td>  

</tr>  
<%
objRec.MoveNext  
Wend  
%>  



























<%  
objRec.Close()  
Conn.Close()  
Set objRec = Nothing  
Set Conn = Nothing  
%>  
</body>  
</html>  
