<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%

	String user = (String) session.getAttribute("user");
	String msg = "Logged out!!!";
	
	session.invalidate();
	msg="";
	if(user==null)
	{
		msg = "You have already logged out.";
	}
	else
	{
		msg = "You Have logged out.";
	}

%>
<title>Logged Out</title>
</head>
<body text="red" style="background-color:black;font-family:verdana;font-size:20px;">
<table width=100% height=600 background="/mockstock/imgs/LoginPage.png" style="margin-top:70px;background-repeat:no-repeat;background-position:center;">
<tr>
<td align="center" valign="center">
	<%=msg %>
	<br>
	<a href = "index.jsp"> Back to Login Page. </a>
</td>
</tr>
</table>
</body>
</html>