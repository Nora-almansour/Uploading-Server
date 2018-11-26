<% Option Explicit%> 

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
<form action="TASK5II.asp?ID=<%=objRec.Fields("ID")%>" name="frmEdit" method="post"> 

<p> Enter Your Name </p>
Name:<input type="text" name="type1" >
<br>
<p> Select The Gender: </p>
<input type="radio" name="sex" value="Male"> Male
<input type="radio" name="sex" value="Female"> Female 
<br>
Enter Your Mobile Number:<input type="text" name="Mobile" > <br>
<p> Select Your City: 
<select name="City" id="City"> 
<option value="Riyadh"> Riyadh </option>
<option value="Jeddah"> Jeddah </option>
<option value="Dammam" > Dammam </option>
<option value="other"> Other </option> 
</select>
</p>
<br>
<input type="hidden" name="ID" value="<%=objRec.Fields("ID")%>">
<input type="submit"  value="Submit">
</form>  
  
<%  
objRec.Close()  
Conn.Close()  
Set objRec = Nothing  
Set Conn = Nothing  
%>  
</body>  
</html>  




















