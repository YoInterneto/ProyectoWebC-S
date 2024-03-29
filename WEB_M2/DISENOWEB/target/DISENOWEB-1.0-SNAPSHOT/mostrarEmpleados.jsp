<%-- 
    Document   : mostrarEmpleados
    Created on : 7 ene. 2021, 19:51:46
    Author     : MARINA
--%>

<%@page import="logica.Empresa"%>
<%@page import="logica.Usuario"%>
<%@page import="util.ConsultaBd"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="logica.Empleado"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
    </head>
    <%
        HttpSession sesion = request.getSession();
        //Si el usuario no tiene una sesion el redirige
        if(sesion.getAttribute("usuarioSesion") == null){
            response.sendRedirect("./index.jsp");
        }
        //Solo puede acceder un empleado de RRHH, si lo intenta un empleado de una empresa le 
        //redirige a la pagina de inicio de sesion
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
        <div class="container">
            <br>
            <h2>Empleados</h2> 
            <br>
            <form action="MainController?action=elegirUsuario&boton=editar" method="POST">
                <table class="table table-hover">
                    <thead> <!--cabecera de la tabla-->
                        <tr>
                            <th></th>
                            <th>DNI</th>
                            <th>Nombre</th>
                            <th>Apellidos</th>
                            <th>Empresa</th>
                            <th>Email</th>
                            <th>Telefono</th>
                        </tr>
                    </thead>
                    <%
                        ConsultaBd emp = new ConsultaBd();
                        List<Usuario> lista_empleados = emp.mostrarEmpleados(); //lista con los empleados de la base de datos
                        Iterator<Usuario> iterador = lista_empleados.iterator();
                        Usuario u = null;
                        //para cada empleado se genera una fila
                        while (iterador.hasNext()) { //recorre la lista de empleados
                            u = iterador.next();
                    %> 
                    <!--cuerpo de la tabla-->
                    <tbody>
                        <tr> <!-- inicio de una fila de la tabla-->
                            <td>
                                <input type="radio" name="empleado" value="<%=u.getIdUsuario()%>" required> <!--seleccionar usuario a editar -->
                            </td>
                            <td><%= u.getIdUsuario()%></td>
                            <td><%= u.getNombre()%></td>
                            <td><%= u.getApellidos()%></td>
                            <%  String nombreEmpresa="";
                                Empresa empresa;
                                empresa =u.getEmpresa();
                                if(empresa == null){
                                    nombreEmpresa = "Empleado no registrado correctamente";
                                }else{
                                    nombreEmpresa = empresa.getNombre();
                                }
                            %>
                            <td><%= nombreEmpresa %></td>
                            <td><%= u.getEmail()%></td>
                            <td><%= u.getTelefono()%></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>     
                <div class="col-md-12 text-right">
                    <button type="submit" class="btn btn-danger text-right" style="height:40px">
                        Editar
                    </button>
                    <!-- al pulsar el boton se produce la llamada al servlet elegirUsuario, eliminar-->
                    <button type="submit" formaction="MainController?action=elegirUsuario&boton=eliminar" class="btn btn-danger text-right" style="height:40px">
                        Eliminar
                    </button>
                    <a href="darAlta.jsp">
                        <button type="button" class="btn btn-danger text-right" style="height:40px">
                            Añadir
                        </button>
                    </a>
                    <br><br><br>
                </div>
            </form>
        </div>
    </body>
    <% }%>
</html>
