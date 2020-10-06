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
        <form action="../controlador.jsp" method="POST">
        <h1>Bienvenido</h1>
        <%
            Persona p = (Persona) session.getAttribute("userActual");
            String ses = session.getId();
        %>
        <input type="text" value="<%= p.getNombre()%>"/>
        <br>
        
            <p>ID Sesion:  <%= ses%></p>
            <h2>Como quieres Entrar </h2>
            <select name = "rol">
                <option value="usuario">Usuario</option>
                <option value="administrador">Administrador</option>
            </select>
            <br>
            <input type="submit" value="Cerrar Session" name="cs"/>
            <br>
            <input type="submit" value="EntrarConRol" name="EntrarConRol"/>
            
        </form>
    </body>
</html>