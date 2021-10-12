<%@page import="com.jobportal.model.ProviderDAO"%>
<%@page import="com.jobportal.model.SeekerDAO"%>
<%@page import="java.sql.ResultSet"%>
<jsp:include page="include_files/dashboard_top_inc.jsp"/>
<%
    ResultSet userMore = null;
    session = request.getSession();
    ResultSet user = (ResultSet) session.getAttribute("resultset");
    if(user.getString("role").toLowerCase().trim().equals("seeker")){
        SeekerDAO handleUserData = new SeekerDAO();
        userMore = handleUserData.select(user.getInt("id"));
    }else{
        ProviderDAO handleUserData = new ProviderDAO();
        userMore = handleUserData.select(user.getInt("id"));
    }
%>
<jsp:include page="include_files/notification_inc.jsp"/>
<div>
    <h2 class="mb-4">Edit Profile</h2>
    <form class="myform border border-5 rounded-3 p-4" action="EditProfile">
        <input type="hidden" id="id" name="id" value="<%out.print(user.getString("id"));%>">
        <input type="hidden" id="role" name="role" value="<%out.print(user.getString("role"));%>">
        <div class="mb-4">
            <div class="row" id="name">
                <div class="col">
                    <label for="first_name" class="form-label">First Name : </label>
                    <input type="text" id="first_name" name="first_name" class="form-control" value="<%out.print(user.getString("first_name"));%>">
                </div>
                <div class="col">
                    <label for="last_name" class="form-label">Last Name : </label>
                    <input type="text" class="form-control" id="last_name" name="last_name" value="<%out.print(user.getString("last_name"));%>">
                </div>
            </div>
        </div>
        <div class="mb-4">
            <div class="row" id="contact_details">
                <div class="col">
                    <label for="contact_number" class="form-label">Contact Name : </label>
                    <input type="tel" id="contact_number" name="contact_number" class="form-control" value="<%out.print(user.getString("contact_no"));%>">
                </div>
                <div class="col">
                    <label for="email" class="form-label">Email Id : </label>
                    <input type="email" class="form-control" name="email" id="email" value="<%out.print(user.getString("email"));%>">
                </div>
            </div>
        </div>
        <div class="mb-4">
            <div class="row">
                <div class="col">
                    <label for="street" class="form-label">Street Address</label>
                    <input type="text" id="street" name="street" class="form-control" value="<%out.print(user.getString("street"));%>">
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="city" class="form-label">City</label>
                    <input type="text" id="city" name="city" class="form-control" value="<%out.print(user.getString("city"));%>">
                </div>
                <div class="col">
                    <label for="zip" class="form-label">Zip Code</label>
                    <input type="text" class="form-control" name="zip" id="zip" value="<%out.print(user.getString("zip"));%>">
                </div>
                <div class="col">
                    <label for="state" class="form-label">State</label>
                    <input type="text" class="form-control" id="state" name="state" value="<%out.print(user.getString("state"));%>">
                </div>
                <div class="col">
                    <label for="country" class="form-label">Country</label>
                    <input type="text" class="form-control" id="country" name="country" value="<%out.print(user.getString("country"));%>">
                </div>
            </div>
        </div>
        <%if(userMore.next()){
            if(user.getString("role").toLowerCase().trim().equals("seeker")){%>
        <div class="mb-4">
            <div class="row">
                <div class="col">
                    <label for="aadhar" class="form-label">Aadhar Number : </label>
                    <input type="text" id="aadhar" name="aadhar" class="form-control" value="<%out.print(userMore.getString("aadhar_num"));%>">
                </div>
                <div class="col">
                    <label for="higher_que" class="form-label">Higher Qualification : </label>
                    <input type="text" class="form-control" id="higher_que" name="higher_que" value="<%out.print(userMore.getString("higher_que"));%>">
                </div>
            </div>
        </div>
        <div class="mb-4">
            <div class="row">
                <div class="col">
                    <label for="skill" class="form-label">Skills : </label>
                    <textarea class="form-control" name="skill" rows="6" id="skill" required><%out.print(userMore.getString("skill"));%></textarea>
                </div>
            </div>
        </div>
        <%}else{%>
        <div class="mb-4">
            <div class="row">
                <div class="col">
                    <label for="aadhar" class="form-label">Aadhar Number : </label>
                    <input type="text" id="aadhar" name="aadhar" class="form-control" value="<%out.print(userMore.getString("aadhar_num"));%>">
                </div>
                <div class="col">
                    <label for="provider_type" class="form-label">Provider Type : </label>
                    <select class="form-control" id="provider_type" name="provider_type">
                        <option selected>Choose..</option>
                        <option value="Personal Work">Personal Work</option>
                        <option value="Daily Wage Recruiter">Daily Wage Recruiter</option>
                        <option value="Probation Based Recruiter">Probation Based Recruiter</option>
                        <option value="Private Company">Private Company</option>
                        <option value="Public Company">Public Company</option>
                        <option value="NGO">NGO</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="mb-4">
            <div class="row">
                <div class="col">
                    <label for="about" class="form-label">About : </label>
                    <textarea class="form-control" name="about" rows="6" id="about" required><%out.print(userMore.getString("about"));%></textarea>
                </div>
            </div>
        </div>
            <%}
        }%>
        <div class=" mb-4 text-center"><button type="submit">Edit <i class="bi bi-pencil-fill"></i></button></div>
    </form>
</div>
<jsp:include page="include_files/dashboard_bottom_inc.jsp"/>