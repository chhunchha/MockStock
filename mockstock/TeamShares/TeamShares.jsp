<%-- 
    Document   : TeamShares
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
        <%@ page import="mockstock.beans.teamshares.*"%>
        <%@ page import="mockstock.beans.team.*"%>
        <%@ page import="mockstock.beans.company.*"%>
        <%@ page import="mockstock.dbhandler.*"%>
        <%@ page import="java.util.*"%>
        <jsp:include page="../Common/Header.jsp"></jsp:include>
        <%
            List teamshares = (List) request.getAttribute("teamshares");
            String teamid = request.getAttribute("teamid").toString();
        %>
        
        <title>Team Shares</title>
    </head>
    <body>
        <table class="are" border="0" align="center" width="100%">
            <tr>
                <th class="main" colspan="2">Team Shares</th>
            </tr>
        </table>	
        <div style="overflow: auto; height: 320pt;">
            <table class="are" border="2" align="center" width="80%">
                <tr>
                    <th class="are">Team Id </th>
                    <th class="are">Company Name</th>
                    <th class="are">Shares</th>
                    <th class="are"></th>
                </tr>
                <%
            for (int i = 0; i < teamshares.size(); i++) {
              
                 TeamShares aTeamShares = (TeamShares) teamshares.get(i);
              DBHandler dBHandler = new DBHandler();
                Company aCompany = (Company) dBHandler.getCompany(aTeamShares.getCompanyid()).get(0);
                out.println("<tr>" + "<td>" + aTeamShares.getTeamid() + "</td>" + 
                          "<td>" + aCompany.getName() + "</td>" +
                        "<td>" + aTeamShares.getNoofshares() + "</td>");
                                        
                out.println("<td class='cmd' width='25px'> <form name='updateTeamShares' action='TeamShares/UpdateTeamShares.jsp' method='post'>"
                                        + "<input type='hidden' name='teamid' value='" +aTeamShares.getTeamid() +"'>"
                                        + "<input type='hidden' name='companyid' value='" +aTeamShares.getCompanyid() +"'>"
                                        + "<input type='submit' value='Edit'></form></td>");
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
                    <form name="frmNewTeamShares" action="TeamShares/NewTeamShares.jsp" method="post">
                            <input type="hidden" value=<%=teamid%> name="teamid" id="teamid">
                            <input type="Submit" value="New Team Shares">
                    </form>
                 </td>
            </tr>
        </table>
        <form name="frmRefresh" method="post" action="Ltp"> </form>  
    </body>
</html>
