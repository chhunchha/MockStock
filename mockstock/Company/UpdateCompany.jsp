<%-- 
    Document   : Company.jsp
    Created on : Jan 1, 2008, 1:28:16 AM
    Author     : ExpertMental
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="mockstock.beans.company.*"%>
<%@ page import="mockstock.dbhandler.*"%>
<%@ page import="java.util.*"%>
<link rel="stylesheet" type="text/css" href="/mockstock/css/header.css" />
<link rel="stylesheet" type="text/css" href="/mockstock/css/TableView.css" />
<jsp:include page="../Common/Header.jsp"></jsp:include>
<%
int companyid = Integer.parseInt(request.getParameter("companyid").toString());
DBHandler dBHandler = new DBHandler();
Company aCompany = (Company) dBHandler.getCompany(companyid).get(0);
int lot = aCompany.getLot();
String name = aCompany.getName();
float price = aCompany.getPrice();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Team</title>
    </head>
    <body>
        <form name="frmUpdateCompany" method="post" action="/mockstock/UpdateCompany">
        <table class="frm" align="center">
            <tr>
                <th colspan="2" class="frm">Company</th>
            </tr>
            <tr>
                <td> Company Id: </td><td><input type="text" value='<%=companyid%>' size=5 disabled /><input type="hidden" name="companyid" value='<%=companyid%>' /></td>
            </tr>
            <tr>
                <td> Company Name:  </td><td><input type="text" name="name" value='<%=name%>' /></td>
            </tr>
            <tr>
               <td> Price: </td><td><input type="text" name="price" value='<%=price%>' /></td>
            </tr>
             <tr>
                <td> Lot: </td><td><input type="text" name="lot" value='<%=lot%>' /></td>
            </tr>
            <tr>
                <td colspan="2" class='cmd' align="center"> <input type="submit" value="Save" /> </td>
            </tr>
        </table>
    </form>
    </body>
</html>
