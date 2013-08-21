<%-- 
    Document   : Sensex
    Created on : Jan 1, 2008, 3:13:28 AM
    Author     : ExpertMental
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%
            DBHandler dBHandler = new DBHandler();
            int size = dBHandler.getAllSensex().size();
            double sensex = 0;
            double diff = 0;
            String diffS = "";
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
            }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sensex</title>
        
        <%@ page import="mockstock.beans.sensex.*"%>
        <%@ page import="mockstock.dbhandler.*"%>
        <%@ page import="java.util.*"%>
        <script language="javascript" type="text/javascript" src="/mockstock/js/jquery.js"></script>
        <script language="javascript" type="text/javascript" src="/mockstock/js/jquery.flot.js"></script>
        <link href="/mockstock/css/layout.css" rel="stylesheet" type="text/css"></link>
        <!--[if IE]><script language="javascript" type="text/javascript" src="../excanvas.pack.js"></script><![endif]-->
        
        <link type="text/css" rel="stylesheet" href="/mockstock/css/visualize.jQuery.css"/>
        <link type="text/css" rel="stylesheet" href="/mockstock/css/demopage.css"/>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
        <!--[if IE]><script type="text/javascript" src="/mockstock/js/excanvas.compiled.js"></script><![endif]-->
        <script type="text/javascript" src="/mockstock/js/visualize.jQuery.js"></script>
        
        <script type="text/javascript">
            $(function(){
                //make some charts
                //$('table').visualize({type: 'pie', pieMargin: 10, title: '2009 Total Sales by Individual'});	
                //$('table').visualize({type: 'line'});
                $('table').visualize({type: 'area', width: '600', height: '200'});
                //$('table').visualize();
            });
            

            function callAgain()
            {
                window.setTimeout('document.frmRefresh.submit()',40000);
            }

        </script>
       
    </head>
    
    <body onload="callAgain()" >
        <div align=left style="height:50px;border:0px solid #CCCCCC;color:Yellow;background-image:url('/mockstock/imgs/backgroundflowers.png');background-position:left;background-repeat:no-repeat;">
            <h1>Sensex : <%=sensex%>
                
                <%
            if (status.equalsIgnoreCase("up")) {
                %>
                <img src="/mockstock/imgs/up.PNG">
                <%                } else {
                %>
                <img src="/mockstock/imgs/down.PNG">
                <%            }
                %>
            <%=diffS%></h1>
        </div>
        <%

            //List sensexs =  (List) request.getAttribute("data");
            dBHandler = new DBHandler();
            List sensexs = (List) dBHandler.getAllSensex();
            out.println("<table style='color:white;width:10px;height:10px'>" +
                    "<caption>Sensex</caption>" +
                    "<thead>" +
                    "<tr>");
            out.println("<td></td>");
            int start = 25;
            if(sensexs.size()<25) start = sensexs.size();
            for (int i = start; i > 0; i--) {
                Sensex aSensex = (Sensex) sensexs.get(sensexs.size()-i);
                out.println("<th>" + "" + "</th>");
            }
            out.println("</tr>" +
                    "</thead>" +
                    "<tbody>" +
                    "<tr>" +
                    "<th>Sensex</th>");
            for (int i = start; i > 0; i--) {
                Sensex aSensex = (Sensex) sensexs.get(sensexs.size()-i);
                out.println("<td>" + (aSensex.getValue()-9500) + "</td>");
            }
            out.println("</tr>" +
                    "</tbody>" +
                    "</table>");
        %>
        
        <form name="frmRefresh" methog="post" action="/mockstock/Sensex/Sensex.jsp"></form>
        
         <%
            dBHandler = new DBHandler();
            List ltps = dBHandler.getAllLtps();
            
        %>
        <br>
            <font face=verdana" >
        <marquee behaviour="slide" direction="left" width=100% bgcolor="yellow" scrolldelay=150>
            <%
            for(int i=0; i < ltps.size() ; i++)
            {
                mockstock.beans.ltp.Ltp aLtp = ( mockstock.beans.ltp.Ltp) ltps.get(i);
                mockstock.beans.company.Company aCompany = (mockstock.beans.company.Company) (new DBHandler().getCompany(aLtp.getCompanyid()).get(0));
                out.print("<font style='font-weight:bold;'>" + aCompany.getName() + "</font> " + aLtp.getLtp());
                if(aLtp.getStatus().equalsIgnoreCase("down")){
                    out.print("<img src='/mockstock/imgs/down.PNG' height=15px>");
                }
                 else{
                    out.print("<img src='/mockstock/imgs/up.PNG' height=15px>");
                }
                out.print(aLtp.getDiff());
                out.print("&nbsp;&nbsp;&nbsp;&nbsp;");
            }
            %>
        </marquee>
        <marquee behaviour="slide" direction="right" width=100%  bgcolor="yellow"  scrolldelay=150  >
            <%
            for(int i=0; i < ltps.size() ; i++)
            {
                mockstock.beans.ltp.Ltp aLtp = ( mockstock.beans.ltp.Ltp) ltps.get(i);
                mockstock.beans.company.Company aCompany = (mockstock.beans.company.Company) (new DBHandler().getCompany(aLtp.getCompanyid()).get(0));
               out.print("<font style='font-weight:bold;'>" + aCompany.getName() + "</font> " + aLtp.getLtp());
                if(aLtp.getStatus().equalsIgnoreCase("down")){
                    out.print("<img src='/mockstock/imgs/down.PNG' height=15px>");
                }
                 else{
                    out.print("<img src='/mockstock/imgs/up.PNG' height=15px>");
                }
                out.print(aLtp.getDiff());
                out.print("&nbsp;&nbsp;&nbsp;&nbsp;");
            }
            %>
        </marquee>
    </font>
    </body>
</html>
