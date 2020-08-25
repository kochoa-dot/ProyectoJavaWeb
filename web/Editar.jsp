<%-- 
    Document   : Editar
    Created on : 06-13-2020, 12:35:07 AM
    Author     : DELL
--%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Editar Usuario</title>
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
            Connection cnx = null;
            Statement sta = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/empleados?user=root");
                sta = cnx.createStatement();
                rs = sta.executeQuery("select * from empleados where id = '" + request.getParameter("id") + "';");
                while (rs.next()) {
        %>
        <div class="container">
            <div class="row">&nbsp;</div>
            <div class="shadow-lg p-3 mb-5 bg-white rounded">
                <h3> 
                    <strong>
                        <div class="p-3 mb-2 bg-primary text-white ">DATOS RECIBIDOS</div>
                        <div class="panel-body">
                            <form role="form" name="persona" action="" method="POST">
                                <ul class="list-group">

                                    <li class="list-group-item"><label for="nombre">Ingrese su nombre:</label>
                                        <input type="text" class="form-control" name="nombre" id="nombre" placeholder="<%=rs.getString(2)%>">
                                    </li>
                                    <li class="list-group-item">
                                        <label for="apellido">Ingrese sus apellidos:</label>
                                        <input type="text" class="form-control" id="apellido" name="apellido" placeholder="<%=rs.getString(3)%>">
                                    </li>
                                    <li class="list-group-item">
                                        <label for="edad">Ingrese su edad:</label>
                                        <input type="text" class="form-control" id="edad" name="edad" placeholder="<%=rs.getString(4)%>">
                                    </li>
                                    <li class="list-group-item">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text" for="inputGroupSelect01">Seleccione su género:</label>
                                            </div>
                                            <select class="custom-select" id="genero" name="genero">
                                                <option selected>Seleccione</option>
                                                <option value="Masculino">Masculino</option>
                                                <option value="Femenino">Femenino</option>
                                            </select>
                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <label for="profesion">Ingrese su profesión:</label>
                                        <input type="text" class="form-control" name="profesion" id="profesion" placeholder="<%=rs.getString(5)%>">
                                    </li>


                                </ul>
                                <div class="row">&nbsp;</div>
                                <input type="submit" class="btn btn-primary" value="Enviar">
                            </form>
                        </div>
                    </strong>
                </h3>
            </div>
        </div>
        <%
                }
                PreparedStatement ps;
                String nombre, apellido, edad, genero, profesion;
                nombre = request.getParameter("nombre");
                apellido = request.getParameter("apellido");
                edad = request.getParameter("edad");
                genero = request.getParameter("genero");
                profesion = request.getParameter("profesion");
                if (nombre != null && apellido != null && edad != null && genero != null && profesion != null) {
                    ps = cnx.prepareStatement("update empleados set nombre = '" + nombre + "', apellido = '" + apellido + "', edad = '" + edad + "', profesion = '" + profesion + "', sexo = '" + genero + "' where id = '" + request.getParameter("id") + "';");
                    ps.executeUpdate();
                    response.sendRedirect("index.jsp");
                }
                sta.close();
                rs.close();
                cnx.close();
            } catch (Exception e) {
            }
        %>

    </body>
</html>
