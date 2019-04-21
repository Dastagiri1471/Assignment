<%-- 
    Document   : connectionJsp
    Created on : Apr 21, 2019, 4:26:33 AM
    Author     : RGUKT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <%
            try{
                String name1 = request.getParameter("change");  
                if(name1.equals("Update"))
                {
                    response.sendRedirect("update.html");
                }
                if(name1.equals("Delete"))
                {
                    response.sendRedirect("newhtml.html");
                }
            }
            catch(Exception e)
            {
                out.print("<script>window.history.back();</script>");
            }
        %>
        
    </head>
    <body></body>

</html>
