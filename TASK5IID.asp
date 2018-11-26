<% Option Explicit   

' value="<%=objRec.Fields("ID") 

Dim Conn,strSQL,objRec  
Set Conn = Server.Createobject("ADODB.Connection")  
Conn.Open "DSN=Task;" & "Uid=fofo;" & "Pwd=123456"  
strSQL = "SELECT trim(info_name) info_name , ID, trim(info_Sex) info_Sex, info_mobile, trim(info_city) info_city  FROM inforamtion WHERE ID = '"&Request.QueryString("ID")&"'  "  
Set objRec = Conn.Execute(strSQL)  
If objRec.EOF Then  
Response.write("Not found ID="&Request.QueryString("ID"))  
Else  
%>  
<body onload="selectOption();">
<form action="TASK5D.asp?ID=<%=objRec.Fields("ID")%>" name="frmEdit" method="post"> 

<%=objRec.Fields("info_name")%>
<p> Enter Your Name </p>
Name:<input type="text" name="type1" value="<%=objRec.Fields("info_name")%>" >
<br>
<%
dim sex
sex=objRec.Fields("info_Sex")
%>
<p> Select The Gender: </p>	
<input type="radio" name="sex" <%if sex="Male"   then Response.Write("checked")%>  value="Male" >  Male
<input type="radio" name="sex" <%if sex="Female" then Response.Write("checked")%>  value="Female">  Female
<br>

Enter Your Mobile Number:<input type="text" name="Mobile" value="<%=objRec.Fields("info_mobile")%>" > <br>


<p> Select Your City: 
<select  id="City"  name="City" > 
<option value="Riyadh"> Riyadh </option>
<option value="Jeddah"> Jeddah </option>
<option value="Dammam" > Dammam </option>
<option value="other"> Other </option> 
</select>

</p>

<%

Response.Write("<script language='javascript' > function selectOption() {document.getElementById('City').value ='"&objRec.Fields("info_city")&"';}</script>")
%>
				

<br>
<input type="hidden" name="ID" value="<%=objRec.Fields("ID")%>">
<input type="submit" name="submit" value="Delete">  
<%  
End IF  
objRec.Close()  
Conn.Close()  
Set objRec = Nothing  
Set Conn = Nothing  
%>  
</form>  
</body>  
</html> 