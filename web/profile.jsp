<%-- 
    Document   : profile
    Created on : 27 Jun, 2021, 11:53:36 AM
    Author     : Win-10
--%>

<jsp:include page="include_files/top_inc.jsp"/>

<section class="breadcrumbs">
    <div class="container">

        <div class="d-flex justify-content-between align-items-center">
            <h2>Profile</h2>
            <ol>
                <li><a href="index.jsp">Home</a></li>
                <li>Profile</li>
            </ol>
        </div>

    </div>
</section>

<section class="inner-page">
    <div class="container">
        <div class="col-8 mx-auto"><jsp:include page="include_files/profile_widget_inc.jsp"/></div>
    </div>
</section>

<jsp:include page="include_files/bottom_inc.jsp"/>
