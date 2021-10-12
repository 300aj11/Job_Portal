<%if (request.getParameter("msg") != null) {
    String type="primary";
    if (request.getParameter("type") != null) type = request.getParameter("type");%>
    <div class="alert alert-<%out.print(type);%> text-center " role="alert">
        <%out.print(request.getParameter("msg"));%>
    </div>
<%}%> 