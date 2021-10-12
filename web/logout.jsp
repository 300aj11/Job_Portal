<%-- 
    Document   : LogOut.jsp
    Created on : 23 Jun, 2021, 12:46:36 PM
    Author     : santosh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
          session.getAttribute("email");
          session.setAttribute("email", null);
          session.invalidate();
          response.sendRedirect("index.jsp");
        %>
    </body>
</html>
