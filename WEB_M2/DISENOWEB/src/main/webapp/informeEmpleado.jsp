<%-- 
    Document   : informeEmpleado
    Created on : 20 ene. 2021, 17:59:50
    Author     : MARINA
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="logica.Usuario"%>
<%@page import="util.ConsultaBd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Elegir Empleado</title>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="js/informes.js"></script>
    </head>
    <%
        HttpSession sesion = request.getSession();
        //Si el usuario no tiene una sesion el redirige
        if(sesion.getAttribute("usuarioSesion") == null){
            response.sendRedirect("./index.jsp");
        }
        //Solo puede acceder un empleado de RRHH, si lo intenta un empleado de una empresa le 
        //redirige a la pagina de inicio de sesion.
        else{
            String nombre = sesion.getAttribute("usuarioSesion").getClass().getSimpleName();
            if(nombre.equalsIgnoreCase("Usuario")){
                response.sendRedirect("./inicioUser.jsp");
            }
        
    %>
    <%
        String mensajeAlerta = "";
        Object objetoAlerta = sesion.getAttribute("mensaje");
        if(objetoAlerta != null){
            mensajeAlerta = objetoAlerta.toString();
            sesion.setAttribute("mensaje", null);
        }
    %>
    <script>
        var mensaje = "<%=mensajeAlerta%>";
        if(mensaje.length !== 0){
            alert(mensaje);
        }
    </script>
    <body style="height: 1500px; padding-top: 5rem;">
   <div id="nav-placeholder"></div>
        <script>
            $(function () {
                $("#nav-placeholder").load("navbarRRHH.jsp");
            });
        </script>
        <!--end of Navigation bar-->
    <div class="row justify-content-center">
            <div class="col-4">
                <h1 class="text-center">Seleccione los detalles del informe: </h1>
                <div>
                    <br><br>
                    <form id="informe" action="CalendarController?action=InformeEmpleado" method="post">
                        <label>Empleado:</label><br><!--SELECT con opciones de empleados -->
                        
                        <select class="custom-select" name="idEmpleado" id="idEmpleado" required>
                            <%
                        ConsultaBd emp = new ConsultaBd();
                        List<Usuario> lista_empleados = emp.mostrarEmpleados();
                        Iterator<Usuario> iterador = lista_empleados.iterator();
                        Usuario u = null;
                        while (iterador.hasNext()) {
                            u = iterador.next();
                        %>
                            <option value="<%= u.getIdUsuario()%>">
                                <%= u.getIdUsuario()%> - <%= u.getNombre()%> <%= u.getApellidos()%>   
                            </option>
                        <% }%>  
                        </select><br><br>
                            <p>Periodo de tiempo a incluir:</p>
                            <input type="radio" id="semanal" name="tiempo" value="semanal" onclick="mostrarDatepicker()">
                            <label for="semanal">Semanal</label><br>
                            <input type="radio" id="mensual" name="tiempo" value="mensual" onclick="mostrarDatepicker()">
                            <label for="female">Mensual</label><br>
                            <input type="radio" id="otro" name="tiempo" value="otro" onclick="mostrarDatepicker()">
                            <label for="otro">Especificar intervalo de tiempo:</label>
                            <span id='box' style="display:none;">
                                <p>Inicio:</p>
                            <input class="form-control" name="inicio" type="datetime-local" id="inicio" required><br>
                                <p>Fin:</p>
                            <input class="form-control" name="fin" type="datetime-local" id="fin" required><br>
                            </span>
                            <br><br>
                        <input class="btn btn-danger float-right" type="submit" name="accion" value="Confirmar" style="margin:5px;">
                    </form>
                </div>
            </div>
        </div>
    </body>
    <% }%>
</html>
