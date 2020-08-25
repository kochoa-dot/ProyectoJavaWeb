<%-- 
    Document   : ELIMINAR
    Created on : 06-12-2020, 06:44:05 PM
    Author     : DELL
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Eliminar Usuario</title>
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

            Connection cnx = null;
            Statement sta = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/empleados?user=root");
                sta = cnx.createStatement();
                String dato = request.getParameter("id");
                String eliminar = request.getParameter("txteliminar");
                rs = sta.executeQuery("select *,LEFT(nombre,1), LEFT(apellido,1) from empleados where id = '" + dato + "';");
                
                        if (eliminar != null) {
                            sta = cnx.createStatement();
                            rs = sta.executeQuery("delete from empleados where id = '"+ dato + "';");
                        }
                while (rs.next()) {
        %>
        <div class="container">
            <div class="row">&nbsp;</div>
            <h3> 
                <strong>
                    <div class="alert alert-danger" role="alert">
                        <h4 class="alert-heading">¿ESTAS SEGURO QUÉ QUIERES ELIMINAR LOS SIGUIENTES DATOS?</h4>
                        <ul class="alert-heading">
                            <li class="alert-heading">CARNET: <%=rs.getString(7)%><%=rs.getString(8)%><%=currentDate%><%=1000 + rs.getInt(1)%></li>
                            <li class="alert-heading">NOMBRE: <%=rs.getString(2)%></li>
                            <li class="alert-heading"> APELLIDOS: <%=rs.getString(3)%></li>
                            <li class="alert-heading">EDAD: <%=rs.getString(4)%></li>
                            <li class="alert-heading">PROFESIÓN: <%=rs.getString(5)%></li>
                            <li class="alert-heading">GÉNERO: <%=rs.getString(6)%></li>
                        </ul>
                        <hr>
                        <td>
                            <a type="button" name="txteliminar" value="txteliminar" class="btn btn-danger" href="EliminarDato.jsp?cod=<%=rs.getString(1)%>" style="color:white">
                                ELIMINAR
                            </a>
                        </td>
                        <td>
                            <a type="button" class="btn btn-secondary"  href="index.jsp" style="color:white">
                                CANCELAR
                            </a>
                        </td>
                    </div>
                </strong>
            </h3>
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
