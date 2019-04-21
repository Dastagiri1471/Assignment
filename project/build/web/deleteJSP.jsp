<%-- 
    Document   : deleteJSP
    Created on : Apr 20, 2019, 12:16:38 AM
    Author     : RGUKT
--%>
<%-- 
    Document   : fileJsp
    Created on : Apr 19, 2019, 11:19:04 AM
    Author     : RGUKT
--%>
<%@ page import ="java.sql.*" %>
<html>
    <head
        <style>
            <link rel="stylesheet" href="s1.css">
        </style>
        <script>
            function goBack() {
                window.history.back();
            }
        </script>
    </head>
    <body>
<%
 
    try{
        String id1 = request.getParameter("id");    
        String name1 = request.getParameter("nm");
        float marks1 = Float.parseFloat(request.getParameter("mark"));
        int rank1 = Integer.parseInt(request.getParameter("rank"));
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root", "root");
        String sql="delete from student where id=? and name=? and marks=? and rank=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, id1);
        ps.setString(2, name1);
        ps.setFloat(3, marks1);
        ps.setInt(4, rank1);

        int rs = ps.executeUpdate();
        if(rs>0)
            {%>
        <script>
            alert("Deletion Successfully Done");
            window.location='index.html';
        </script>
<%
        }
            else{
                out.println("<center><h1>Records not found...<br>"
                + "Provide correct details<br>"
                + "Try again..!<br><br>"
                    + "<button  type='button' class='btn1' id='b4' onclick='goBack()'>Go Back</button>"
                    + "</h1></center>");
            }
        }
    catch(Exception e){
             out.println("<center><h1>Somthing went wrong... <br>"
                + "Try again..!<br><br>"
                    + "<button  type='button' class='btn1' id='b4' onclick='goBack()'>Go Back</button>"
                    + "</h1></center>");
    }
%>
</body>
</html>