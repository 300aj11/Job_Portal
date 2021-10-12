<%@page import="java.sql.ResultSet"%>
<%
    session = request.getSession();
    ResultSet user = (ResultSet) session.getAttribute("resultset");
    String page_name = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1);
%>
<header id="header" class="fixed-top header-inner-pages">
    <div class="container d-flex align-items-center justify-content-lg-between">

        <h1 class="logo me-auto me-lg-0"><a href="index.jsp">JOB PORTAL<span>.</span></a></h1>

        <nav id="navbar" class="navbar order-last order-lg-0">
            <ul>
                <li><a class="nav-link scrollto" href="index.jsp#">Home</a></li>
                <li><a class="nav-link scrollto" href="index.jsp#about">About</a></li>
                <li><a class="nav-link scrollto" href="index.jsp#services">Services</a></li>
                <li><a class="nav-link scrollto" href="index.jsp#contact">Contact</a></li>
                <% if(user!=null) { %><li><a class="nav-link" href="dashboard.jsp">Dashboard</a></li><%}%>
                <li><a class="nav-link scrollto" href="job_listing.jsp">Job Categories</a></li>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav>
        <% String link,text;
        if (user != null) { 
            link = "logout.jsp";
            text = "Log Out";
        } else {
            if (page_name.equals("login.jsp")) {
                link = "registration.jsp";
                text = "Registration";
            } else {
                link = "login.jsp";
                text = "Login";
            }%>
        <%}%>
        <a  href = "<%out.print(link);%>" class="get-started-btn"><%out.print(text);%></a >
    </div>
</header>
<!--<nav id="navbar" class="navbar order-last order-lg-0">
    <ul>
        <li class="dropdown"><a href="#" class="get-started-btn"><i style="color:#ffd584" class=" fs-5 bi bi-person-circle"></i>&nbsp;&nbsp;&nbsp;<i class="bi bi-chevron-down"></i>&nbsp;&nbsp;&nbsp;</a>
            <ul>
                <li><a href="#">Settings</a></li>
                <li><a href="logout.jsp">Log Out</a></li>
            </ul>
        </li>
    </ul>
    <i class="bi bi-list mobile-nav-toggle"></i>
</nav>-->