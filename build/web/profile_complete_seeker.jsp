<%-- 
    Document   : info_seeker
    Created on : 22 Jun, 2021, 10:10:42 AM
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

                    <form action="Seeker" class="myform border border-3 rounded-3 p-4">
                        <input type="hidden" value="<%out.print(Integer.parseInt(request.getParameter("id")));%>" id="id" name="id">
                        <div class="row">
                            <div class="col form-group mt-3 ">
                                <label for="skill">Skills : </label>
                                <textarea class="form-control" name="skill" rows="6" id="skill" required></textarea>
                            </div>
                            <div class="row">
                            </div>
                            <div class="col-md-6 form-group mt-3 ">
                                <label for="aadhar_num">Aadhar Number : </label>
                                <input type="text" class="form-control" name="aadhar_num" id="aadhar_num" required>
                            </div>
                            <div class="col-md-6 form-group mt-3 ">
                                <label for="higher_que">Higher Qualification : </label>
                                <input type="text" class="form-control" name="higher_que" id="higher_que" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col form-group mt-3 ">
                                <label for="document">Document: </label>
                                <input type="file" class="document" name="document" id="document" required>
                            </div>
                            <div class="text-center"><button type="submit" value="Submit" >submit</button></div>
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
