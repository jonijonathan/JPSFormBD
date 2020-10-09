<%-- 
    Document   : editarMiPerfil
    Created on : 7 oct. 2020, 13:40:50
    Author     : jonathan
--%>

<%@page import="Modelo.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EditarMiPerfil</title>
        <%
            Persona p = (Persona) session.getAttribute("userActual");

        %>
    </head>
    <body>
        <h1>EditarMiPerfil</h1>
        <form name ="edicionPerfil" action="../controladorEditarMiPerfil.jsp" enctype="multipart/form-data" method="POST">
            <label>Nombre: </label>
            <input type="text" readonly value="<%= p.getNombre()%>"/>
            <br>
            <input type="text" name="nombre" value="" placeholder="Nuevo Nombre..."/>
            <hr>
            <label>Edad </label>
            <input type="text" readonly value="<%= p.getEdad()%>"/>
            <br>
            <input type="number" name="edad" min="1" max="80"/>
            <hr>
            <label>Imagen: </label>
            <img src="<%= p.getImagen()%>" width="100px">
            <input type="file" name="fichero" value="Nueva Imagen"/>
            <hr>
            <input type="submit" name="confirmarEdicion" value="Confirmar"/>
        </form>
        <form name ="edicionPerfil" action="acierto.jsp" method="POST">
            <input type="submit" name="cancelarEdicion" value="Cancelar"/>
        </form>
    </body>
</html>
