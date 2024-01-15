<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="java.io.*" %>
<%@ page import ="blog.ConnectionProvider" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blog Page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<link rel="stylesheet" href="../CSS/mystyle.css" type="text/css">

<style>

.banner-background{
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 93%, 60% 79%, 29% 91%, 0 97%, 0 0);
	
}

</style>



</head>
<body>



<%@include file="normal_navbar.jsp" %>



 <!--add post modal-->



        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details..</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id="add-post-form" method="post" action="AddPostServlet">

                            <div class="form-group">
                               <%--  <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category---</option>

                                  <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {
                                  %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>

                                    <%
                                        }
                                    %> 
                                </select> --%>
                            </div>

                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <textarea name="pContent" class="form-control" style="height: 200px;" placeholder="Enter your content"></textarea>
                            </div>
                          <!--   <div class="form-group">
                                <textarea name="pCode" class="form-control" style="height: 200px;" placeholder="Enter your program (if any)"></textarea>
                            </div> -->
                        
                        <div class="container text-center"> 
                                <button type="submit" class="btn btn-outline-primary">Post </button>
                        </div> 

                        </form>


                    </div>

                </div>
            </div>
        </div>

 

        <!--END add post modal-->


<div class="container-fluid p-0 m-0">
	<div class="jumbotron primary-background banner-background">
		<div class="container">
		<h3 class="display-3">Welcome, Knights!!</h3>
		<h3>Rutgers Blog</h3>
		<p>Talk about anything and everything</p>
		</div>
	</div>
	
	<br>
	
	

</div>


<main>
            <div class="container">
                <div class="row mt-4">
                    <!--first col-->
                    <div class="col-md-4">
                        <!--categories-->
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0, this)"  class=" c-link list-group-item list-group-item-action active">
                                Posts
                            </a>
                            <!--categories-->

                          <%--   <%                                PostDao d = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = d.getAllCategories();
                                for (Category cc : list1) {
                            %>
                            <a href="#" onclick="getPosts(<%= cc.getCid()%>, this)" class=" c-link list-group-item list-group-item-action"><%= cc.getName()%></a>


                            <%                                        }
                            %> --%>
                        </div>

                    </div>

                    <!--second col-->
                    <div class="col-md-8" >
                        <!--posts-->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div>

                        <div class="container-fluid" id="post-container">

                        </div>
                    </div>

                </div>

            </div>

        </main>

<!-- Cards -->
<!-- 
<div class="container">

<div class="row mb-2">

	<div class="col-md-4">
		<div class="card" >
  
			  <div class="card-body">
			    <h5 class="card-title">Useful Links</h5>
			    <p class="card-text">Find useful links that may help you at Rutgers!</p>
			    <a href="#" class="btn primary-background text-white">Read More</a>
			  </div>
		</div>
	
	
	</div>
	
	
	
	<div class="col-md-4">
		<div class="card" >
  
			  <div class="card-body">
			    <h5 class="card-title">Must have Apps</h5>
			    <p class="card-text">Find useful apps that may help you at Rutgers!</p>
			    <a href="#" class="btn primary-background text-white">Read More</a>
			  </div>
		</div>
	
	
	</div>
	
	
	
	<div class="col-md-4">
		<div class="card" >
  
			  <div class="card-body">
			    <h5 class="card-title">Easy Classes</h5>
			    <p class="card-text">Find useful links that may help you at Rutgers!</p>
			    <a href="#" class="btn primary-background text-white">Read More</a>
			  </div>
		</div>
	
	
	</div> -->


<!-- </div>


</div> -->





 <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="myjs.js" type="text/javascript"></script>


<script>

$(document).ready(function(e){
	//alert("loaded")
	$("#add-post-form").on("submit", function(event){
		//code gets called when form is submitted
		event.preventDefault();
		
		
		let form  = new FormData(this);
		 $.ajax({
             url: "../AddPostServlet",
             type: 'POST',
             data: form,
             success: function (data, textStatus, jqXHR) {
                 //success ..
                 console.log(data);
                 if (data.trim() == 'done')
                 {
                	 alert("Blog posted");
                     swal("Good job!", "saved successfully", "success");
                 } else
                 {
                     swal("Error!!", "Something went wrong try again...", "error");
                 }
             },
             error: function (jqXHR, textStatus, errorThrown) {
                 //error..
                 swal("Error!!", "Something went wrong try again...", "error");
             },
             processData: false,
             contentType: false
         })
	})
})


</script>


 <script>
            function getPosts(catId, temp) {
                $("#loader").show();
                $("#post-container").hide()
                $(".c-link").removeClass('active')
                $.ajax({
                    url: "loadPosts.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        //console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $('#post-container').html(data)
                        $(temp).addClass('active')
                    }
                })
            }
            $(document).ready(function (e) {
                let allPostRef = $('.c-link')[0]
                getPosts(0, allPostRef)
            })
</script>

</body>


</html>