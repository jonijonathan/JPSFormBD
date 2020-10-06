<%-- 
    Document   : listar
    Created on : 22 sept. 2020, 13:13:59
    Author     : jonathan
--%>

<%@page import="modelo.ListaPersonas"%>
<%@page import="java.util.LinkedList"%>
<%@page import="modelo.Persona"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar</title>
    </head>
    <body>        
        <h1>Listar</h1>
        <form action="index.jsp">
            <%
                    ListaPersonas l = (ListaPersonas) session.getAttribute("lista");
                    for (int i = 0; i < l.size(); i++) {
                        Persona t = (Persona) l.get(i);
            %>
            <input type = "text" name="persona" value="<%=t%>"/> 
            <br/>
            <%
                }

            %>
            <br>
            <input type="submit" name = "volver" value="volver"/>
            <br/>
        </form>
    </body>
</html>
