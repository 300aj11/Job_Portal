<%@page import="com.jobportal.model.CategoriesDAO"%>
<%@page import="com.jobportal.model.JobsDAO"%>
<%@page import="java.sql.ResultSet"%>
<jsp:include page="include_files/dashboard_top_inc.jsp"/>
<%
    session = request.getSession();
    ResultSet user = (ResultSet) session.getAttribute("resultset");
    JobsDAO handler = new JobsDAO();
    ResultSet jobs = handler.selectByAuthor(user.getInt("id"));
%>
<div>
    <h2 class="mb-4">Jobs Created</h2>
    <form class="myform">
        <div class="list-group">
            <%while(jobs.next()){%>
            <a href="job_detail.jsp?id=<%out.print(jobs.getInt("id"));%>" class="list-group-item list-group-item-action-dark">
                <div class="d-flex w-100 justify-content-between">
                    <h5 class="mb-1"><%out.print(jobs.getString("name"));%></h5>
                    <small><%out.print(jobs.getString("created_date"));%></small>
                </div>
                <small>Category Name : <%out.print(new CategoriesDAO().selectName(jobs.getInt("category_id")));%></small>
                <p class="mb-1"><%out.print(jobs.getString("desc").substring(0,200)+"....");%></p>
            </a>
            <button type="button" class="btn btn-danger d-inline-block" onclick="alert('kjcdc');">Mark Close</button>
            <hr>
            <%}%>
        </div>
    </form>
</div>
<jsp:include page="include_files/dashboard_bottom_inc.jsp"/>
