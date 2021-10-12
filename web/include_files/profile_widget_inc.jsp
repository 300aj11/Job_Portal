<%@page import="com.jobportal.model.ProviderDAO"%>
<%@page import="com.jobportal.model.SeekerDAO"%>
<%@page import="com.jobportal.model.UserDAO"%>
<%@page import="java.sql.ResultSet"%>
<%
    int id;
    ResultSet profile = null;
    ResultSet moreData = null;
    if (request.getParameter("id") != null) {
        id = Integer.parseInt(request.getParameter("id"));
        UserDAO userhandler = new UserDAO();
        profile = userhandler.selectProfileData(id);
    } else {
        session = request.getSession();
        profile = (ResultSet) session.getAttribute("resultset");
        id = profile.getInt("id");
    }
    if (profile.getString("role").toLowerCase().trim().equals("seeker")) {
        SeekerDAO seekerhandler = new SeekerDAO();
        moreData = seekerhandler.select(id);
    } else {
        ProviderDAO providerhandler = new ProviderDAO();
        moreData = providerhandler.select(id);
    }
    if (profile != null) {
        String page_name = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1);
%>
<div class="card text-center nav card bg-dark p-0 mb-3 text-white" style="border-color: #ffc451">
    <div class="card-header" style="border-color: #ffc451">
        <%if (page_name.equals("dashboard.jsp")) {%>
        <h5 style="color:#ffc451">Profile</h5>
        <%} else {%>
        <h5 style="color:#ffc451"><%out.print(profile.getString("role"));%></h5>
        <img class="rounded-circle my-2" style="width: 100px;border: 2px solid #ffc451" src="assets/img/dummy-person-team.png" alt="img"/><br>
        <h6 style="color:#ffc451"><%out.print(profile.getString("first_name") + " " + profile.getString("last_name"));%></h6>
        <%}%>
    </div>
    <div class="card-body" style="border-color: #ffc451">
        <div class="row">
            <div class="col ">
                <ul class="list-group" style="border: 2px solid #ffc451">
                    <li class="list-group-item bg-dark text-white">Name :- <%out.print(profile.getString("first_name") + " " + profile.getString("last_name"));%></li>
                    <li class="list-group-item bg-dark text-white">Contact :- <%out.print(profile.getString("contact_no"));%></li>
                    <li class="list-group-item bg-dark text-white">Email Id :- <%out.print(profile.getString("email"));%></li>
                </ul>
            </div>
            <div class="col">
                <ul class="list-group" style="border: 2px solid #ffc451">
                    <li class="list-group-item bg-dark text-white">Address :- <%out.print(profile.getString("street") + " , " + profile.getString("city"));%></li>
                   <li class="list-group-item bg-dark text-white">Zip code :- <%out.print(profile.getString("zip"));%></li>
                    <li class="list-group-item bg-dark text-white"><%out.print(profile.getString("state") + " , " + profile.getString("country"));%></li>
                </ul>
            </div>
        </div>                              
        <div class="row mt-4">
            <div class="col">
                <ul class="list-group" style="border: 2px solid #ffc451">
                    <%if (moreData.next()) {
                            if (profile.getString("role").toLowerCase().trim().equals("seeker")) {%>
                    <li class="list-group-item bg-dark text-white">Skills :- <%out.print(moreData.getString("skill"));%></li>
                    <li class="list-group-item bg-dark text-white">Qualification :- <%out.print(moreData.getString("higher_que"));%></li>
                    <li class="list-group-item bg-dark text-white">Aadhar Number :- <%out.print(moreData.getString("aadhar_num"));%></li>
                        <%} else {%>
                    <li class="list-group-item bg-dark text-white">About :- <%out.print(moreData.getString("about"));%></li>
                    <li class="list-group-item bg-dark text-white">Provider Type :- <%out.print(moreData.getString("provider_type"));%></li>
                    <li class="list-group-item bg-dark text-white">Aadhar Number :- <%out.print(moreData.getString("aadhar_num"));%></li>
                        <%}
                         }%>
                </ul>
            </div>
        </div>
    </div>
                <div class="card-footer text-muted" style="border-color: #ffc451"> &nbsp;</div>
</div>

<%} else {%>
<div class="alert alert-danger text-center " role="alert">
    Can't Fetch The Data From The Data Base Right Now. Please Visit Again
</div>
<%}%>