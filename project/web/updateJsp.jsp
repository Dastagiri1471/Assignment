<%-- 
    Document   : updateJsp
    Created on : Apr 21, 2019, 5:42:34 AM
    Author     : RGUKT
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <%@ page import ="java.sql.*" %>
        <%
        try{
            String a1 = request.getParameter("a1"); 
            String a2 = request.getParameter("a2");  
            String a4 = request.getParameter("a4"); 
            String a5 = request.getParameter("a5"); 
            String a6 = request.getParameter("a6"); 
            String a7 = request.getParameter("a7"); 
            String a8 = request.getParameter("a8"); 
            String a9 = request.getParameter("a9");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root", "root");
            String sql="update student set name=?,interests=?,marks=?,rank=? where id=? and name=? and marks=? and rank=?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, a6);
                ps.setString(2, a7);
                ps.setString(3, a8);
                ps.setString(4, a9);
                
                ps.setString(5, a1);
                ps.setString(6, a2);
                ps.setString(7, a4);
                ps.setString(8, a5);

            int rs = ps.executeUpdate();
            if(rs>0)
            {%>
            <script>
                alert("Updation Successfully Done");
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
