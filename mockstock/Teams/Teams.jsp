<%-- 
    Document   : Teams
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
        <%@ page import="mockstock.beans.team.*"%>
        <%@ page import="mockstock.beans.ltp.*"%>
        <%@ page import="mockstock.beans.teamshares.*"%>
        <%@ page import="mockstock.dbhandler.*"%>
        <%@ page import="java.util.*"%>
        <jsp:include page="../Common/Header.jsp"></jsp:include>
        <%
            List teams = (List) request.getAttribute("teams");
            String user = (String) session.getAttribute("user");
        %>
        
        <title>Teams</title>
    </head>
    <body>
        <table class="are" border="0" align="center" width="100%">
            <tr>
                <th class="main">Teams</th>
            </tr>
        </table>	
        <div style="overflow: auto; height: 320pt;">
            <table class="are" border="2" align="center" width="80%">
                <tr>
                    <th class="are">Team Id </th>
                    <th class="are">Cash</th>
                    <th class="are">Share Value</th>
                    <th class="are">Total</th>
                     <%
            if (user.equalsIgnoreCase("admin")) {
                    %>
                    <th class="are"></th>
                       <%            }
                    %>
                </tr>
                <%
               
            for (int i = 0; i < teams.size(); i++) {
                Team aTeam = (Team) teams.get(i);
                DBHandler dBHandler = new DBHandler();
                float shareValue = 0;

                List teamSharesList = dBHandler.getTeamShares(aTeam.getTeamid());

                for (int j = 0; j < teamSharesList.size(); j++) {
                    TeamShares teamShares = (TeamShares) teamSharesList.get(j);
                    Ltp aLtp = (Ltp) dBHandler.getLtp(teamShares.getCompanyid()).get(0);
                    shareValue = shareValue + (aLtp.getLtp() * teamShares.getNoofshares());
                }
                Float total = aTeam.getCash() + shareValue;
                out.println("<tr>" + "<td>" + aTeam.getTeamid() + "</td>" +
                        "<td>" + aTeam.getCash() + "</td>" +
                        "<td>" + shareValue + "</td>" +
                        "<td>" + total + "</td>");
              
                 if (user.equalsIgnoreCase("admin")) {
                      out.println("<td class='cmd' width='50px'>" +
                        "<table>" +
                        "<tr>" +
                        "<td> " );
                        out.println("<form name='frmTeamShares' action='TeamShares' method='post'>" + "<input type='hidden' name='teamid' value='" + aTeam.getTeamid() + "'>" + "<input type='submit' value='Shares'>" +
                        "</form>");
                 
                        out.println("</td>");
                out.println("<td>");
               
                    out.println("<form name='updateTeam' action='Teams/UpdateTeam.jsp' method='post'>" + "<input type='hidden' name='teamid' value='" + aTeam.getTeamid() + "'>" + "<input type='submit' value='Edit'>" +
                            "</form>");
                    out.println("</td>" +
                        "</table>" +
                        "</td>");
                }

                
                out.println("</tr>");

            }
                %>
            </table>
        </div>
        <table class="are" align="center" width="100%">
            <tr>
                <!--td align=right>
                    <form name="frmUploadLtps" method="post" action="UploadLtps">
                        Upload Ltp details using CSV file : <input type="file" name="fileLtp" id="fileLtp"  /> <input type="Submit" name="btUpload" id="btUpload" value="Upload" />
                    </form>
                    
                </td-->
                <td class="cmd" align="right">
                    <%
            if (user.equalsIgnoreCase("admin")) {
                    %>
                    <form name="frmNewteam" action="Teams/NewTeam.jsp" method="post">
                        <input type="Submit" value="New Team">
                    </form>
                   
                    <%            }
                    %>
                </td>
                <td align="right" class="cmd">
                     <form name="frmTopTeams" action="/mockstock/TopTeams" method="post">
                        <input type="Submit" value="Top Teams">
                    </form>
                </td>
            </tr>
        </table>
       
        <!--form name="frmRefresh" method="post" action="Ltp"> </form-->
        
    </body>
</html>
