<%-- 
    Document   : login.jsp
    Created on : 21 Jun, 2021, 7:54:43 PM
    Author     : Win-10
--%>
<jsp:include page="include_files/top_inc.jsp"/>

<section class="breadcrumbs">
    <div class="container">

        <div class="d-flex justify-content-between align-items-center">
            <h2>Log In</h2>
            <ol>
                <li><a href="index.jsp">Home</a></li>
                <li>Log In</li>
            </ol>
        </div>

    </div>
</section>

<section class="contact">
    <div class="container">
        <jsp:include page="include_files/notification_inc.jsp"/>
        <div class="row justify-content-center ">
            <div class="col-lg-5 mt-0 mt-lg-0">

                <form action="Login" class="myform border border-3 rounded-3 p-4">
                    <%if (request.getParameter("return_page")!=null) {%><input type="hidden" name="return_page" value="<%out.print(request.getParameter("return_page"));%>"/><%}%>
                    <%if (request.getParameter("job_id")!=null) {%><input type="hidden" name="job_id" value="<%out.print(request.getParameter("job_id"));%>"/><%}%>
                    <div class="form-group mt-3 ">
                        <i class="bi bi-person-circle"></i>
                        <label for="email">Username : </label>
                        <input type="text" class="form-control" name="email" id="username" required>
                    </div>
                    <div class="form-group mt-3">
                        <i class="bi bi-key-fill"></i>
                        <label for="password">Password : </label>
                        <input type="password" class="form-control" name="password" id="password" required>
                    </div>
                    <div class="my-3">
                        <div class="error-message"></div>
                    </div>
                    <div class="text-center"><button type="submit">Login</button></div>
                </form>
            </div>
        </div>
    </div>     
</section>

<jsp:include page="include_files/bottom_inc.jsp"/>
