package blog;


import blog.Category;
import blog.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();

        try {

            String q = "select * from categories";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("cname");
                String description = set.getString("cdescription");
                Category c = new Category(cid, name, description);
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean savePost(Post p) {
        boolean f = false;
        try {

            String q = "insert into posts values(default,?,?,default,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
           // pstmt.setString(3, p.getpCode());
           // pstmt.setString(4, p.getpPic());
            pstmt.setInt(3, p.getCatId());
            pstmt.setString(4, p.getUserName());
            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

//    get all the posts
    public List<Post> getAllPosts() {

        List<Post> list = new ArrayList<>();
        //fetch all the post
        try {

            PreparedStatement p = con.prepareStatement("select * from posts order by pid desc");

            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                //String pCode = set.getString("pCode");
               // String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                String userName = set.getString("userName");
                Post post = new Post(pid, pTitle, pContent, date, catId, userName);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

//    public List<Post> getPostByCatId(int catId) {
//        List<Post> list = new ArrayList<>();
//        //fetch all post by id
//        //fetch all the post
//        try {
//
//            PreparedStatement p = con.prepareStatement("select * from posts where cid=?");
//            p.setInt(1, catId);
//            ResultSet set = p.executeQuery();
//
//            while (set.next()) {
//
//                int pid = set.getInt("pid");
//                String pTitle = set.getString("pTitle");
//                String pContent = set.getString("pContent");
//               // String pCode = set.getString("pCode");
//               // String pPic = set.getString("pPic");
//                Timestamp date = set.getTimestamp("pDate");
//
//                String userName = set.getString("userName");
//                Post post = new Post(pid, pTitle, pContent, date, catId, userName);
//
//                list.add(post);
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }

    public Post getPostByPostId(int postId) {
        Post post = null;
        String q = "select * from posts where pid=?";
        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, postId);

            ResultSet set = p.executeQuery();

            if (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                //String pCode = set.getString("pCode");
               // String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int cid=set.getInt("catId");
                String userName = set.getString("userName");
                post = new Post(pid, pTitle, pContent, date, cid, userName);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }
}