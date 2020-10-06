<%-- 
    Document   : index
    Created on : 19 sept. 2020, 9:46:10
    Author     : jonathan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario</title>
    </head>
    <body>
        <form action ="controlador.jsp" method="POST">
            <fieldset>
                <label>Nombre</label>
                <input type ="text" name = "nombre" placeholder="Nombre"/>
                <input type ="text" name = "apellido" placeholder="apellido"/>
                <input type ="email" name = "email" placeholder="email"/>
                <input type ="password" name = "contra" placeholder="contraseña"/>
            </fieldset>

            <fieldset>
                <label>Edad</label>
                <input type ="number" name = "edad"  min="1" max="80" placeholder="Edad"/>               
            </fieldset>

            <fieldset>
                <legend>Sexo:</legend>
                <input type = "radio" name ="sexo" value="hombre" checked/> Hombre
                <input type = "radio" name ="sexo" value="mujer"/> Mujer
            </fieldset>

            <fieldset>
                <legend>Rol:</legend>
                <input type = "radio" name ="rol" value="administrador" checked/> Administrador
                <input type = "radio" name ="rol" value="user"/> Usuario
            </fieldset>
            <fieldset>
                <legend>Fecha</legend>
                <input type = "date" name ="fecha"/>
            </fieldset>
            <fieldset>
                <legend>Asignaturas: </legend>
                <input type = "checkbox" name ="asig" value="matematicas"/>Matemáticas
                <br/>
                <input type = "checkbox" name ="asig" value="lengua"/>Lengua
                <br/>
                <input type = "checkbox" name ="asig" value="conocimiento"/>Conocimiento
            </fieldset>
            <fieldset>
                <legend>Curso:</legend>
                <select name ="curso">
                    <option value="DAW1">DAW 1</option>
                    <option value="DAW2">DAW 2</option>
                    <option value="DAM1">DAM 1</option>
                    <option value="DAM2">DAM 2</option>
                </select>
            </fieldset>
            <input type="submit" name ="datosCompletos" value="enviar"/>
        </form>
    </body>
</html>
