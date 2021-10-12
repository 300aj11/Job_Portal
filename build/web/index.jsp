<%-- 
    Document   : index
    Created on : 21 Jun, 2021, 9:35:33 AM
    Author     : Win-10
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="include_files/head_inc.html"/>
    <body>
        <jsp:include page="include_files/header_inc.jsp"/>
        <jsp:include page="include_files/hero_inc.jsp"/>
        <main id="main">
            <jsp:include page="include_files/about_inc.jsp"/>
            <jsp:include page="include_files/services_inc.jsp"/>
            <jsp:include page="include_files/contact_inc.jsp"/>
        </main>
        <jsp:include page="include_files/footer_inc.jsp"/>
        <jsp:include page="include_files/scripts_inc.html"/>
    </body>
</html>
