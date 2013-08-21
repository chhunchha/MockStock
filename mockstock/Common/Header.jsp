<%-- 
    Document   : Header
    Created on : Sep 19, 2009, 1:12:16 AM
    Author     : ExpertMental
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css" href="css/header.css" />
<%
            if (session == null) {
%>
<script language="javascript">
    document.write("Invalid Session. Closing Window!!!");
    alert("Invalid Session. Closing Window!!!");
    top.window.close();
    //if closing window not allowed then
    top.location="LoggedOut.jsp";
</script>
<%            }
            String user = (String) session.getAttribute("user");
            if (user == null || user == "") {
%>
<script language="javascript">
    //document.write("Invalid Session. Closing Window!!!");
    //alert("Invalid Session. Closing Window!!!");
    //top.window.close();
    //if closing window not allowed then
    top.location="/mockstock/LoggedOut.jsp";
</script>
<%            }
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>mockstock</title>
</head>
<body style="text-align:center">
<table class="header" cellpadding="0" cellspacing="0">
<!--tr>
                <td class="developerinfo">
                   ExpertMental<br>
                   Sumant Chhunchha, mr.chhunchha@gmail.com 
                </td>
            </tr-->
             
            
<tr>
    <td class="header" > 
    <table align="Right" width="80%">
       <tr>
           <!--td width="20%"  align="right" >
               <img height="100px" src="/mockstock/imgs/Bull&BearT.png" />
           </td-->
           <td width="60%" align="center">
               <img height="100px" src="/mockstock/imgs/ShareMandiWithBull&Bear.png" />
           </td>
           <td width="20%" align="left">
               <img height="110" width="150" src="/mockstock/imgs/VIMLogo.png" />
           </td>
       </tr>
    </table>
     
       
    </td>
</tr>
<tr>
    <td>
        <table class="menu" cellpadding="0" cellspacing="0">
            <tr>
                <!--td align=right>
                                <img src="/mockstock/imgs/leftround.PNG">
                            </td-->
                <form id="frmHome" name="frmHome" method="post" action="/mockstock/home.jsp">
                    <td id="home" class="menu" onclick="javascript:document.frmHome.submit()">Home <!--img src="/mockstock/imgs/home1.png"--> </td>
                </form>
                
                <form id="frmCompany" name="frmCompany" method="post" action="/mockstock/Companies">
                    <td id="company" class="menu"  onclick="javascript:document.frmCompany.submit()"> Company <!--img src="/mockstock/imgs/company1.png"--></td>
                </form>
                
                <form id="frmLtp" name="frmLtp" method="post" action="/mockstock/Ltp">
                    <td id="ltp" class="menu"   onclick="javascript:document.frmLtp.submit()"> LTP<!--img src="/mockstock/imgs/ltp1.png"--> </td>
                </form>
                
                <form id="frmTeam" name="frmTeams" method="post" action="/mockstock/Teams">
                    <td id="team" class="menu"  onclick="javascript:document.frmTeams.submit()"> Team <!--img src="/mockstock/imgs/team1.png"--> </td>
                </form>
                
                <!--form id="frmTeamShares" name="frmTeamShares" method="post" action="/mockstock/TeamShares">
                                <td class="menu" onmouseover="className='menuOver'" onmouseout="className='menu'" onclick="javascript:document.frmTeamShares.submit()"> Team Shares </td>
                            </form-->
                <form id="frmTransaction" name="frmTransaction" method="post" action="/mockstock/Transaction/NewTransaction.jsp">
                    <td id="transaction" class="menu" onclick="javascript:document.frmTransaction.submit()"> Transaction<!--img src="/mockstock/imgs/transaction1.png"-->  </td>
                </form>
                <%
                if(user.equalsIgnoreCase("admin")){
                %>
                <form id="frmTransactions" name="frmTransactions" method="post" action="/mockstock/Transactions">
                    <td id="history" class="menu" onclick="javascript:document.frmTransactions.submit()"> Records<!--img src="/mockstock/imgs/history1.png"--> </td>
                </form>
                
              
                <% 
                }
                %>
                
                <form id="frmSensex" name="frmSensex" method="post" action="/mockstock/Sensex/Sensex.jsp">
                    <td id="sensex" class="menu" onclick="javascript:document.frmSensex.submit()"> Sensex<!--img src="/mockstock/imgs/sensex.PNG"--></td>
                </form>
                <!--td align="left">
                                <img src="/mockstock/imgs/rightround.PNG">
                            </td-->
            </tr>
        </table>
    </td>
</tr>
</table>
<div align="right" style="position:absolute;margin-top:-130px;margin-left:10px"> <font face="Verdana" style="font-weight:bold;color: White ;">Welcome <%=user%> <a href="/mockstock/LoggedOut.jsp"><img src="/mockstock/imgs/logout.png" style="border:0;"></a></font></div>
</body>
</html>
