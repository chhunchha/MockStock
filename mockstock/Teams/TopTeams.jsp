<%-- 
    Document   : TopTeams
    Created on : Jan 28, 2010, 4:13:59 AM
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
            <table class="are" border="2" align="center" width="60%">
                <tr>
                    <th class="are">Team Id </th>
                    <th class="are">Total</th>
                </tr>
                <%
               TreeMap<Float,String> teamsSorted = new TreeMap<Float,String>();
               
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
                    teamsSorted.put(total,aTeam.getTeamid());

               }

                 Set<Map.Entry<Float,String>> set = teamsSorted.entrySet();
                 
                 for(Map.Entry<Float,String> me : set){
                      out.println("<tr>" + "<td>" + me.getValue() + "</td>" +
                        "<td>" + me.getKey() + "</td>");
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
                <td class="cmd">
                 
                </td>
            </tr>
        </table>

    </body>
</html>
