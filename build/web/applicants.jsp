<%@page import="com.jobportal.model.UserDAO"%>
<%@page import="com.jobportal.model.ApplyDAO"%>
<%@page import="com.jobportal.model.CategoriesDAO"%>
<%@page import="com.jobportal.model.JobsDAO"%>
<%@page import="java.sql.ResultSet"%>
<jsp:include page="include_files/dashboard_top_inc.jsp"/>
<%
    session = request.getSession();
    ResultSet user = (ResultSet) session.getAttribute("resultset");
    JobsDAO handler = new JobsDAO();
    ResultSet jobs = handler.selectByAuthor(user.getInt("id"));
    ApplyDAO applyHandle = new ApplyDAO();
    ResultSet applicants = null;
    ResultSet user_name = null;
%>
<div>
    <h2 class="mb-4">Jobs Created</h2>
    <form class="myform">
        <div class="list-group border border-1 border-secondary p-3">
            <%while (jobs.next()) {%>
            <div>
                <a href="job_detail.jsp?id=<%out.print(jobs.getInt("id"));%>">
                    <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1"><%out.print(jobs.getString("name"));%></h5>
                        <small>Category Name : <%out.print(new CategoriesDAO().selectName(jobs.getInt("category_id")));%></small>
                    </div>
                </a>

                <div>
                    <ul class="list-group list-group-flush">
                        <%applicants = applyHandle.selectByJobId(jobs.getInt("id"));
                            if (applicants != null) {
                                while (applicants.next()) {
                        %>
                        <li class="list-group-item">
                            <a href="profile.jsp?id=<%out.print(applicants.getInt("candidate_id"));%>"><div class="fs-6 fw-bold badge bg-info rounded-pill p-2">
                                <i class="bi bi-person-circle me-3"></i>
                                <%user_name = (new UserDAO()).selectName(applicants.getInt("candidate_id"));
                                    out.print(user_name.getString("first_name") + " " + user_name.getString("last_name"));%>
                                <i class="bi bi-arrow-right-short ms-3"></i>
                                </div><br></a>
                            <%out.print(applicants.getString("msg"));%>
                        </li>
                        <%}
                           }%>          
                    </ul>
                </div>
                <hr>
            </div>
            <%}%>
        </div>
    </form>
</div>
<jsp:include page="include_files/dashboard_bottom_inc.jsp"/>




