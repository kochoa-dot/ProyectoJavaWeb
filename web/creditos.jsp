<%-- 
    Document   : creditos
    Created on : 18/06/2020, 04:01:00 PM
    Author     : kevin
--%>
<%@page import="java.sql.*"%>
<%@page pageEncoding="iso-8859-1" contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Créditos</title>
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
        <br>
        <br>
        <h4 align="center">
            Listado de Alumnos del grupo
        </h4>
        <div class="container">
            <table class="table table-hover table-dark">
                <thead>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">Nombre del alumno</th>
                        <th scope="col">Carnet</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td align="center"><img src="imagenes/Nathaly.png" width="120" height="150"></td>
                        <td>Nathaly Alejandra Alvarado Corea</td>
                        <td>AC102017</td>
                    </tr>
                    <tr>
                        <td align="center"><img src="imagenes/kevin.png" width="120" height="150"></td>
                        <td>Kevin Eduardo Hernández Ochoa</td>
                        <td>HO100217</td>
                    </tr>
                    <tr>
                        <td align="center"><img src="imagenes/masita.png" width="120" height="150"></td>
                        <td>Max Alexander Molina Castro</td>
                        <td>MC100217</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
