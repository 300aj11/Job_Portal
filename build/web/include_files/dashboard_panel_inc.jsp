<%@page import="java.sql.ResultSet"%>
<%
    session = request.getSession();
    ResultSet user = (ResultSet) session.getAttribute("resultset");
%>
<div class="col-3" >
<div class="nav card bg-dark p-0 mb-3 text-white">
                <a href="dashboard.jsp">
                    <div class="card-header text-center" style="border-bottom-color: #ffc451">
                        <h5 style="color:#ffc451"><%out.print(user.getString("role").toUpperCase().trim());%></h5>
                        <img class="rounded-circle my-2" style="width: 100px;border: 2px solid #ffc451" src="assets/img/dummy-person-team.png" alt="img"/><br>
                        <h6 style="color:#ffc451"><%out.print(user.getString("first_name").toUpperCase() + " " + user.getString("last_name").toUpperCase());%></h6>
                    </div>
                </a>
                <a class="btn nav-link text-light" href="edit_profile.jsp">Edit Profile</a>
                <a class="btn nav-link text-light" href="profile_pic.jsp">Profile Picture</a>
                <a class="btn nav-link text-light" href="password.jsp">Change Password</a>
                <a class="btn nav-link text-light" href="logout.jsp">Log out</a>
               <%if (user.getString("role").toLowerCase().trim().equals("seeker")) {%>
               <hr>
                <a class="btn nav-link text-light" href="applied_jobs.jsp">Applied Job</a>
                <%} else if (user.getString("role").toLowerCase().trim().equals("provider")) {%>
                <hr>
                <a class="btn nav-link text-light" href="jobs_created.jsp">Jobs Created</a>
                <a class="btn nav-link text-light" href="applicants.jsp">Applicants</a>
                <a class="btn nav-link text-light" href="create_newjob.jsp">Create New Job</a>
                <%} else {out.print("Error or unspecified user");}%>
                
</div>
</div>