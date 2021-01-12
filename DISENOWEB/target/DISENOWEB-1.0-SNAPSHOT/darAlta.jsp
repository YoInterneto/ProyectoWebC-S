<%-- 
    Document   : darAlta
    Created on : 7 ene. 2021, 17:03:56
    Author     : MARINA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dar de alta</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/estilos.css">



        <script type="text/javascript" src="js/errores.js"/></script>


</head>
<body style="height: 1500px; padding-top: 5rem;">

    <div id="nav-placeholder">

    </div>

    <script>
        $(function () {
            $("#nav-placeholder").load("navbarRRHH.html");
        });
    </script>
    <!--end of Navigation bar-->
    <div class="row justify-content-center">
        <div class="col-4">
            <h1 class="text-center"> Dar de alta </h1>
            <div class="formularioAlta">
                <%String s=(String)request.getAttribute("mensaje");
              
                boolean u=Boolean.valueOf(s);
                %>
                


                <form id="altaEmpleado" onsubmit="alerta(<%=s%>)" action="MainContoller" method="post">
                    <!--<label>DNI:</label><br>
                    <input class="form-control" name="tdni" type="text" id="DNI" placeholder="Introduzca ID" required><br><br>-->
                    <label>Nombre:</label><br>
                    <input class="form-control" type="text" name="nombre" id="nombre" placeholder="Introduzca nombre" required><br>
                    <label>Apellidos:</label><br>
                    <input class="form-control" type="text" name="apellidos" id="apellidos" placeholder="Introduzca apellidos" required><br>                    
                    <label>Telefono:</label><br>
                    <input class="form-control" type="text"  name="telefono" id="telefono" placeholder="Introduzca telefono" required><br>
                    <label>Correo:</label><br>
                    <input class="form-control" name="tcorreo" type="text" id="correo" placeholder="Introduzca correo" required><br>
                    <label>Contraseña:</label><br>
                    <input class="form-control" type="text"  name="password" id="contraseña" placeholder="Introduzca contraseña" required><br><br>

                    <input class="btn btn-danger float-right" type="submit" name="accion" value="Enviar" style="margin:5px;">
                    <input class="btn btn-danger float-right" type="reset"  name="accion" value="Borrar" style="margin:5px;">
                </form>
            </div>
        </div
    </div>
</body>

</html>
