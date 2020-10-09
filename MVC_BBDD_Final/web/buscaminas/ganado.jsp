<%-- 
    Document   : ganado
    Created on : 24 sept. 2020, 21:06:07
    Author     : jonathan
--%>

<%@page import="Modelo.ConexionEstatica"%>
<%@page import="Modelo.Persona"%>
<%@page import="Modelo.Tablero"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="../vista/acierto.jsp" method="POST">
            <h1>Has Ganado!</h1>
            <h1>Este era el tablero</h1>

            <%
                Tablero miTablero = (Tablero) (session.getAttribute("tablero"));
                out.print(miTablero.toString());
                Persona p = (Persona) session.getAttribute("userActual");
                ConexionEstatica.ganarPartida(p);
                session.removeAttribute("tablero");
            %>
            <input type="submit" value="Volver">
        </form>
    </body>
</html>
