<%-- 
    Document   : controladorEditarMiPerfil
    Created on : 7 oct. 2020, 13:49:55
    Author     : jonathan
--%>

<%@page import="Auxiliar.Constantes"%>
<%@page import="Modelo.ConexionEstatica"%>
<%@page import="Modelo.Persona"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                // req es la HttpServletRequest que recibimos del formulario.
                // Los items obtenidos serán cada uno de los campos del formulario,
                // tanto campos normales como ficheros subidos.
                List items = upload.parseRequest(request);
                Persona p = (Persona) session.getAttribute("userActual");
                // Se recorren todos los items, que son de tipo FileItem
                for (Object item : items) {
                    FileItem uploaded = (FileItem) item;

                    // Hay que comprobar si es un campo de formulario. Si no lo es, se guarda el fichero
                    // subido donde nos interese
                    if (!uploaded.isFormField()) {
                        // No es campo de formulario, guardamos el fichero en algún sitio
                        File fichero = new File(Constantes.rutaAbsoluta, uploaded.getName());
                        uploaded.write(fichero);
                        //actualizar la ruta de la img del usuario
                        
                        p.setImagen("../img/" + uploaded.getName());
                        ConexionEstatica.modificarImgPerfil(p);
                    } else {
                        // es un campo de formulario, podemos obtener clave y valor
                        String key = uploaded.getFieldName();
                        String valor = uploaded.getString();
                        if(key.equals("nombre") && !valor.equals("")){
                            p.setNombre(valor);
                        }
                        if(key.equals("edad") && !valor.equals("")){
                            p.setEdad(Integer.parseInt(valor));
                        }
                        System.out.println(key);
                        System.out.println(valor);
                        
                    }
                }
                ConexionEstatica.modificarPersonaNombreEdad(p);
                response.sendRedirect("vista/acierto.jsp");
            } catch (Exception e) {
                response.sendRedirect("vista/acierto.jsp");
            }
            
        %>
    </body>
</html>
