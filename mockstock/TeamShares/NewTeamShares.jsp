<%-- 
    Document   : NewTeamShares.jsp
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Team</title>
    </head>
    <%
    String teamid = request.getParameter("teamid").toString();
    %>
    <body>
        <form name="frmNewTeamShares" method="post" action="/mockstock/NewTeamShares">
        <table class="frm" align="center">
            <tr>
                <th colspan="2" class="frm"> Team Shares</th>
            </tr>
            <tr>
                <td> Team Id: </td>
                <td>
                    <input type="text" value=<%=teamid%> size=5 disabled>
                    <input type="hidden" name="teamid" value=<%=teamid%>>
                </td>
            </tr>
            <tr>
                <td> Company Name: </td><td>
                    <select name="companyname">
                        
                        <%
                            DBHandler dBHandler = new DBHandler();
                            List companylist = dBHandler.getAllCompanies();
                            for(int i=0;i < companylist.size(); i++)
                            {
                                Company aCompany = (Company) companylist.get(i);
                         %>
                         <option value="<%=aCompany.getName()%>"><%=aCompany.getName()%></option>
                         <%
                            }
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td> No Of Shares:</td>
                <td><input type="text" name="noofshares"></td> 
            </tr>
            <tr>
                <td colspan="2" class='cmd'> <input type="submit" value="Save" />
            </tr>
        </table>
    </form>
    <form name="frmBulkUpload" method="post" action="/mockstock/UploadTeamShares">
        <table align=center>
            <tr>
                <td> For Bulk Upload put comma seprated values :</td>
            </tr>
            <tr>
                <td >
                    <textarea name="teamshares" rows="10" cols="60">TeamId,CompanyName,noofShares
                    </textarea>
                </td>
            </tr>
            <tr>
                <td class='cmd'> <input type="Submit" value="Upload"></td>
            </tr>
        </table>
    </form>
    <form name="frmGoBack" method="post" action="/mockstock/TeamShares">
        <table align=center>
            <tr>
                <td> <input type="submit" value="Go Back to Team shares"> <input type="hidden" value=<%=teamid%> name="teamid"></td>
            </tr>
        </table>
    </form>
    </body>
    
</html>
