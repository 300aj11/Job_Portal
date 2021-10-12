<jsp:include page="include_files/dashboard_top_inc.jsp"/>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.jobportal.model.CategoriesDAO"%>
<%
    session = request.getSession();
    ResultSet user = (ResultSet) session.getAttribute("resultset");
    CategoriesDAO categorieshandler = new CategoriesDAO();
    ResultSet categoriesList = categorieshandler.select();
%>
<jsp:include page="include_files/notification_inc.jsp"/>
<div>
    <h2 class="mb-4">New Job</h2>
    <form class="myform  border border-5 rounded-3 p-4" action="CreateJob" method="post">
        <input type="hidden" name="author_id" id="author_id" value="<%out.print(user.getInt("id"));%>">
        <div class="mb-4">
            <div class="row" id="name">
                <div class="col">
                    <label for="name" class="form-label">Title : </label>
                    <input type="text" id="name" name="name" class="form-control" value="">
                </div>
                <div class="col">
                    <label for="category_id" class="form-label">Category : </label>
                    <select class="form-control" id="category_id" name="category_id">
                        <option selected>Choose..</option>
                        <% while (categoriesList.next()) {%>
                        <option value="<%out.print(categoriesList.getInt("id"));%>"><%out.print(categoriesList.getString("name"));%></option>
                        <%}%>
                    </select>
                </div>
            </div>
        </div>
        <div class="mb-4">
            <div class="row" id="desc">
                <div class="col">
                    <label for="mobile_num" class="form-label">Contact: </label>
                    <input type="text" id="mobile_num" name="mobile_num" class="form-control">
                </div>
                <div class="col">
                    <label for="wages" class="form-label">Pay : </label>
                    <input type="text" name="wages" class="form-control" id="wages" value="">
                </div>
            </div>
        </div>
        <div class="mb-4">
            <div class="row" id="desc">
                <div class="col">
                    <label for="desc" class="form-label">Description: </label>
                    <textarea class="form-control" rows="6" name="desc" id="about" required></textarea>
                </div>
            </div>
        </div>
        <div class="mb-4">
            <div class="row" id="mobile_num">        
                <div class="col">
                    <label for="address" class="form-label">Address : </label>
                    <input type="text" class="form-control" name="address" id="address" value="">
                </div>
            </div>
        </div>
        <div class=" mb-4 text-center"><button type="submit">Submit</button></div>
    </form>            
</div>
<jsp:include page="include_files/dashboard_bottom_inc.jsp"/>