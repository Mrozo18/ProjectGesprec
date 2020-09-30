<%-- 
    Document   : registrarContrato
    Created on : 16/06/2020, 01:02:49 AM
    Author     : Dell_1
--%>
<%@page import="ModeloVO.PersonasVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.PersonasDAO"%>
<%  if (session.getAttribute("ROL") != null) { %>
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
        <title>Registrar Contrato</title>

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

        <!-- Tabs CSS -->
        <link href="assets/plugins/tabs/style.css" rel="stylesheet" type="text/css">

        <!-- jvectormap CSS -->
        <link href="assets/plugins/jvectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet" />

        <!-- Custom scroll bar css-->
        <link href="assets/plugins/customscroll/jquery.mCustomScrollbar.css" rel="stylesheet" />

        <!-- Sidemenu Css -->
        <link href="assets/plugins/toggle-sidebar/css/sidemenu.css" rel="stylesheet">

    </head>
    <body class="app sidebar-mini rtl" >
        <div id="global-loader" ></div>
        <div class="page">
            <div class="page-main">
                <!-- Sidebar menu-->
                <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
                <!-- nav -->
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

                                <!-- Paginá de contenido -->
                                <div class="container-fluid pt-8">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="card shadow">
                                                <div class="card-header">
                                                    <h2 class="mb-0">Registrar Contrato</h2>
                                                </div>
                                                <div class="card-body">
                                                    <form method="post" action="contratoContrato" class="needs-validation" novalidate>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label class="form-label" for="lb_idContrato">Id</label>
                                                                    <input type="text" class="form-control" id="Id_user" name="txt_idContrato" placeholder="Id_Contrato" readonly >
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="form-label">Abogado</label>
                                                                    <select name="txt_idPersona" class="form-control custom-select">
                                                                    <%
                                                                        PersonasVO PersonVO = new PersonasVO();
                                                                        PersonasDAO PersonDAO = new PersonasDAO();
                                                                        ArrayList<PersonasVO> listarPersonas = PersonDAO.listar();
                                                                        for (int i = 0; i < listarPersonas.size(); i++) {
                                                                            PersonVO = listarPersonas.get(i);
                                                                    %>
                                                                    <option value="<%=PersonVO.getIdPersona()%>"><%=PersonVO.getNombrePersona()%> <%=PersonVO.getApellidoPersona()%></option>
                                                                    <% } %>
                                                                </select>
                                                                <div class="valid-feedback">
                                                                    Ingreso un abogado!
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label  class="form-label" for="dt_fechainicio">Fecha Inicio Contrato</label>
                                                                <input type="DATE" class="form-control" id="name" name="dt_fechaInicio" required>
                                                                <div class="valid-feedback">
                                                                    Ingreso una fecha!
                                                                </div>
                                                                <div class="invalid-feedback">
                                                                    Ingresa una fecha!
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="form-label" for="lb_diashabiles">Dias Hábiles Firma Contrato</label>
                                                                <input type="number" class="form-control" id="Telefono" name="txt_diasHabiles" placeholder="Ingrese Días Hábiles para la firma del contrato" required>
                                                                <div class="valid-feedback">
                                                                    Ingreso días!
                                                                </div>
                                                                <div class="invalid-feedback">
                                                                    Ingresa un día habil!
                                                                </div>
                                                            </div>
                                                            <div id="1" class="form-group">
                                                                <label class="form-label">Estado</label>
                                                                <select name="txt_estado" class="form-control custom-select" required >
                                                                    <option selected disabled value="">Escoja</option>
                                                                    <option value="activo">Activo</option>
                                                                    <option value="inactivo">Inactivo</option>
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
                                                                <label class="form-label" for="lb_observacion">Observación</label>
                                                                <input type="text" class="form-control" id="Id_user" name="txt_Observacion" placeholder="Observación" required>
                                                                <div class="valid-feedback">
                                                                    Ingreso una observación!
                                                                </div>
                                                                <div class="invalid-feedback">
                                                                    Ingresa una observación!
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="form-label" for="lb_ultimaActualizacion">Última Actualización</label>               
                                                                <input type="DATE" class="form-control" id="Estado" name="dt_ultimaActua" required>
                                                                <div class="valid-feedback">
                                                                    Ingreso fecha de actualización!
                                                                </div>
                                                                <div class="invalid-feedback">
                                                                    Ingresa una fecha de actualización!
                                                                </div>
                                                            </div>
                                                            <div id="2" class="form-group">
                                                                <label class="form-label">Tipo de Contrato</label>
                                                                <select name="txt_tipoContrato" class="form-control custom-select" required>
                                                                    <option selected disabled value="">Escoja</option>
                                                                    <option value="6">Concurso de mérito abierto   </option>
                                                                    <option value="7">Contratación directa</option>
                                                                    <option value="8">Contrato de prestación de servicios </option>
                                                                    <option value="8">Licitación pública </option>
                                                                    <option value="8">Mínima cuantía</option>
                                                                    <option value="8">Selección abreviada acuerdo marco </option>
                                                                    <option value="8">Selección abreviada mínima cuantía</option>
                                                                    <option value="8">Selección abreviada por subasta inversa</option>
                                                                    <option value="8">Contrato de compraventa</option>
                                                                    <option value="8">Contrato de consultoría</option>
                                                                    <option value="8">Contrato de prestación de servicios </option>
                                                                    <option value="8">Contrato de seguro</option>
                                                                    <option value="8">Contrato de suministro</option>
                                                                    <option value="8">Contrato de Licitación pública</option>

                                                                </select>
                                                                <div class="valid-feedback">
                                                                    Ingreso un tipo de contrato!
                                                                </div>
                                                                <div class="invalid-feedback">
                                                                    Ingresa una tipo de contrato!
                                                                </div>
                                                            </div>
                                                            <div id="3" class="form-group">
                                                                <label class="form-label">Modalidad</label>
                                                                <select name="txt_modalidad" class="form-control custom-select" required>
                                                                    <option selected disabled value="">Escoja</option>
                                                                    <option value="1">LICITACIÓN PÚBLICA</option>
                                                                    <option value="2">SELECCIÓN ABREVIADA DE MENOR CUANTÍA </option>
                                                                    <option value="1">SELECCIÓN ABREVIADA POR SUBASTA INVERSA </option>
                                                                    <option value="2">CONCURSO DE MÉRITOS ABIERTO </option>
                                                                    <option value="1">MÍNIMA CUANTÍA</option>

                                                                </select>
                                                                <div class="valid-feedback">
                                                                    Ingreso una modalidad!
                                                                </div>
                                                                <div class="invalid-feedback">
                                                                    Ingresa una modalidad!
                                                                </div>
                                                            </div>
                                                            <div class="form-group">

                                                                <br><button type="submit" class="btn btn-primary" name="opcion" value="1">                                <svg class="bi bi-arrow-bar-right" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
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
                                        </div>
                                        <br><div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <% if (request.getAttribute("MensajeErrorR") != null) {%>
                                                    <div class="alert alert-danger alert-dismissible fade show">
                                                        <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                            <i class="nc-icon nc-simple-remove"></i>
                                                        </button>
                                                        <span>
                                                            No es posible realizar el registro</span>
                                                    </div>
                                                    <%} else if (request.getAttribute("MensajeExitoR") != null) {%>

                                                    <div class="alert alert-success alert-dismissible fade show">
                                                        <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                            <i class="nc-icon nc-check-2"></i><br>
                                                        </button>
                                                        <span>
                                                            El Contrato se registró corectamente</span>
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
                                                            <b> Error - </b> Se produjo un error</span>
                                                    </div>
                                                    <%}%>
                                                    <% if (request.getAttribute("MensajeExitoA") != null) {%>

                                                    <div class="alert alert-success alert-dismissible fade show">
                                                        <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                            <i class="nc-icon nc-check-2"></i><br>
                                                        </button>
                                                        <span>
                                                            <b> Exito - </b> El Contrato se actualizó corectamente</span>
                                                    </div>
                                                    <%}%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Back to top -->
                        <a href="#top" id="back-to-top"><i class="fa fa-angle-up"></i></a>

                        <!-- Ansta Scripts -->
                        <!-- Core -->
                        <script src="assets/plugins/jquery/dist/jquery.min.js"></script>
                        <script src="assets/js/popper.js"></script>
                        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

                        <!-- Echarts JS -->
                        <script src="assets/plugins/chart-echarts/echarts.js"></script>

                        <!-- Fullside-menu Js-->
                        <script src="assets/plugins/toggle-sidebar/js/sidemenu.js"></script>

                        <!-- Custom scroll bar Js-->
                        <script src="assets/plugins/customscroll/jquery.mCustomScrollbar.concat.min.js"></script>

                        <!-- peitychart -->
                        <script src="assets/plugins/peitychart/jquery.peity.min.js"></script>
                        <script src="assets/plugins/peitychart/peitychart.init.js"></script>

                        <!-- Vector Plugin -->
                        <script src="assets/plugins/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
                        <script src="assets/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
                        <script src="assets/plugins/jvectormap/gdp-data.js"></script>
                        <script src="assets/plugins/jvectormap/jquery-jvectormap-us-aea-en.js"></script>
                        <script src="assets/plugins/jvectormap/jquery-jvectormap-uk-mill-en.js"></script>
                        <script src="assets/plugins/jvectormap/jquery-jvectormap-au-mill.js"></script>
                        <script src="assets/plugins/jvectormap/jquery-jvectormap-ca-lcc.js"></script>
                        <script src="assets/js/dashboard2map.js"></script>

                        <!-- Ansta JS -->
                        <script src="assets/js/custom.js"></script>
                        <script src="assets/js/dashboard-sales.js"></script>
                        </body>
                        </html>

                        <%} else {
                                request.getRequestDispatcher("sesion.jsp").forward(request, response);
                            }%>