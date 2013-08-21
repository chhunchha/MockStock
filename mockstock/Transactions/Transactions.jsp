<%-- 
    Document   : Companies
    Created on : Jan 1, 2008, 3:45:41 AM
    Author     : ExpertMental
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/TableView.css" />
<%@ page import="mockstock.beans.transactions.*"%>
<%@ page import="mockstock.dbhandler.*"%>
<%@ page import="mockstock.beans.company.*"%>
<%@ page import="java.util.*"%>
<jsp:include page="../Common/Header.jsp"></jsp:include>
<%
	List transactions = (List) request.getAttribute("transactions");
%>

<title>Companies</title>
</head>
<body>
<table class="are" border="0" width="100%" align="center">
	<tr>
		<th class="main">Transactions</th>
	</tr>
</table>	
<div style="overflow: auto; height: 300pt;">
<table class="are" border="2" width="80%" align="center">
	<tr>
		<th class="are">Transaction Id </th>
		<th class="are">Team id </th>
		<th class="are">Company</th>
		<th class="are">Price</th>
                <th class="are">No of Shares</th>
                <th class="are">Type</th>
                
        </tr>
	<%
		for (int i = 0; i < transactions.size(); i++) {
                        Transactions aTransaction = (Transactions) transactions.get(i);
                        DBHandler dBHandler = new DBHandler();
                        Company aCompany = (Company) dBHandler.getCompany(aTransaction.getCompanyid()).get(0);

			out.println("<tr>"
                                        + "<td>" + aTransaction.getTransactionid() + "</td>"
					+ "<td>" + aTransaction.getTeamid() + "</td>"
					+ "<td>" + aCompany.getName() + "</td>"
					+ "<td>" + aTransaction.getPrice() + "</td>"
        				+ "<td>" + aTransaction.getNoofshares() + "</td>"
                                        + "<td>" + aTransaction.getTransactiontype() + "</td>");
                        out.println("</tr>" );
        			
		}
        %>
    </table>
</div>
</body>
<table width=100%>
    <tr>
        <th class="main"></th>
    </tr>
</table>
</html>
