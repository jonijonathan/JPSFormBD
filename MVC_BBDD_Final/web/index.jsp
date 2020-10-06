<%-- 
    Document   : index.jsp
    Created on : 25 sept. 2020, 12:13:05
    Author     : jonathan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loggig</title>
    </head>
    <body>
        <form action="controlador.jsp" method="POST">
            <p>Email</p>
            <input type ="email" value="" name ="user"/>
            <br/>
            <p>Contraseña:</p>
            <input type ="text" value="" name ="contra"/>
            <br/>
            <input type ="submit" value="entrar" name ="accionIndex"/>
            <input type ="submit" value="registrar" name ="accionIndex"/>
        </form>
        <br>
        <form action="controlador.jsp" method="POST">
            <input type ="submit" value="He olvidado mi contraseña" name ="olvidado"/>
        </form>
        
    </body>
</html>
