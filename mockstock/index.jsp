<%-- 
    Document   : index
    Created on : Jan 1, 2008, 3:11:57 AM
    Author     : ExpertMental
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   <% 
	String reason=( String )request.getAttribute("error");
	if(reason == null)
		reason = "";
	
%> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            th
            {
                text-align: center;
            }
            table.outer
            {
                border: 0px solid #CCCCCC;
                width: 100%;
                height: 600px;
                font-size: 16px;
                font-family: verdana;
                color: white;
                background-image: url("/mockstock/imgs/LoginPage.png"); 
                background-repeat: no-repeat;
                background-position: center;
                position:absolute;
                margin-top: 70px;
            }
            table.inner
            {
                border: 4px solid #CCCCCC;
                border-style: groove;
                font-family: verdana;
                font-weight: bold;
                font-size: 16px;
            }
        </style>
    </head>
    <body style="background-color:black;">
       <table align="center" class="outer">
           <tr>
               <td>
                   <form name="frmLogin" action="Authenticate" method="post">
                   <table  align="center" border=0>
                     <tr>
                                <th colspan="3">
                                    <img src="/mockstock/imgs/ShareMandiWithBull&Bear.png ">
                                </th>
                            </tr>
                            <tr>
                              
                                <td>
                                    <table class="inner" align="right">
                                        <tr>
                                            <td align=right>User Id:</td>
                                            <td><input type="text" name="userid" id="userid" size=25></td>
                                        </tr>
                                        <tr>
                                            <td align=right> Password: </td>
                                            <td> <input type="password" name="password" id="password" size=10></td>
                                        </tr>
                                        <tr>
                                            <th colspan="2"> <input type="Submit" name="btnLogin" id="btnLogin" value="Login"></th>
                                        </tr>
                                    </table>
                                </td>
                                <td valign="top" align=center>
                                    <img src="/mockstock/imgs/VIMLogo.png" width="140" height="140" />
                                </td>
                                 <!--td valign="top">
                                    <img src="/mockstock/imgs/Bull&BearT.png" width="160" height="160"/>
                                </td-->
                                  
                                    
                            </tr>
                            
                        <tr>
                                    <th colspan="3">
                                            <font color="red" ><%=reason%></font>
                                    </th>
                            </tr>
                </table>
                
            </form>
        </td>
    </tr>
</table>
  <table align="right" style="color:white;">
        <tr>
                <td><br> Supported Browsers : Firfox 2.x and above 
                </td>
        </tr>
        <tr>
                <td>
                        Best viewed in : 1028 by 1024 pixels
                </td>
        </tr>
    </table>
</body>
</html>
