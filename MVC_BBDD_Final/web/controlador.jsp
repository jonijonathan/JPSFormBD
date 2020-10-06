<%-- 
    Document   : controlador
    Created on : 25 sept. 2020, 12:15:47
    Author     : jonathan
--%>

<%@page import="Modelo.Mail"%>
<%@page import="Modelo.ConexionEstatica"%>
<%@page import="Modelo.ListaPersonas"%>
<%@page import="Modelo.Persona"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contolador</title>
    </head>
    <body>
        <%
            //--------------
            // vengo de index 
            if (request.getParameter("accionIndex") != null) {
                //ha pulsado en entrar
                if (request.getParameter("accionIndex").equals("entrar")) {
                    if (request.getParameter("user") != null) {
                        String user = request.getParameter("user");
                        String contra = request.getParameter("contra");
                            //loggear                           
                            Persona p = ConexionEstatica.loggear(user, contra);

                            if (p != null) {
                                session.setAttribute("userActual", p);
                                //aqui preguntar a donde lo mandamos
                                if (p.getRol().equals("administrador")) {
                                    response.sendRedirect("vista/eleccion.jsp");
                                } else {
                                    response.sendRedirect("vista/acierto.jsp");
                                }

                            } else {
                                response.sendRedirect("vista/fallo.jsp");
                            }
                    }
                } else {
                    //ha pulsado en registrar
                    response.sendRedirect("registrar.jsp");
                }
            }

            //--------------
            //registro de persona
            if (request.getParameter("datosCompletos") != null) {
                String nombre = request.getParameter("nombre") + "";
                String apellido = request.getParameter("apellido") + "";
                String email = request.getParameter("email") + "";
                String rol = request.getParameter("rol") + "";
                int edad = Integer.parseInt(request.getParameter("edad"));
                String sexo = request.getParameter("sexo") + "";
                String fecha = request.getParameter("fecha") + "";
                String curso = request.getParameter("curso") + "";
                String contra = request.getParameter("contra") + "";
                Persona p = new Persona(nombre, edad, sexo, fecha, curso, contra, apellido, email, rol, 0);

                if (request.getParameterValues("asig") != null) {
                    String r[] = request.getParameterValues("asig");
                    for (int i = 0; i < r.length; i++) {
                        p.meterAsignatura(r[i]);
                    }
                }

                //añadir a la persona a la BD
                if(ConexionEstatica.addPersona(p)){
                    response.sendRedirect("vista/registroOK.jsp");
                }
            }

            //--------
            //Vengo de acierto
            if (request.getParameter("cs") != null) {               
                session.removeAttribute("userActual");
                session.invalidate();
                response.sendRedirect("index.jsp");
            }
            
            if(request.getParameter("jugar") != null){
                //redirigir a la pag del buscaminas
                response.sendRedirect("buscaminas/index.jsp");
            }
            

            //voy a vista de admin
            if (request.getParameter("EntrarConRol") != null) {
                String opcion = request.getParameter("rol") + "";
                if (opcion.equalsIgnoreCase("administrador")) {
                    response.sendRedirect("vista/admin.jsp");
                } else {
                    response.sendRedirect("vista/acierto.jsp");
                }
            }

            //olvivado contraseña
            if (request.getParameter("olvidado") != null) {
                response.sendRedirect("vista/olvContra.jsp");
            }
            

            
            //confirmar Olvidado
            if (request.getParameter("confirmaOlvidado") != null) {
                //enviar correo       
                String para = request.getParameter("emailOlv");               
                Persona p = ConexionEstatica.buscaEmail(para);
                if(p != null){
                    //un metodo que genere contraseña
                    String nuevaContra = "1234ABC";
                    p.setContra(nuevaContra);
                    ConexionEstatica.modificarContraseña(p);
                    //Enviar el correo
                    Mail email = new Mail();
                    //Falla al conectar
                    boolean resultado = email.enviarCorreo(nuevaContra, "Jonathan: Nueva Contraseña", para);
                                       
                    response.sendRedirect("vista/nuevaContra.jsp");
                }else{                
                    response.sendRedirect("vista/nuevaContra.jsp");
                }

            }

        %>

    </body>
</html>
