<%-- 
    Document   : acierto
    Created on : 25 sept. 2020, 13:12:01
    Author     : jonathan
--%>

<%@page import="Modelo.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Acierto</title>
    </head>
    <body>
        <h1>Bienvenido</h1>
        <%
            Persona p = (Persona) session.getAttribute("userActual");   
            String ses = session.getId();          
        %>
        <p>ID Sesion:  <%= ses%></p>
        <input type="text" readonly value="<%= p.getNombre()%>"/>
        <br>
        <p>Partidas Ganadas</p>
        <input type="text" readonly value="<%= p.getPartGanadas()%>"/>
        <br>
        <img src="../img/defecto.jpg">
        <form action="../controlador.jsp">
            <input type="submit" value="Jugar" name="jugar"/>
            <input type="submit" value="Cerrar Session" name="cs"/>
        </form>
    </body>
</html>
