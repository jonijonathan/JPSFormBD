<%-- 
    Document   : listar
    Created on : 22 sept. 2020, 13:13:59
    Author     : jonathan
--%>

<%@page import="Modelo.ConexionEstatica"%>
<%@page import="Modelo.ListaPersonas"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Persona"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar</title>
    </head>
    <body>        
        <h1>Listar</h1>
        
            <%
                    String ses = session.getId();
                    %>
                        <p>ID Sesion:  <%= ses%></p>
        <%
                    LinkedList l = ConexionEstatica.listaPersonas();
                    for (int i = 0; i < l.size(); i++) {
                        Persona t = (Persona) l.get(i);                       
            %>
            <form action="../controladorAdmin.jsp" method="POST">

            <input type = "text" readonly name="email" value="<%=t.getEmail()%>"/>
            <input type = "text" name="nombre" value="<%=t.getNombre()%>"/> 
            <input type = "text" name="apellido" value="<%=t.getApellido()%>"/>
            <input type = "submit" name="editar" value="Editar"/>
            <input type = "submit" name="borrar" value="Borrar"/>
            <br/>
             </form>
            <%
                }

            %>
           
            <br>
            <form action="../controlador.jsp">
                <input type="submit" name = "cs" value="Cerrar Session"/>
            </form>
            <br/>
        
    </body>
</html>
