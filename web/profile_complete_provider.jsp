<%-- 
    Document   : info_provider
    Created on : 22 Jun, 2021, 10:11:02 AM
    Author     : Win-10
--%>
<jsp:include page="include_files/top_inc.jsp"/>

<section class="breadcrumbs">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h2>Complete Profile</h2>
            <ol>
                <li><a href="index.jsp">Home</a></li>
                <li>Registration</li>
                <li>Complete Profile</li>
            </ol>
        </div>
    </div>
</section>

<section id="second" class="contact">
    <%if (request.getParameter("id") != null) {%>
        <%if (request.getParameter("error") != null) {%>
            <div class="alert alert-danger text-center " role="alert">
                <%out.print(request.getParameter("error"));%>
            </div>
        <%}%>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 mt-0 mt-lg-0">

                    <form action="Provider" class="myform border border-3 rounded-3 p-4">

                        <input type="hidden" value="<%out.print(Integer.parseInt(request.getParameter("id")));%>" id="id" name="id">

                        <div class="row m-2">
                            <div class="col form-group mt-3 ">
                                <label for="provider_type">Type of Provider : </label>
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
                            <div class="col form-group m-2 ">
                                <label for="aadhar_num">Aadhar number : </label>
                                <input type="text" class="form-control" name="aadhar_num" id="last_name" required>
                            </div>
                        </div>
                        <div class="row m-2">
                            <label for="about">About : </label>
                            <textarea class="form-control" name="about" rows="6" id="about" required></textarea>
                        </div>
                        <div class="row my-4">
                            <div class="text-center"><button type="submit" value="Submit" >submit</button></div>
                        </div>
                    </form>     
                </div>
            </div>
        </div>
    <%} else {%>
        <div class="alert alert-danger text-center " role="alert">
            Can't Recognize the User.<br>(This Page needs user's id to proceed))
        </div>
    <%}%>
</section>

<jsp:include page="include_files/bottom_inc.jsp"/>

