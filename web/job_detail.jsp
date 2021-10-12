<%-- 
    Document   : job_detail
    Created on : 22 Jun, 2021, 5:28:13 PM
    Author     : Win-10
--%>
<%@page import="com.jobportal.model.ApplyDAO"%>
<%@page import="com.jobportal.model.CategoriesDAO"%>
<%@page import="com.jobportal.model.JobsDAO"%>
<%@page import="java.sql.ResultSet"%>
<jsp:include page="include_files/top_inc.jsp"/>
<%
    session = request.getSession();
    ResultSet user = (ResultSet) session.getAttribute("resultset");
    JobsDAO jobsHandler = new JobsDAO();
    ResultSet job = jobsHandler.selectById(Integer.parseInt(request.getParameter("id")));
    CategoriesDAO catHandler = new CategoriesDAO();
    String category = catHandler.selectName(job.getInt("category_id"));
%>

<section class="breadcrumbs">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h2>Job</h2>
            <ol>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="job_listing.jsp">List</a></li>
                <li>Job</li>
            </ol>
        </div>
    </div>
</section>

<section class="inner-page">
    <div class="container">
        <%if (request.getParameter("error") != null) {%>
        <div class="alert alert-danger text-center " role="alert">
            <%out.print(request.getParameter("error"));%>
        </div>
        <%}%> 
        <%if (request.getParameter("success") != null) {%>
        <div class="alert alert-success text-center " role="alert">
            <%out.print(request.getParameter("success"));%>
        </div>
        <%}%> 
        <div class="card">
            <div class="card-header">
                <%out.print(category);%>
            </div>
            <div class="card-body">
                <h5 class="card-title"><%out.print(job.getString("name"));%></h5>
                <p class="card-text"><%out.print(job.getString("desc"));%></p>
                <p class="card-text">Pay : <%out.print(job.getString("wages"));%></p>
                <p class="card-text">Contact Number : <%out.print(job.getString("mobile_num"));%></p>
                <p class="card-text">Address: <%out.print(job.getString("address"));%></p>

                <!-- Button trigger modal -->
                <%if(user.getString("role").equals("seeker")){
                if((new ApplyDAO()).isAlreadyApplied(user.getInt("id"), job.getInt("id"))){%>
                <button type="button" class="btn btn-primary" <%if(user==null){out.print("disabled");}%> data-toggle="modal" data-target="#exampleModal">Apply</button>
                <%if(user==null){%>
                <a href="login.jsp?return_page=<%out.print(request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1)+"&job_id="+request.getParameter("id"));%>">To Apply in this job, You Need to be Login with a seeker account.</a>
                <%}}else{out.print("You Already Applied in this Job");}}%>
                <% if (user != null) { %>
                
                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <form action="Apply">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Application For Job of <%out.print(job.getString("name"));%></h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                Say some nice words, that will be seen by your employer.<br>
                                <textarea name="msg" id="msg" rows="6" style="width:100%"></textarea>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                
                                    <input type="hidden" name="job_id" value="<%out.print(job.getInt("id"));%>"/>
                                    <input type="hidden" name="candidate_id" value="<%out.print(user.getInt("id"));%>"/>
                                    
                                    <button type="submit" class="btn btn-primary">Apply</button>
                                
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </div>
</section>

<jsp:include page="include_files/bottom_inc.jsp"/> 