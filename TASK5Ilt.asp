<% Option Explicit   

' value="<%=objRec.Fields("ID") 

Dim Conn,strSQL,objRec  
Set Conn = Server.Createobject("ADODB.Connection")  
conn.open="DSN=Task;" & "Uid=fofol;" & "Pwd=123"   

strSQL = "SELECT trim(name) name , ID, trim(Sex) Sex, mobile, trim(city) city  FROM information WHERE ID = '"&Request.QueryString("ID")&"'  "  
Set objRec = Conn.Execute(strSQL)  
If objRec.EOF Then  
Response.write("Not found ID="&Request.QueryString("ID"))  
Else  
%> 

<body onload="selectOption();">



<form action="TASK5IIIt.asp?ID=<%=objRec.Fields("ID")%>"  method="post"> 


<p> Enter Your Name </p>
Name:<input type="text" name="type1" value="<%=objRec.Fields("name")%>" >
<br>
<%
dim sex
sex=objRec.Fields("Sex")
%>
<p> Select The Gender: </p>	
<input type="radio" name="sex" <%if sex="Male"   then Response.Write("checked")%>  value="Male">Male
<input type="radio" name="sex" <%if sex="Female" then Response.Write("checked")%>  value="Female">Female
<br>

Enter Your Mobile Number:<input type="text" name="Mobile" value="<%=objRec.Fields("mobile")%>" > <br>


<p> Select Your City: 
<select  id="City"  name="City" > 
<option value="Riyadh"> Riyadh </option>
<option value="Jeddah"> Jeddah </option>
<option value="Dammam" > Dammam </option>
<option value="other"> Other </option> 
</select>
</p>

<script language='javascript' > 
function selectOption() 
{
document.getElementById('City').value ='<%=objRec.Fields("city")%>';
}
</script>





<a href="delFile.asp?ID=<%=objRec.Fields("ID").Value%>"><b>To delete file Only</b></a>

<br>
<input type="hidden" name="ID" value="<%=objRec.Fields("ID")%>">

<input type="submit" name="submit" value="Update">  
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