<%-- 
    Document   : registration
    Created on : 21 Jun, 2021, 8:43:26 PM
    Author     : Win-10
--%>
<jsp:include page="include_files/top_inc.jsp"/>


<section class="breadcrumbs">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h2>Registration</h2>
            <ol>
                <li><a href="index.jsp">Home</a></li>
                <li>Registration</li>
            </ol>
        </div>
    </div>
</section>

<section id="common" class="contact">
    <%if(request.getParameter("success") == null) {%>
        <%if (request.getParameter("error") != null) {%>
        <div class="alert alert-danger text-center " role="alert">
            <%out.print(request.getParameter("error"));%>
        </div>
        <%}%> 
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 mt-0 mt-lg-0">

                    <form action="Registration" class="myform border border-3 rounded-3 p-4">

                        <div class="row">
                            <div class="col-md-6 form-group mt-3 ">
                                <i class="bi bi-person-badge"></i>
                                <label for="first_name">First Name : </label>
                                <input type="text" class="form-control" name="first_name" id="first_name" required>
                            </div>
                            <div class="col-md-6 form-group mt-3 ">
                                <i class="bi bi-person-badge"></i>
                                <label for="last_name">Last Name : </label>
                                <input type="text" class="form-control" name="last_name" id="last_name" required>
                            </div>
                        </div>
                        <div class="form-group mt-3 ">
                            <i class="bi bi-envelope-fill"></i>
                            <label for="email">Email ID : </label>
                            <input type="text" class="form-control" name="email" id="email" required>
                        </div>
                        <div class="row">
                            <div class="col-md-6 form-group mt-3 ">
                                <i class="bi bi-key-fill"></i>
                                <label for="password">Password : </label>
                                <input type="password" class="form-control" name="password" id="password" required>
                            </div>
                            <div class="col-md-6 form-group mt-3 ">
                                <i class="bi bi-key-fill"></i>
                                <label for="pass_again">Retype your password : </label>
                                <input type="password" class="form-control" name="pass_again" id="pass_again" required>
                            </div>
                        </div>
                        <div class="form-group mt-3">
                            <i class="bi bi-telephone-fill"></i>
                            <label for="contact_no">Contact Number : </label>
                            <input type="text" class="form-control" name="contact_no" id="contact_no" required>
                        </div>
                        <div class="row">
                            <div class="col-md-4 form-group mt-3 ">
                                <i class="bi bi-house-fill"></i>
                                <label for="city">City : </label>
                                <input type="text" class="form-control" name="city" id="state" required>
                            </div>
                            <div class="col-md-4 form-group mt-3 ">
                                <i class="bi bi-house-fill"></i>
                                <label for="zip">Zip : </label>
                                <input type="text" class="form-control" name="zip" id="zip" required>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-6 mt-3 ">
                                    <input type="radio"  name="role" value="seeker" id="seeker" required>Job seeker : 
                                </div>
                                <div class="col-md-6  mt-3 ">
                                    <input type="radio"  name="role" value="provider" id="provider" required>Job provider :
                                </div>
                            </div>
                            <div class="text-center"><button type="submit" value="Submit" >Submit</button></div>
                    </form>
                </div>
            </div>
        </div> 
    <%} else {%>
        <div class="card text-center border-success m-4">
            <div class="card-header border-success">
                <i class="bi bi-check-circle-fill m-4 text-success"></i>Registration Successful
            </div>
            <div class="card-body my-3">
                <h5 class="card-title">Welcome in the Job Portal</h5>
                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
            </div>
            <div class="card-footer text-muted border-success">
                <a href="login.jsp" class="btn btn-primary">Log In</a>
            </div>
        </div>
    <%}%>
</section>  



<jsp:include page="include_files/bottom_inc.jsp"/>