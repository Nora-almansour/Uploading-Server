
<html>
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
<%response.write(request.form("sex"))%>

Your City:
<% 
response.write(request.form("City"))
%>

</body>
</html>








