<%-- 
    Document   : olvidadoContra
    Created on : 29 sept. 2020, 17:33:30
    Author     : jonathan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Olvidado Contraseña</title>
    </head>
    <body>
        <h1>Introducce tu correo</h1>
        <p>Se enviara una contraseña nueva a tu correo</p>
        <form action="../controlador.jsp" method="POST">
            <input type="email" name ="emailOlv" placeholder="Introduce email"/>
            <input type="submit" name ="confirmaOlvidado" value ="confirmar"/>   
             
        </form> 
        <form action="../index.jsp" method="POST">
             <input type="submit" name ="cancelarOlvidado" value ="cancelar"/> 
        </form>
    </body>
</html>