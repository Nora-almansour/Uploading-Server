<% Option Explicit   

' value="<%=objRec.Fields("ID") 

Dim Conn,strSQL,objRec  
Set Conn = Server.Createobject("ADODB.Connection")  
Conn.Open "DSN=Task;" & "Uid=fofo;" & "Pwd=123456"   

strSQL = "SELECT trim(info_name) info_name , ID, trim(info_Sex) info_Sex, info_mobile, trim(info_city) info_city, trim(FileName) FileName , to_char(udate,'dd-mm-yyyy hh24:mi:ss' )udate  FROM inforamtion WHERE ID = '"&Request.QueryString("ID")&"'  "  
Set objRec = Conn.Execute(strSQL)  
If objRec.EOF Then  
Response.write("Not found ID="&Request.QueryString("ID"))  
Else  
%> 
 <script language="JavaScript" src="ts_picker.js">
    </script>
<body onload="selectOption();">



<form action="TASK5III.asp?ID=<%=objRec.Fields("ID")%>"  ENCTYPE="multipart/form-data" name="tstest" method="post"> 

<%=objRec.Fields("info_name")%>
<p> Enter Your Name </p>
Name:<input type="text" name="type1" value="<%=objRec.Fields("info_name")%>" >
<br>
<%
dim sex
sex=objRec.Fields("info_Sex")
%>
<p> Select The Gender: </p>	
<input type="radio" name="sex" <%if sex="Male"   then Response.Write("checked")%>  value="Male">Male
<input type="radio" name="sex" <%if sex="Female" then Response.Write("checked")%>  value="Female">Female
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

<script language='javascript' > 
function selectOption() 
{
document.getElementById('City').value ='<%=objRec.Fields("info_city")%>';
}
</script>

				
Select Date:

<input type="Text" name="timestamp" value="<%=objRec.Fields("udate").Value%>">


<a href="javascript:show_calendar('document.tstest.timestamp', document.tstest.timestamp.value );">
<img src="cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the timestamp"></a><br>



File Name: <INPUT TYPE=File NAME="txtFile" value="<%=objRec.Fields("FileName").value%>"  >

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