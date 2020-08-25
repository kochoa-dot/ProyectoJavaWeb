<%-- 
    Document   : Tabla
    Created on : 06-11-2020, 06:08:27 PM
    Author     : DELL
--%>
<%@page import="java.sql.*"%>
<%@page pageEncoding="iso-8859-1" contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Tabla de Usuarios</title>
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
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" name="txtbuscar" placeholder="BUSCAR" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
                        <svg class="bi bi-search" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
                        <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
                        </svg>
                    </button>
                </form>
            </div>
        </nav>        
        <div class="d-flex p-2 bd-highlight">
            <h4>
                SI DESEAS AGREGAR UN NUEVO USUARIO <a type="button" href="Ingreso.jsp" class="btn btn-info btn-lg">HAZ CLICK AQUÍ</a>
            </h4>
        </div>
        <div class="container">
            <div class="table-responsive" >
                <table  class="table table-hover"  width="600" >
                    <thead class="thead-dark">
                        <tr  style="text-align: center">
                            <th scope="col">#</th>
                            <th scope="col">NOMBRES</th>
                            <th scope="col">APELLIDOS</th>
                            <th scope="col">EDAD</th>
                            <th colspan="3" >ACCIONES</th>
                        </tr>
                    </thead>
                    <%
                        Connection cnx = null;
                        Statement sta = null;
                        ResultSet rs = null;

                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/empleados?user=root");
                            sta = cnx.createStatement();
                            rs = sta.executeQuery("select * from empleados;");

                            String nombuscar = request.getParameter("txtbuscar");
                            if (nombuscar != null) {
                                sta = cnx.createStatement();
                                rs = sta.executeQuery("select * from empleados where id like" + "'%" + nombuscar + "%' or nombre like" + "'%" + nombuscar + "%' or apellido like" + "'%" + nombuscar + "%' or edad like" + "'%" + nombuscar + "%';");
                            } else {
                                System.err.print("error");
                            }

                            while (rs.next()) {
                    %>
                    <tbody>
                        <tr style="text-align: center">
                            <th><strong><%=rs.getString(1)%></strong></th>
                            <th><%=rs.getString(2)%></th>
                            <th><%=rs.getString(3)%></th>
                            <th><%=rs.getString(4)%></th>
                            <td>
                                <a type="button" class="btn btn-success" href="Optener.jsp?id=<%=rs.getString(1)%>" style="color:white">
                                    OBTENER
                                </a>
                            </td>
                            <td>
                                <a type="button" class="btn btn-primary" href="Editar.jsp?id=<%=rs.getString(1)%>" style="color:white">
                                    EDITAR
                                </a>
                            </td>
                            <td>
                                <a type="button" class="btn btn-danger" href="ELIMINAR.jsp?id=<%=rs.getString(1)%>" style="color:white">
                                    ELIMINAR
                                </a>
                            </td>
                        </tr>
                        <%
                                }

                                sta.close();

                                rs.close();

                                cnx.close();
                            } catch (Exception e) {
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>         
        <br>
        <br>
        <nav class="navbar fixed-bottom navbar-expand-sm navbar-dark bg-dark">
            <a class="navbar-brand" href="creditos.jsp">Créditos</a>
        </nav>
    </body>
</html>
