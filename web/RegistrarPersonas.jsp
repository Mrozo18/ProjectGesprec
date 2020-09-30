<%  if (session.getAttribute("ROL") != null) { %>
<% if (session.getAttribute("ROL").equals("1")) { %>        
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1, shrink-to-fit=no" name="viewport">
        <meta content="Start your development with a Dashboard for Bootstrap 4." name="description">
        <meta content="Spruko" name="author">
        <%  response.setHeader("Programa", "No-cache");
            response.setHeader("Cache-Control", "no-cache, no-store,must-revalidate");
            response.setDateHeader("Expires", 0); %>

        <!-- Title -->
        <title>Resgistrar Abogados</title>

        <!-- Favicon -->
        <link href="assets/img/logo.png" rel="icon" type="image/png">

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,600,700,800" rel="stylesheet">

        <!-- Icons -->
        <link href="assets/css/icons.css" rel="stylesheet">

        <!--Bootstrap.min css-->
        <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">

        <!-- Ansta CSS -->
        <link href="assets/css/dashboard.css" rel="stylesheet" type="text/css">

        <!-- Custom scroll bar css-->
        <link href="assets/plugins/customscroll/jquery.mCustomScrollbar.css" rel="stylesheet" />

        <!-- Sidemenu Css -->
        <link href="assets/plugins/toggle-sidebar/css/sidemenu.css" rel="stylesheet">

        <!-- Validadcion de JavaScript -->
        <script src="js/validators/validatePerson.js"></script>

    </head>
    <body class="app sidebar-mini rtl" >
        <div id="global-loader" ></div>
        <div class="page">
            <div class="page-main">
                <!-- Sidebar menu-->
                <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
                <jsp:include page="nav.jsp" flush="true"></jsp:include>
                    <!-- Sidebar menu-->

                    <!-- app-content-->
                    <div class="app-content ">
                        <div class="side-app">
                            <div class="main-content">
                                <div class="p-2 d-block d-sm-none navbar-sm-search">
                                    <!-- Form -->
                                    <form class="navbar-search navbar-search-dark form-inline ml-lg-auto">
                                        <div class="form-group mb-0">
                                            <div class="input-group input-group-alternative">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="fas fa-search"></i></span>
                                                </div><input class="form-control" placeholder="Search" type="text">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <!-- Top navbar -->
                            <jsp:include page="navsuperior.jsp" flush="true"></jsp:include>
                                <!-- Top navbar-->

                                <!-- Page content -->
                                <div class="container-fluid pt-8">
                                    <div class="card shadow">
                                        <div class="card-header">
                                            <h2 class="mb-0">Registro de personas </h2>
                                        </div>
                                        <div class="card-body">
                                            <form  method="post" action="personasControlador" name="addFormPerson" class="needs-validation" novalidate>
                                                <div id="alerta"></div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="form-label" for="txtidPersona">Usuario</label>
                                                            <input type="text" class="form-control" id="Id_user" name="usuario" placeholder="Ingrese Usuario" required>
                                                            <div class="valid-feedback">
                                                                Buen usuario!
                                                            </div>
                                                            <div class="invalid-feedback">
                                                                Ingresar usuario!
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="form-label" for="txtnombrePersona">Nombre</label>
                                                            <input type="text" class="form-control " id="Nombre" name="txtnombrePersona" placeholder="Ingrese Nombre" required>
                                                            <div class="valid-feedback">
                                                                Buen nombre!
                                                            </div>
                                                            <div class="invalid-feedback">
                                                                Ingresa nombre!
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="form-label"for="txtapellidoPersona">Apellido</label>
                                                            <input type="text" class="form-control" id="Apellido" name="txtapellidoPersona"  placeholder="Ingrese Apellido" required>
                                                            <div class="valid-feedback">
                                                                Buen apellido!
                                                            </div>
                                                            <div class="invalid-feedback">
                                                                Ingresa un apellido!
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Estado</label>
                                                            <select name="txtestadoPersona" class="form-control select2 w-100" required>
                                                                <option selected disabled value="">Escoja</option>
                                                                <option value="Activo">Activo</option>
                                                                <option value="Inactivo">Inactivo</option>
                                                            </select>
                                                            <div class="valid-feedback">
                                                                Ingreso un estado!
                                                            </div>
                                                            <div class="invalid-feedback">
                                                                Ingresa un estado!
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="form-label" for="txtemailPersona">Email</label>
                                                            <input type="email" class="form-control "id="email" name="txtemailPersona" placeholder="Ingrese correo electrónico" required>
                                                            <div class="valid-feedback">
                                                                Ingreso Email!
                                                            </div>
                                                            <div class="invalid-feedback">
                                                                Ingresa un Email!
                                                            </div>
                                                        </div>
                                                        <div class="form-group ">
                                                            <label class="form-label"  for="txttelefonoPersona">Teléfono</label>
                                                            <input type="number" class="form-control " id="Telefono" name="txttelefonoPersona" placeholder="Ingrese Teléfono" required>
                                                            <div class="valid-feedback">
                                                                Ingreo télefono!
                                                            </div>
                                                            <div class="invalid-feedback">
                                                                Ingresa un télefono!
                                                            </div>
                                                        </div>
                                                        <div class="form-group mb-4">
                                                            <label>Rol</label>
                                                            <select name="rol" class="form-control select2 w-100" required>
                                                                <option selected disabled value="">Seleccionar</option>
                                                                <option value="1">Administrador</option>
                                                                <option value="2">Abogado</option>
                                                            </select>
                                                            <div class="valid-feedback">
                                                                Ingreso rol!
                                                            </div>
                                                            <div class="invalid-feedback">
                                                                Ingresa un rol!
                                                            </div>
                                                        </div>
                                                        <div class="form-group ">
                                                            <br>
                                                            <button type="submit"  class="btn btn-primary " name="opcion" value="1"> <svg class="bi bi-arrow-bar-right" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                                <path fill-rule="evenodd" d="M10.146 4.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L12.793 8l-2.647-2.646a.5.5 0 0 1 0-.708z"/>
                                                                <path fill-rule="evenodd" d="M6 8a.5.5 0 0 1 .5-.5H13a.5.5 0 0 1 0 1H6.5A.5.5 0 0 1 6 8zm-2.5 6a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 1 0v11a.5.5 0 0 1-.5.5z"/>
                                                                </svg> Enviar
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                            <script>
                                                (function () {
                                                    'use strict';
                                                    window.addEventListener('load', function () {
                                                        // Fetch all the forms we want to apply custom Bootstrap validation styles to
                                                        var forms = document.getElementsByClassName('needs-validation');
                                                        // Loop over them and prevent submission
                                                        var validation = Array.prototype.filter.call(forms, function (form) {
                                                            form.addEventListener('submit', function (event) {
                                                                if (form.checkValidity() === false) {
                                                                    event.preventDefault();
                                                                    event.stopPropagation();
                                                                }
                                                                form.classList.add('was-validated');
                                                            }, false);
                                                        });
                                                    }, false);
                                                })();
                                            </script>
                                        </div>
                                        <br><div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                <% if (request.getAttribute("MensajeErrorR") != null) { %>
                                                <div class="alert alert-danger alert-dismissible fade show">
                                                    <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                        <i class="nc-icon nc-simple-remove"></i>
                                                    </button>
                                                    <span>
                                                        No es posible realizar el registro </span>
                                                </div>
                                                <%} else if (request.getAttribute("MensajeExitoR") != null) {%>

                                                <div class="alert alert-success alert-dismissible fade show">
                                                    <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                        <i class="nc-icon nc-check-2"></i><br>
                                                    </button>
                                                    <span>
                                                        El Usuario se registró corectamente</span>
                                                </div>
                                                <%}%>
                                            </div>


                                            <div class="col-md-12">
                                                <% if (request.getAttribute("MensajeErrorA") != null) {%>
                                                <div class="alert alert-danger alert-dismissible fade show">
                                                    <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                        <i class="nc-icon nc-simple-remove"></i>
                                                    </button>
                                                    <span>
                                                        No es posible realizar el registro </span>
                                                </div>
                                                <%}%>
                                                <% if (request.getAttribute("MensajeExitoA") != null) {%>

                                                <div class="alert alert-success alert-dismissible fade show">
                                                    <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                        <i class="nc-icon nc-check-2"></i><br>
                                                    </button>
                                                    <span>
                                                        El Usuario se actualizó corectamente</span>
                                                </div>
                                                <%}%>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- Footer -->
                        <footer class="footer">
                            <div class="row align-items-center justify-content-xl-between footerG">
                                <div class="col-xl-6">
                                    <div class="copyright text-center text-xl-left text-muted">
                                        <p class="text-sm font-weight-500">Copyright 2020 © Todos los derechos son reservados .GESPREC</p>
                                    </div>
                                </div>
                                <div class="col-xl-6">
                                    <p class="float-right text-sm font-weight-500"><a href="www.templatespoint.net">Min Tic</a></p>
                                </div>
                            </div>
                        </footer>
                        <!-- Footer -->

                    </div>
                </div>
            </div>
        </div>
        <!--app-content-->
    </div>
</div>

<!-- Back to top -->
<a href="#top" id="back-to-top"><i class="fa fa-angle-up"></i></a>

<!-- Ansta Scripts -->
<!-- Core -->
<script src="assets/plugins/jquery/dist/jquery.min.js"></script>
<script src="assets/js/popper.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

<!-- Optional JS -->
<script src="assets/plugins/chart.js/dist/Chart.min.js"></script>
<script src="assets/plugins/chart.js/dist/Chart.extension.js"></script>

<!-- Data tables -->
<script src="assets/plugins/datatable/jquery.dataTables.min.js"></script>
<script src="assets/plugins/datatable/dataTables.bootstrap4.min.js"></script>

<!-- Fullside-menu Js-->
<script src="assets/plugins/toggle-sidebar/js/sidemenu.js"></script>

<!-- Custom scroll bar Js-->
<script src="assets/plugins/customscroll/jquery.mCustomScrollbar.concat.min.js"></script>

<!-- Ansta JS -->
<script src="assets/js/custom.js"></script>
</body>

</html>

<% } else {
        request.getRequestDispatcher("sesion.jsp").forward(request, response);
    }  %>
<%} else {
        request.getRequestDispatcher("sesion.jsp").forward(request, response);
    }%>