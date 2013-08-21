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
<%
            String msg ="";
            if(request.getAttribute("msg")!=null)
            {   
                msg = request.getAttribute("msg").toString();
            }
            DBHandler dBHandler = new DBHandler();


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Team</title>
        <script type="text/javascript">
            
            function calculateTotal()
            {
                var noofshares = document.getElementById("noofshares").value;
                var price = document.getElementById("price").value;
                   
                if(noofshares!=null && price!=null){
                    var total = noofshares * price;
                    document.getElementById("total").value = total;
                }
            }
            
            function validate()
            {
                var buyingteamid = document.getElementById("buyingteamid").value;
                var sellingteamid = document.getElementById("sellingteamid").value;
                var companyname = document.getElementById("companyname").value;
                var price = document.frmNewTransaction.price.value;
                var noofshares = document.frmNewTransaction.noofshares.value;
                var total = document.frmNewTransaction.total.value;
                
                if(price== null || noofshares==null || price == 0 || noofshares == 0 || total == 0)
                {
                    alert("Are you sure all data is correct. It seems problem with price or no of shares!!!");
                }
                else if(buyingteamid==sellingteamid){
                    alert("Selling team and buying team could not be the same!!!");
                }
                else{
                    document.frmNewTransaction.submit();
                }
            }
        </script>
    </head>
    
    <body>
        <br>
        <form name="frmNewTransaction" method="post" action="/mockstock/NewTransaction">
            
            <table class="frm" align="center">
                <tr>
                    <th colspan="2" class="frm"> Transaction</th>
                </tr>
                <tr>
                    <td> Selling Team Id: </td>
                    <td>
                        <select name="sellingteamid" id="sellingteamid">
                            <%
            List teamlist = dBHandler.getAllTeams();
            for (int i = 0; i < teamlist.size(); i++) {
                Team aTeam = (Team) teamlist.get(i);
                            %>
                            <option value="<%=aTeam.getTeamid()%>"><%=aTeam.getTeamid()%></option>
                            <%
            }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td> Buying Team Id: </td>
                    <td>
                        <select name="buyingteamid" id="buyingteamid">
                            <%
            teamlist = dBHandler.getAllTeams();
            for (int i = 0; i < teamlist.size(); i++) {
                Team aTeam = (Team) teamlist.get(i);
                            %>
                            <option value="<%=aTeam.getTeamid()%>"><%=aTeam.getTeamid()%></option>
                            <%
            }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td> Company Name: </td><td>
                        <select name="companyname" id="companyname">
                            
                            <%
            dBHandler = new DBHandler();
            List companylist = dBHandler.getAllCompanies();
            for (int i = 0; i < companylist.size(); i++) {
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
                    <td><input type="text" id="noofshares" name="noofshares" value="0" onkeyup="javascript:calculateTotal();"></td> 
                </tr>
                <tr>
                    <td> Price:</td>
                    <td><input type="text" id="price" name="price" value="0" onkeyup="javascript:calculateTotal();"></td> 
                </tr>
                <tr>
                    <td> Total: </td>
                    <td><input disabled type="text" id="total" name="total" value="0" style="color: Red;"></td> 
                </tr>
                <tr>
                    <td class='cmd' align="center" colspan="2"> <input type="Button" value="Commit" onclick="javascript:validate();"/>
                </tr>
            </table>
        </form>
        <h2><%= msg%></h2>
        <p>
            <form name="FrmRefresh" action="/mockstock/Transaction/NewTransaction.jsp">
                <input type="Submit" value="Refresh" />
            </form>
        </p>
    </body>
</html>
