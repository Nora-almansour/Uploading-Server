<html>

 <head>
    <script language="JavaScript" src="ts_picker.js">
    </script>
</head>

<body>


<form method="post" action="task44.asp" name="tstest">
<p> Enter Your Name </p>
Name: <input type="text" name="type1" >
<br>

<p> Select The Gender: </p>
<input type="radio" name="sex" value="Male"> Male
<input type="radio" name="sex" value="Female"> Female 
<br>

Enter Your Mobile Number:<input type="text" name="Mobile" >  <br>

<p> Select Your City: 
<select name="City" >
<option value="Riyadh"> Riyadh </option>
<option value="Jeddah"> Jeddah </option>
<option value="Dammam" > Dammam </option>
<option value="other"> Other </option> 
</select>

</p>

Select Date:
<input type="Text" name="timestamp" value="">
<a href="javascript:show_calendar('document.tstest.timestamp', document.tstest.timestamp.value);">
<img src="cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the timestamp"></a>

<br>
<input type="hidden" name="ID" >

<input type="submit"  value="Submit">

</form> 

</body>
</html> 