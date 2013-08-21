<%-- 
    Document   : Error
    Created on : Jan 1, 2008, 1:42:10 AM
    Author     : ExpertMental
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="../Common/Header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="css/TableView.css" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <table align=center width="100%" border="0" valign="middle" style="margin-top:200px"> 
            <tr>
                <th class="main"> Error occured : <%=request.getAttribute("error")%> </th>
            </tr>
        </table>
    </body>
</html>
