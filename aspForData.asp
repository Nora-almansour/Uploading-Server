<%
dim cn, rs
set cn=server.CreateObject("adodb.connection")
cn.Open " =sqloledb;SERVER=localhost;DATABASE=fofo77755@hotmail.com;UID=fo;PWD=123;"
set rs=server.CreateObject("adodb.recordset")
rs.open "Select * from inforamtion",cn,adOpenKeyset,adLockOptimistic



rs.close
%>