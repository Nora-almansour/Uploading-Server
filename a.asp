<!DOCTYPE html>
<html>
<%
dim sex
sex=Request.Form("sex")
%>

<body>
Name:
<%
response.write(request.form("type1")) 
%>

Mobile:
<% 
response.write(request.form("Mobile"))
%>

Gender:
<%if sex="Male" then Response.Write("checked")%>
<%if sex="Female" then Response.Write("checked")%>

Your City:
<% 
response.write(request.form("City"))
%>
</body>`
</html>