<jsp:include page="include_files/dashboard_top_inc.jsp"/>
<jsp:include page="include_files/notification_inc.jsp"/>
<div>
    <h2>Profile Picture</h2>
    <p>Looks make the Impression 10 folds better.</p>
    <p>So upload or change your picture and look more professional.</p>
    <div class="row justify-content-center"><img class="rounded-circle my-2" style="width:200px;border: 2px solid #ffc451" src="assets/img/dummy-person-team.png" alt="img"/></div>
    <form class="text-center myform my-2">
            <div class=" mb-4 text-center"><input class="form-control form-control-lg" id="profilepic" type="file"/></div>
            <div class=" mb-4 text-center "><button type="submit">Upload <i class="bi bi-cloud-arrow-up-fill"></i></button></div>
    </form>
</div>
<jsp:include page="include_files/dashboard_bottom_inc.jsp"/>