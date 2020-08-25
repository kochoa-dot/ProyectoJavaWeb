<%-- 
    Document   : Ingreso
    Created on : 06-11-2020, 08:59:04 PM
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
        <title>Ingreso de Usuario</title>
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
        <div class="d-flex justify-content-center">
            <div class="col-sm-5 col-sm-offset-4">
                <div class="row">
                    <h3>Datos personales</h3>
                </div>
                <form role="form" name="persona" action="" method="POST">
                    <div class="form-group">
                        <label for="nombre">Ingrese su nombre:</label>
                        <input type="text" class="form-control" onclick="carnet" name="nombre" id="nombre" placeholder="Nombre">
                    </div>
                    <div class="form-group">
                        <label for="apellido">Ingrese sus apellidos:</label>
                        <input type="text" class="form-control" onclick="carnet" id="apellido" name="apellido" placeholder="Apellido">
                    </div>
                    <div class="form-group">
                        <label for="edad">Ingrese su edad:</label>
                        <input type="text" class="form-control" id="edad" name="edad" placeholder="Edad">
                    </div>
                    <div class="form-group">
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
                    </div>
                    <div class="form-group">
                        <label for="profesion">Ingrese su profesión:</label>
                        <input type="text" class="form-control" name="profesion" id="profesion" placeholder="Profesión">
                    </div>
                    <input type="submit" class="btn btn-primary" value="Enviar">
                </form>
            </div>
        </div>
    </body>
</html>
<%
    Connection cnx = null;
    Statement sta = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        //cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/empleados?user=root");
        cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/empleados?user=root&useUnicode=yes&characterEncoding=UTF-8");
        sta = cnx.createStatement();
        sta.executeQuery("SET NAMES 'UTF8'");
        sta.executeQuery("SET CHARACTER SET 'UTF8'");
        rs = sta.executeQuery("select * from empleados;");
        
        PreparedStatement ps;
        String nombre, apellido, edad, genero, profesion;
        nombre = request.getParameter("nombre");
        apellido = request.getParameter("apellido");
        edad = request.getParameter("edad");
        genero = request.getParameter("genero");
        profesion = request.getParameter("profesion");
        if (nombre != null && apellido != null && edad != null && genero != null && profesion != null) {
            ps = cnx.prepareStatement("insert into empleados (nombre,apellido,edad,profesion,sexo) values ('" + nombre + "','" + apellido + "','" + edad + "','" + profesion + "','" + genero + "')");
            ps.executeUpdate();
            response.sendRedirect("index.jsp");
        }

        sta.close();
        rs.close();
        cnx.close();
    } catch (Exception e) {
    }
%>