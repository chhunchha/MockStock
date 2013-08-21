<%-- 
    Document   : updateTeam.jsp
    Created on : Jan 1, 2008, 1:28:16 AM
    Author     : ExpertMental
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="mockstock.beans.team.*"%>
<%@ page import="mockstock.dbhandler.*"%>
<%@ page import="java.util.*"%>
<link rel="stylesheet" type="text/css" href="/mockstock/css/header.css" />
<link rel="stylesheet" type="text/css" href="/mockstock/css/TableView.css" />
<jsp:include page="../Common/Header.jsp"></jsp:include>
<%
String teamid = request.getParameter("teamid");
DBHandler dBHandler = new DBHandler();
Team aTeam = (Team) dBHandler.getTeam(teamid).get(0);
float cash = aTeam.getCash();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Team</title>
    </head>
    <body>
        <br>
        <form name="frmUpdateTeam" method="post" action="/mockstock/UpdateTeam">
        <table class="frm" align="center">
            <tr>
                <th colspan="2" class="frm"> Team </th>
            </tr>
            <tr>
                <td> Team Id: </td><td><input type="input" value='<%=teamid%>' disabled size=5 /><input type="hidden" name="teamid" value='<%=teamid%>' /></td>
            </tr>
            <tr>
                <td> Cash :</td><td><input type="text" name="cash" value='<%=cash%>' /></td>
            </tr>
            <tr>
                <th colspan="2" class="frm"> <input type="submit" value="Save" />
            </tr>
        </table>
    </form>
    </body>
</html>
