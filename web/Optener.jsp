<%-- 
    Document   : Optener
    Created on : 06-13-2020, 12:00:56 AM
    Author     : DELL
--%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Datos del Usuario</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="Ingreso.jsp">INGRESO</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp">TABLA<span class="sr-only">(current)</span></a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="row">&nbsp;</div>
        <%
            Date dNow = new Date();
            SimpleDateFormat ft = new SimpleDateFormat("yy");
            String currentDate = ft.format(dNow);
        %>
        <%
            Connection cnx = null;
            Statement sta = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/empleados?user=root");
                sta = cnx.createStatement();
                rs = sta.executeQuery("select *,LEFT(nombre,1), LEFT(apellido,1) from empleados where id = '" + request.getParameter("id") + "';");
                
                while (rs.next()) {
        %>
        <div class="container">
            <div class="row">&nbsp;</div>
            <div class="shadow-lg p-3 mb-5 bg-white rounded">
                <h3> 
                    <strong>
                        <div class="p-3 mb-2 bg-success text-white">DATOS RECIBIDOS</div>
                        <div class="panel-body">
                            <ul class="list-group">
                                <li class="list-group-item">CARNET: <%=rs.getString(7)%><%=rs.getString(8)%><%=currentDate%><%=1000 + rs.getInt(1)%></li>
                                <li class="list-group-item">NOMBRE: <%=rs.getString(2)%></li>
                                <li class="list-group-item">APELLIDOS: <%=rs.getString(3)%></li>
                                <li class="list-group-item">EDAD: <%=rs.getString(4)%></li>
                                <li class="list-group-item">PROFESIÓN: <%=rs.getString(5)%></li>
                                <li class="list-group-item">GÉNERO: <%=rs.getString(6)%></li>
                            </ul>
                        </div>
                    </strong>
                </h3>
            </div>
        </div>
        <%
                }
                sta.close();
                rs.close();
                cnx.close();
            } catch (Exception e) {
            }
        %>

    </body>
</html>

