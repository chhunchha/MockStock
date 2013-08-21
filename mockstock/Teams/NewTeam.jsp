<%-- 
    Document   : NewTeam.jsp
    Created on : Jan 1, 2008, 1:28:16 AM
    Author     : ExpertMental
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="mockstock.beans.team.*"%>
<%@ page import="mockstock.dbhandler.*"%>
<%@ page import="java.util.*"%>
<link rel="stylesheet" type="text/css" href="/mockstock/css/header.css" />
<link rel="stylesheet" type="text/css" href="/mockstock/css/TableView.css" />
<jsp:include page="../Common/Header.jsp"></jsp:include>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Team</title>
    </head>
    <body>
        <br>
        <form name="frmNewTeam" method="post" action="/mockstock/NewTeam">
        <table class="frm" align="center">
            <tr>
                <th colspan="2" class="frm"> Team</th>
            </tr>
            <tr>
                <td> Team Id: </td><td><input type="text" name="teamid"></td>
            </tr>
            <tr>
                <td> Cash: </td><td><input type="text" name="cash" /></td>
            </tr>
            <tr>
                <td colspan="2" class='cmd'> <input type="submit" value="Save" />
            </tr>
        </table>
    </form>
    <form name="frmBulkUpload" method="post" action="/mockstock/UploadTeams">
        <table align=center>
            <tr>
                <td> For Bulk Upload put comma seprated values :</td>
            </tr>
            <tr>
                <td >
                    <textarea name="teams" rows="10" cols="60">id1,cash
                    </textarea>
                </td>
            </tr>
            <tr>
                <td class='cmd'> <input type="Submit" value="Upload"></td>
            </tr>
        </table>
    </form>
    </body>
</html>
