<%-- 
    Document   : Company.jsp
    Created on : Jan 1, 2008, 1:28:16 AM
    Author     : ExpertMental
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="mockstock.beans.company.*"%>
<%@ page import="mockstock.dbhandler.*"%>
<%@ page import="java.util.*"%>
<link rel="stylesheet" type="text/css" href="/mockstock/css/header.css" />
<link rel="stylesheet" type="text/css" href="/mockstock/css/TableView.css" />
<jsp:include page="../Common/Header.jsp"></jsp:include>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Company</title>
    </head>
    <body>
        <form name="frmNewCompany" method="post" action="/mockstock/NewCompany">
        <table class="frm" align="center">
            <tr>
                <th colspan="2" class="frm"> Company</th>
            </tr>
            <tr>
                <td> Company Id: </td><td><input type="text" name="companyid"></td>
            </tr>
            <tr>
                <td> Name: </td><td><input type="text" name="name" /></td>
            </tr>
            <tr>
                <td> Price: </td><td><input type="text" name="price" /></td>
            </tr>
            <tr>
                <td> Lot: </td><td><input type="text" name="lot" /></td>
            </tr>
            <tr>
                <td colspan="2" class='cmd' align="center"> <input type="submit" value="Save" /></td>
            </tr>
        </table>
    </form>
    <form name="frmBulkUpload" method="post" action="/mockstock/UploadCompanies">
        <table align=center>
            <tr>
                <td> For Bulk Upload put comma seprated values :</td>
            </tr>
            <tr>
                <td >
                    <textarea name="companies" rows="10" cols="60">id1,companyname,price,lot
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
