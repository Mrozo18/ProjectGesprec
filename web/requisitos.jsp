<%-- 
    Document   : requisitos
    Created on : 17/08/2020, 08:09:23 PM
    Author     : melis
--%>
<%  if (session.getAttribute("ROL") != null) { %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="img/logo.png">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="css/modalidades.css">
        <title>Seguimiento</title>
        <%  response.setHeader("Programa", "No-cache");
     response.setHeader("Cache-Control", "no-cache, no-store,must-revalidate");
     response.setDateHeader("Expires", 0); %>
    </head>
    <body>
        <form action="Seguimiento?" method="POST">
          
        </form>
        <!--Menú-->
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <a class="navbar-brand" href="jsp/abogado/ilawyer.jsp">
                <img src="img/logo.png" width="30" height="30" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Seguimiento</a>
                    </li>
            </div>
            <div class="dropdown">
                <a href="#" class="nav-link dropdown-toggle text-white" data-toggle="dropdown">Cerrar sesión</a>
                <div class="dropdown-menu text-center">
                    <a><img src="img/avatarweb.png"  height="80" width="80"></a><br>
                    <a>Abogado</a>
                    <div class="dropdown-divider"></div>
                    <a href="index.jsp" class="dropdown-item">Salir</a>
                </div>
            </div>
        </nav>
        <!--Fin Menú-->
        <section>
            <div class="container listaModal">
                <div class="col-md-12 text-center">
                    <h1 class="text-info">Segumiento</h1>
                    <div class="col-md-12 m-2 d-flex justify-content-between">
                        <h2  class="text-secondary">Requisitos</h2>
                      <!--  <form action="ModalidadServlet" method="GET">
                            <input name="action" value="buscar" hidden>
                            <label for="q" class="text-secondary"><b>Buscar:</b></label>
                            <input name="q" type="text" class="text-dark" placeholder="Nom o ID de Modal">
                            <button class="btn btn-outline-primary"><svg class="bi bi-search" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
                                <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
                                </svg></button>
                        </form>
                        <button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#modalForm">
                            Agregar
                        </button>-->
                    </div>
                    <section class="col-md-12 flex-nowrap table-responsive">
                        <table class="table table-striped table-hover">
                            <thead class="table-secondary text-dark">
                                <tr>
                                    <th>Id Modalidad</th>
                                    <th>Nombre de los requisitos</th>
                                 <!--    <th>Acciones</th>-->
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="r" items="${requisitos}">
                                    <tr>
                                        <td>${r.getIdRequisitos()}</td>
                                        <td>${r.getNombreRequisito()}</td>
                                        <td>
                                            <button type="button" class="btn bg-info" ></i></button>
                                            <a href="#" class="btn btn-info"> Consultar Requisitos </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                           <!--  <tbody>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        <a href="#" class="btn btn-info"> Seguimiento </a>
                                        <a href="actualizarModalidad.jsp?idModalidad" class="btn btn-secondary">Modificar</a>
                                    </td>
                                </tr>
                            </tbody>--> 
                        </table>
                    </section>
                </div>
            </div>



            <div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Digita el nombre de la modalidad</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="ModalidadServlet" method="POST">
                                <div class="form-group">
                                    <label for="NombreMod">Nombre:</label>
                                    <input name="NombreMod" type="text" class="form-control" placerholder="Digite aqui el nombre de la modalidad" required pattern="[A-Za-z0-9 ]{5,100}">
                                </div>
                                <div class="d-flex justify-content-between">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                    <button class="btn btn-primary">Agregar Modalidad</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>           
        </section>

        <script src="js/modalidades.js"></script>


        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    </body>
</html>
 <%} else {
                                                            request.getRequestDispatcher("sesion.jsp").forward(request, response);
                                                        }%>
