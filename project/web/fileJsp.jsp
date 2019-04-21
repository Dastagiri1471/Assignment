
<%-- 
    Document   : newjsp
    Created on : Apr 21, 2019, 2:51:03 AM
    Author     : RGUKT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="s1.css">
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
        String userid = request.getParameter("user1");    
        String name1 = request.getParameter("name1");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root", "root");
        String sql="select * from student where id= ? and name=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, userid);
        ps.setString(2, name1);
        ResultSet rs=null;
        rs = ps.executeQuery();
        if(rs.next())
        {
            out.print("<center><h1>The Student Details</h1></center>");            
        out.print("<table border  = '1' align = 'center' size='500px' bgcolor='orange'>"
                + "<tr> <th>ID</th>"
                + "<th>Name</th> "
                + "<th>Interests</th>"
                + "<th>Percentage</th> "
                + "<th>Rank</th></tr>");
        
        out.print("<tr><td>"+rs.getString("id")+"</td>"
                    +"<td>"+rs.getString("name")+"</td>"
                    +"<td>"+rs.getString("interests")+"</td>"
                    +"<td>"+rs.getString("marks")+"</td>"
                    +"<td>"+rs.getString("rank")+"</td>"
                    +"</tr>");
        
        while(rs.next()) {
            out.print("<tr><td>"+rs.getString("id")+"</td>"
                    +"<td>"+rs.getString("name")+"</td>"
                    +"<td>"+rs.getString("interests")+"</td>"
                    +"<td>"+rs.getString("marks")+"</td>"
                    +"<td>"+rs.getString("rank")+"</td>"
                    +"</tr>");
        }
        out.print("</table>;");
        out.print("<form action='connectionJsp.jsp' method='POST'>"
                + "<label class='container'>Update<input type='radio' name='change' id='a1' value='Update'><span class='checkmark'></span></label>"
                + "<label class='container'>Delete<input type='radio' name='change' id='a2' value='Delete'><span class='checkmark'></span></label>"
                    +"<input type='submit' id='b1' value='Select'>"
                + "</form>");
        }
        else{
            out.println("<center><h1>Records not found...<br>"
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
