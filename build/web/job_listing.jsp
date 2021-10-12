<%-- 
    Document   : job_listing.jsp
    Created on : 22 Jun, 2021, 1:17:12 PM
    Author     : Win-10
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.jobportal.services.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jobportal.model.JobsDAO"%>
<%@page import="com.jobportal.model.CategoriesDAO"%>
<%//@page import="java.sql.PreparedStatement"%>
<%//@page import="com.jobportal.services.DBConnection"%>
<%//@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%
    /*try{
        Connection con = DBConnection.myMethod();
        String sql = "select * from jobcategory ";
        PreparedStatement ps = con.prepareStatement(sql);
        categoriesList = ps.executeQuery();
    } catch (Exception e) {
            e.printStackTrace();
    }*/
    CategoriesDAO categorieshandler = new CategoriesDAO();
    ResultSet categoriesList = categorieshandler.select();
%>
<jsp:include page="include_files/top_inc.jsp"/>

<section class="breadcrumbs">
    <div class="container">

        <div class="d-flex justify-content-between align-items-center">
            <h2>Jobs and Categories List</h2>
            <ol>
                <li><a href="index.jsp">Home</a></li>
                <li>List</li>
            </ol>
        </div>

    </div>
</section>

<section class="inner-page">
    <div class="container col-lg-8 mt-0 mt-lg-0">
        <div class="accordion" id="accordionExample">
            <% while (categoriesList.next()) {
                String categoryName = categoriesList.getString("name");
                String heading = "heading"+categoryName;
                String collapse = "collapse"+categoryName;
                int i = categoriesList.getInt("id");%>

            <div class="accordion-item">
                <h2 class="accordion-header" id="<%out.print(heading);%>">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="<%out.print(collapse);%>" aria-expanded="true" aria-controls="<%out.print(collapse);%>">
                        <%out.print(categoryName.toUpperCase());%>
                    </button>
                </h2>
                <div id="<%out.print(collapse);%>" class="accordion-collapse collapse show" aria-labelledby="<%out.print(heading);%>" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        <div class="list-group">

                           <%Connection con = DBConnection.myMethod();
                            String sql = "select * from jobs where category_id =?";
                            PreparedStatement ps = con.prepareStatement(sql);
                            ps.setInt(1, i);
                            ResultSet jobs = ps.executeQuery();
                           while(jobs.next()){%>
                           <a href="job_detail.jsp?id=<%out.print(jobs.getInt("id"));%>"><div class="list-group-item list-group-item-action m-1 rounded-3"><%out.print(jobs.getString("name"));%><i class="bi bi-arrow-right-circle position-absolute end-0 mx-3"></i></div></a>
                          <% } %>

                        </div>
                    </div>
                </div>
            </div>
            <% }%>
        </div>
    </div>
</section>

<jsp:include page="include_files/bottom_inc.jsp"/>
