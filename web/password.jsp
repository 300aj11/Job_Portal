<%@page import="com.jobportal.model.UserDAO"%>
<%@page import="java.sql.ResultSet"%>
<jsp:include page="include_files/dashboard_top_inc.jsp"/>
<%
    session = request.getSession();
    ResultSet user = (ResultSet) session.getAttribute("resultset");
%>
<jsp:include page="include_files/notification_inc.jsp"/>
<div>
    <h3>Change Password</h3>
    <p>Choose your Password Wisely</p>
    <form class="myform border border-5 rounded-3 p-4" action="ChangePassword" >
        <input type="hidden" id="id" name="id" value="<%out.print(user.getString("id"));%>">
        <div class="row mb-4">
            <div class="col-10 mx-auto">
                <label for="current_pass" class="form-label">Current Password : </label>
                <input type="password" name="current_pass" id="current_pass" class="form-control" value="">
                <span class="text-danger"></span>
            </div>
        </div>
        <div class="row mb-4">
            <div class="col-10 mx-auto">
                <label for="new_pass" class="form-label">New Password : </label>
                <input type="password" name="new_pass" id="new_pass" class="form-control" value="">
            </div>
        </div>
        <div class="row mb-4">
            <div class="col-10 mx-auto">
                <label for="pass_again" class="form-label">Retype Your New Password : </label>
                <input type="password" name="pass_again" id="pass_again" class="form-control" value="">
            </div>
        </div>
        <div class=" mb-4 text-center"><button type="submit">Change <i class="bi bi-pencil-fill"></i></button></div>
    </form>
</div>
<jsp:include page="include_files/dashboard_bottom_inc.jsp"/>