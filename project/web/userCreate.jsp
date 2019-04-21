<%-- 
    Document   : fileJsp
    Created on : Apr 19, 2019, 11:19:04 AM
    Author     : RGUKT
--%>
<%@page import="java.util.Random"%>
<%@ page import ="java.sql.*" %>
<%
    try{
        String name1 = request.getParameter("name1");  
        String inter1 = request.getParameter("inter1");
        String per1 = request.getParameter("per1");
        String rank1 = request.getParameter("rank1");
        Random rand = new Random();
        int a = rand.nextInt(1000);
        if(a==0)
        {
            a = a + 123456;
        }
        if(a<10 && a!=0)
        {
            a = a * 100000;
        }
        if(a>9 && a<100)
        {
            a = a * 10000;
        }
        if(a>99 && a<1000){
            a = a * 1000;
        }
        String id1 = "B"+a; 
        
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root", "root");
        String sql="insert into student values(?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setString(1, id1);
        ps.setString(2, name1);
        ps.setString(3, inter1);
        ps.setString(4, per1);
        ps.setString(5, rank1);

     int rs = ps.executeUpdate();
        if(rs>0){%>
        <script>
            var id2 = "<%=id1%>"
            alert("Successfully Created\nYour Id is "+id2+"\nRemember ID");
            window.location='index.html';
        </script>
<%
        }
        else{
            out.print("<center><h1>Something Wrong</h1></center>");
        }
    }
    catch(Exception e){
        out.println("E is :"+e);
    }

%>