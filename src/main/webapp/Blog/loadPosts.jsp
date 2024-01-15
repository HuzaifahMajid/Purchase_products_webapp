
<%@page import="blog.PostDao"%>
<%@page import="blog.Post"%>
<%@page import="java.util.List"%>


<%@page import="blog.ConnectionProvider"%>
<div class="row">

    <%
        
   		 String user = (String)session.getAttribute("user");
        
        Thread.sleep(1000);
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if (cid == 0) {
            posts = d.getAllPosts();
        } 
        
        if (posts.size() == 0) {
            out.println("<h3 class='display-3 text-center'>No Posts in this category..</h3>");
            return;
        }
        
        for (Post p : posts) {
    %>

    <div class="col-md-6 mt-2">
        <div class="card">
           <%--  <img class="card-img-top" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap"> --%>
            <div class="card-body">
                <b><%= p.getpTitle()%></b>
                <p><%= p.getpContent()%></p>

            </div>
            <div class="card-footer primary-background text-center">
                <% 
                   // LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                %>

<%--                 <a href="#!" onclick="doLike(<%= p.getPid()%>,<%=user%>)" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span>  </a>
 --%>
                <a href="showBlog.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm">Read More...</a>
<!--                 <a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa fa-commenting-o"></i> <span>20</span>  </a>
 -->            </div>

        </div>


    </div>


    <%
        }
        
    %>

</div>