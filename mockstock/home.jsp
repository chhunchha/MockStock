<%-- 
    Document   : index
    Created on : Jan 1, 2008, 3:11:57 AM
    Author     : ExpertMental
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   <jsp:include page="Common/Header.jsp"></jsp:include>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        String msg="";
        if(request.getAttribute("msg") != null )
            msg = request.getAttribute("msg").toString();
    %>
    
    <body background=black>
        <table align="right" >
         <tr>
                <th> <%=msg%> </th>
        </tr>   
        <tr>
        <form id="frmBackup" name="frmBackup" method="post" action="/mockstock/Backup">
                    <td align="right"><input type="text" value="c:\" name="path" id="path"><input type="submit" value="Take Backup" >
                    </td>
        
        </form>
        </tr>
    </table>
        <table width=100% border=0 style="margin-top:30px">
            <tr>
                <td >
                    <img src="imgs/aboutme.png" height=250 width=750 />
                </td>
            </tr>
        </table>
        
    </body>
</html>
