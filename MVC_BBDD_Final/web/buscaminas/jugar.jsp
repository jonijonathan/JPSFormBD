<%-- 
    Document   : index
    Created on : 23 sept. 2020, 13:00:54
    Author     : jonathan
--%>

<%@page import="Modelo.Tablero"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscaminas</title>
    </head>
    <body>
        <form action ="jugar.jsp" method="POST">
            <%

                int a = 0;
                if (request.getParameter("hacer") != null) {
                    if (request.getParameter("hacer").equals("rendirse")) {
                        response.sendRedirect("rendirse.jsp");
                    } else {
                        //aqui minimo es la 2 vez que vienes a la pagina
                        //comprobar el tablero y los resultado
                        Tablero miTablero = (Tablero) (session.getAttribute("tablero"));
                        int cas = Integer.parseInt(request.getParameter("hacer") + "");
                        if (miTablero.revelarCasilla(cas).equals("*")) {
                            //si es una mina explotas, ir a pag de has perdido 
                            //y revelar el tablero
                            //int i = 0;
                            response.sendRedirect("perdido.jsp");
                        } else {
                            //si no es mina, poner ese valor en el tablero user
                            //recargar pag
                            //y revelar el tablero
                            if (miTablero.heGanado()) {
                                response.sendRedirect("ganado.jsp");
                            } else {
                                out.print(miTablero.pintarTableroUser());
            %>
            <br/>
            <%
                for (int i = 0; i < miTablero.getTamannoTablero(); i++) {
            %>
            <input type ="submit" name="hacer" value="<%= i%>"> <br/>

            <%
                            }
                        }
                        int i = 0;
                    }
                }
            } else {
                //jugar por primera vez
                if (request.getParameter("tablero") == null) {
                    //captura el tablero en una session 
                    int tamannoCas = Integer.parseInt(request.getParameter("nCasillas"));
                    int tamannoMinas = Integer.parseInt(request.getParameter("nMinas"));
                    Tablero miTablero = new Tablero(tamannoCas,tamannoMinas);
                    out.print(miTablero.toString());
                    out.print(miTablero.pintarTableroUser());
            %>
            <br/>
            <%
                session.setAttribute("tablero", miTablero);
                System.out.println("----");
                //pinta los botones
                for (int i = 0; i < miTablero.getTamannoTablero(); i++) {
            %>
            <input type ="submit" name="hacer" value="<%= i%>"> <br/>

            <%
                }

            } else {
                //quizas este else sobra
                Tablero miTablero = (Tablero) (session.getAttribute("tablero"));
                for (int i = 0; i < miTablero.getTamannoTablero(); i++) {
            %>
            <input type ="submit" name="hacer" value="<%= i%>"> <br/>

            <%
                        }
                    }
                }
            %>
            <input type ="submit" name="hacer" value="rendirse"> <br/>



        </form>
    </body>
</html>
