<%-- 
    Document   : Ltps
    Created on : Jan 1, 2008, 4:13:59 AM
    Author     : ExpertMental
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/TableView.css" />
<%@ page import="mockstock.beans.ltp.*"%>
<%@ page import="mockstock.beans.company.*"%>
<%@ page import="mockstock.dbhandler.*"%>
<%@ page import="java.util.*"%>
<%
	List ltps = (List) request.getAttribute("ltps");
%>

<title>Ltps</title>
<script LANGUAGE="JavaScript">
    
    function callAgain()
    {
        window.setTimeout('document.frmRefresh.submit()',5000);
    }
</script>
</head>
<body onload="callAgain()" align="center">
    <center>
<table class="are" border="2">
        <tr>
            <td width=250px style="font-weight:normal;font-size:14px"> Sumant Chhunchha - 9970158473</td>
        </tr>
	<!--tr>
		<th class="main" colspan="2">ltps</th>
                
	</tr-- >
</table>	
<div style="overflow: auto; height: 300pt;">
<table class="aresimple" border="2" >
	<tr>
		<!--th class="are">Id </th-->
                <th class="are">Company</th>
		<th class="are">Share Price</th>
               
	</tr>
	<%
		for (int i = 0; i < ltps.size(); i++) {
			Ltp aLtp = (Ltp) ltps.get(i);
                       Company aCompany = (Company) (new DBHandler().getCompany(aLtp.getCompanyid()).get(0));
                        
			out.println("<tr>"
				//	+ "<td>" + aLtp.getCompanyid() + "</td>"
                                        + "<td>" + aCompany.getName() + "</td>"
					+ "<td>" + aLtp.getLtp() + "</td>"
					);
                        out.println("</tr>" );
        			
		}
        %>
    </table>
</div>
 <table class="are">
        <tr>
            <td align=right>
                <form name="frmNormalLtp" methog="post" action="Ltp"> <input type="submit" value="Show Original Page" /></form>
            </td>
        </tr>
    </table>
<form name="frmRefresh" method="post" action="Ltp"> <input type="hidden" name="type" value="simple"/></form>
</center>
</body>
</html>
