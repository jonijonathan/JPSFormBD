<%-- 
    Document   : index.jsp
    Created on : 25 sept. 2020, 10:55:25
    Author     : jonathan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscaminas</title>
    </head>
    <body>
        <h1>Iniciar Partida</h1>
        <form action="jugar.jsp" method="POST">
            <p>Numero de Casillas</p>
            <input type="number" name ="nCasillas" min="6" max="10" value ="7"/>
            <br/>
            <p>Numero de Minas</p>
            <input type="number" name ="nMinas" min="2" max="5" value="2"/>
            <br/>
            <input type="submit" value="Jugar"/>
        </form>
    </body>
</html>
