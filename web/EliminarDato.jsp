<%-- 
    Document   : Eliminar
    Created on : 13/06/2020, 12:37:46 AM
    Author     : kevin
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%

            String cod = request.getParameter("cod");

            Connection cnx = null;
            ResultSet rs = null;
            Statement sta = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/empleados?user=root");

                sta = cnx.createStatement();

                sta.executeUpdate("delete from empleados where id='" + cod + "'");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                sta.close();
                rs.close();
                cnx.close();
            } catch (Exception e) {
                out.print(e + "");
            }


        %>

    </body>
</html>
