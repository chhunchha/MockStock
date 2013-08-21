<%-- 
    Document   : updateTeam.jsp
    Created on : Jan 1, 2008, 1:28:16 AM
    Author     : ExpertMental
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="mockstock.beans.teamshares.*"%>
<%@ page import="mockstock.beans.team.*"%>
<%@ page import="mockstock.beans.company.*"%>
<%@ page import="mockstock.dbhandler.*"%>
<%@ page import="java.util.*"%>
<link rel="stylesheet" type="text/css" href="/mockstock/css/header.css" />
<link rel="stylesheet" type="text/css" href="/mockstock/css/TableView.css" />
<jsp:include page="../Common/Header.jsp"></jsp:include>
<%
            String teamid = request.getParameter("teamid");
            int companyid = Integer.parseInt(request.getParameter("companyid"));

            DBHandler dBHandler = new DBHandler();

            TeamShares aTeamShares = (TeamShares) dBHandler.getTeamShares(teamid, companyid).get(0);
            int noofshares = aTeamShares.getNoofshares();

            Company aCompany = (Company) dBHandler.getCompany(companyid).get(0);
            String name = aCompany.getName();

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Team</title>
    </head>
    <body>
        <form name="frmUpdateTeamShares" method="post" action="/mockstock/UpdateTeamShares">
            <table class="frm" align="center">
                <tr>
                    <th colspan="2" class="frm"> Team </th>
                </tr>
                <tr>
                    <td> Team Id: </td><td><input type="text" name="teamid" value='<%=teamid%>' disabled size=5/><input type="hidden" name="teamid" value='<%=teamid%>' /></td>
                </tr>
                <tr>
                    <td> Company name:</td><td><input type="text" name="name" value='<%=name%>' disabled /> <input type="hidden" name="name" value='<%=name%>' /> <input type="hidden" name="companyid" value='<%=companyid%>' /></td>
                </tr>
                <tr>
                    <td> No of Shares:</td><td><input type="text" name="noofshares" value='<%=noofshares%>' /></td>
                </tr>
                <tr>
                    <th colspan="3" class="frm"> <input type="submit" value="Save" />
                </tr>
            </table>
        </form>
    </body>
</html>
