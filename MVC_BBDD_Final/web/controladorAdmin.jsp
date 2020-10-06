<%-- 
    Document   : controladorAdmin
    Created on : 29 sept. 2020, 14:02:41
    Author     : jonathan
--%>

<%@page import="Modelo.ConexionEstatica"%>
<%@page import="Modelo.ListaPersonas"%>
<%@page import="Modelo.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(request.getParameter("editar")!= null){
                //editar a la persona
                Persona p = ConexionEstatica.buscaEmail(request.getParameter("email"));
                
                p.setApellido(request.getParameter("apellido"));
                p.setNombre(request.getParameter("nombre"));
                
                if(ConexionEstatica.modificarPersona(p)){
                    response.sendRedirect("vista/admin.jsp");
                };
                
            }else{
                //borrar a la persona
                if(ConexionEstatica.borrarPorEmail(request.getParameter("email"))){
                    response.sendRedirect("vista/admin.jsp");
                }
                
            }
            

           

        %>
    </body>
</html>
