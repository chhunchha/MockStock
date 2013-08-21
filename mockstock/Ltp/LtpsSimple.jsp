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
        <%@ page import="mockstock.beans.sensex.*"%>
        <%@ page import="java.util.*"%>
        <%
            List ltps = (List) request.getAttribute("ltps");
            int rangeinpercentage = 10;

            DBHandler dBHandler = new DBHandler();
            int size = dBHandler.getAllSensex().size();
            double sensex = 0;
            double diff=0;
            String diffS="";
            String status = "";
            if (size != 0) {
                sensex = ((Sensex) dBHandler.getAllSensex().get(size - 1)).getValue();
                if (size >= 2) {
                    status = ((Sensex) dBHandler.getAllSensex().get(size - 1)).getStatus();
                    diff = sensex - ((Sensex) dBHandler.getAllSensex().get(size - 2)).getValue();
                    if (diff < -1) {
                        diff = diff * -1;

                    }
                    diffS = Double.toString(diff);
                    if (diffS.length() > diffS.indexOf(".") + 3) {
                        diffS = diffS.substring(0, diffS.indexOf(".") + 3);
                    }
                }
                status = ((Sensex) dBHandler.getAllSensex().get(size - 1)).getStatus();
            }
        %>
        
        <title>Ltps</title>
        <script LANGUAGE="JavaScript">
    
            function callAgain()
            {
                window.setTimeout('document.frmRefresh.submit()',5000);
            }
        </script>
    </head>
    <body onload="callAgain()">
        <table class="are" border="0" width="100%" align="center">
            <tr>
                <th class="main" style="font-size:10px;" width=200px>Sumant Chhunchha - 9970158473</th>
                <th class="main"><img height="30px" src="/mockstock/imgs/mockstockwithbull.PNG" /></th>
                
                <th width="150px" class="main" align="right"> <%=sensex%></th>
                <%
                if (status.equalsIgnoreCase("up")) {
                %>
                <th width=30px class="main" align="left"><img src="/mockstock/imgs/up.PNG"></th>
                <%                } else {
                %>
                <th width=30px class="main" align="left"><img src="/mockstock/imgs/down.PNG"></th>
                <%            }
                %>
                <th width=100px class="main" align="left"><%=diffS%></th>
            </tr>
        </table>	
        <div style="overflow: auto; height: 340pt;">
            <table class="are" border="2" style="border-color:black;" width="80%" align="center">
                <tr>
                    <!--th class="are">Id </th-->
                    <th class="are">Company</th>
                    <th class="are">Share Price</th>
                      <th class="are"> By points </th>
                    <th class="are">Range </th>
                </tr>
                <%
            for (int i = 0; i < ltps.size(); i++) {
                Ltp aLtp = (Ltp) ltps.get(i);
                Company aCompany = (Company) (new DBHandler().getCompany(aLtp.getCompanyid()).get(0));

                if (aLtp.getStatus().equalsIgnoreCase("down")) {
                    out.println("<tr style='background-color:red;'>");
                } else if (aLtp.getStatus().equalsIgnoreCase("up")) {
                    out.println("<tr style='background-color:blue;'>");
                } else {
                    out.println("<tr style='background-color: gray;'>");
                }
                out.println("<td class='company'>" + aCompany.getName() + "</td>" + "<td class='company'>" + aLtp.getLtp() + "</td>"  + "<td class='company'>" + aLtp.getDiff() + "</td>");
                out.println("<td class='company'>" + (aLtp.getLtp() - (aLtp.getLtp() / rangeinpercentage)) + " - " + (aLtp.getLtp() + (aLtp.getLtp() / rangeinpercentage)) + "</td>");

                out.println("</tr>");

            }
                %>
            </table>
        </div>
        <table class="are" width="100%" align="center">
            <tr>
                <!--td align=right>
                <form name="frmUploadLtps" method="post" action="UploadLtps">
                    Upload Ltp details using CSV file : <input type="file" name="fileLtp" id="fileLtp"  /> <input type="Submit" name="btUpload" id="btUpload" value="Upload" />
                </form>
               
            </td-->
                <td align=right class='cmd'>
                    <form name="frmOriginalLtp" methog="post" action="Ltp"><input type="submit" value="Show Original Page" /></form>
                </td>
            </tr>
        </table>
        <form name="frmRefresh" method="post" action="Ltp"><input type="hidden" name="type" value="simple"/> </form>
        
    </body>
</html>
