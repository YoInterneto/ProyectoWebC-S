<%-- 
    Document   : darAlta
    Created on : 7 ene. 2021, 17:03:56
    Author     : MARINA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dar de baja</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
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
                    <form id="altaEmpleado" action="Prueba" method="post">
                        <!--<label>DNI:</label><br>
                        <input class="form-control" name="tdni" type="text" id="DNI" placeholder="Introduzca ID" required><br><br>-->
                        <label>Nombre:</label><br>
                        <input class="form-control" type="text" name="tnombre" id="nombre" placeholder="Introduzca nombre" required><br><br>
                        <label>Apellidos:</label><br>
                        <input class="form-control" type="text" name="tapellidos" id="apellidos" placeholder="Introduzca apellidos" required><br><br>                     
                        <label>Telefono:</label><br>
                        <input class="form-control" type="text"  name="ttelefono" id="telefono" placeholder="Introduzca telefono" required><br><br>
                        <label>Correo:</label><br>
                        <input class="form-control" name="tcorreo" type="text" id="correo" placeholder="Introduzca correo" required><br><br>
                        <label>Contraseña:</label><br>
                        <input class="form-control" type="text"  name="tpassword" id="contraseña" placeholder="Introduzca contraseña" required><br><br>

                        <input class="btn btn-danger float-right" type="submit" name="accion" value="Enviar" style="margin:5px;">
                        <input class="btn btn-danger float-right" type="reset" name="accion" value="Borrar" style="margin:5px;">
                    </form>
                </div>
            </div
        </div>
    </body>
</html>