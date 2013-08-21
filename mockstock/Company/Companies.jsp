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
        <%@ page import="mockstock.beans.company.*"%>
        <%@ page import="java.util.*"%>
        <jsp:include page="../Common/Header.jsp"></jsp:include>
        <%
            List companies = (List) request.getAttribute("companies");
            String user = (String) session.getAttribute("user");
        %>
        
        <title>Companies</title>
    </head>
    <body>
        <table class="are" border="0" width="100%" align="center">
            <tr>
                <th class="main">Companies</th>
            </tr>
        </table>	
        <div style="overflow: auto; height: 300pt;">
            <table class="are" border="2" width="80%" align="center">
                <tr>
                    <th class="are">Company Id </th>
                    <th class="are">Name </th>
                    <th class="are">Share Price</th>
                    <th class="are">Lot</th>
                      <%
            if (user.equalsIgnoreCase("admin")) {
                    %>
                    <th class="are"></th>
                       <%            }
                    %>
                </tr>
                <%
            for (int i = 0; i < companies.size(); i++) {
                Company aCompany = (Company) companies.get(i);

                out.println("<tr>" + "<td>" + aCompany.getCompanyid() + "</td>" + "<td>" + aCompany.getName() + "</td>" + "<td>" + aCompany.getPrice() + "</td>" + "<td>" + aCompany.getLot() + "</td>");
               
                
                if (user.equalsIgnoreCase("admin")) {
                    out.println("<td class='cmd' width='25px'>");
                    out.println("<form name='updateCompany' action='Company/UpdateCompany.jsp' method='post'>" + "<input type='hidden' name='companyid' value='" + aCompany.getCompanyid() + "'>" + "<input type='submit' value='Edit'></form></td>");
                }
                out.println("</tr>");

            }
                %>
            </table>
        </div>
        <table class="are" width="100%" align="center">
            <tr>
                <td class='cmd'>
                    <%
            if (user.equalsIgnoreCase("admin")) {
                    %>
                    
                    <form name="frmNewComapny" action="Company/NewCompany.jsp" method="post">
                        <input type="Submit" value="New Company">
                    </form>
                    <%            }
                    %>
                </td>
                <!--td>
                <form name="frmUploadCompanies" method="post" action="UploadCompanies">
                    Upload Company details using CSV file : <input type="file" name="fileCompany" id="fileCompany" /> <input type="Submit" name="btUpload" id="btUpload" value="Upload" />
                </form>
                </td-->
            </tr>
        </table>
        
    </body>
</html>
