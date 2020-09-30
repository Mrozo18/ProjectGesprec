<%  if (session.getAttribute("ROL") != null) { %>

<%-- 
    Document   : consultarContrato
    Created on : 16/06/2020, 08:27:15 AM
    Author     : Dell_1
--%>

<%@page import="ModeloDAO.ContratoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloVO.ContratoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" dir="ltr">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1, shrink-to-fit=no" name="viewport">
        <meta content="Start your development with a Dashboard for Bootstrap 4." name="description">
        <meta content="Spruko" name="author">
        <%  response.setHeader("Programa", "No-cache");
            response.setHeader("Cache-Control", "no-cache, no-store,must-revalidate");
            response.setDateHeader("Expires", 0); %>
        <!-- Title -->
        <title>Consultar Contrato</title>

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
                                <!-- Page content -->
                                <div class="container-fluid pt-8">

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="card shadow">
                                                <div class="card-header">
                                                    <h2 class="mb-0">Contratos</h2>
                                                </div>
                                                <div class="card-body">
                                                    <div class="table-responsive">
                                                        <table id="example" class="table table-striped table-bordered w-100 text-nowrap">
                                                            <thead>
                                                                <tr>
                                                                    <th class="wd-15p">#</th>
                                                                    <th class="wd-15p">Abogado</th>
                                                                    <th class="wd-20p">Fecha Inicio</th>
                                                                    <th class="wd-15p">Días hábiles</th>
                                                                    <th class="wd-10p">Estado</th>
                                                                    <th class="wd-25p">Observación</th>
                                                                    <th class="wd-15p">Última Actualización</th>
                                                                    <th class="wd-15p">Tipo Contrato</th>
                                                                    <th class="wd-20p">Modalidad</th>
                                                                    <th class="wd-15p">Acciones</th>

                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                            <%
                                                                ContratoVO contratoVo = new ContratoVO();
                                                                ArrayList<ContratoVO> listarc = new ContratoDAO().listarc();
                                                                for (int i = 0; i < listarc.size(); i++) {
                                                            %>
                                                            <tr>
                                                                <td ><%= listarc.get(i).getIdContrato()%></td>
                                                                <td><%= listarc.get(i).getNombrePersona()%></td>
                                                                <td><%= listarc.get(i).getFechainicio_Contrato()%></td>  
                                                                <td><%= listarc.get(i).getDiasHabiles()%></td>
                                                                <td><%= listarc.get(i).getEstado()%></td>
                                                                <td><%= listarc.get(i).getObservacion()%></td> 
                                                                <td><%= listarc.get(i).getUltimaActualizacion()%></td>
                                                                <td><%= listarc.get(i).getNombre_Modalidad()%></td>
                                                                <td><%= listarc.get(i).getNombre_TipoContrato()%></td>
                                                                <td>

                                                                    <% if (session.getAttribute("ROL").equals("2")) {%> 
                                                                    <a class="btn btn-outline-info" href="seguimientoContrato.jsp?numc=<%= listarc.get(i).getIdContrato()%>"><i class="fas fa-search"></i></a>
                                                                        <% } else if (session.getAttribute("ROL").equals("1")) {%>
                                                                    <button  class="btn btn-outline-info" title="Actualizar" onclick="verContrato('<%= listarc.get(i).getIdContrato()%>');" ><i class="fas fa-edit"></i></button>
                                                                        <% } %>
                                                                </td>
                                                            </tr>
                                                            <% }%>




                                                        <div class="modal fade" id="ModalActualizar" tabindex="-1" role="dialog" aria-labelledby="editContrato" aria-hidden="true">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">Modificando el contrato <strong></strong></h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div> 
                                                                    <div class="modal-body">
                                                                        <form method="POST" action="contratoContrato" >
                                                                            <div class="row">
                                                                                <input type="hidden" class="form-control" placeholder="ID" id="txt_idContrato"  name="txt_idContrato" required="" value="" hidden>
                                                                                <div class="col-md-5 pr-1">
                                                                                    <div class="form-group">
                                                                                        <label>Fecha Inicio</label>
                                                                                        <input type="date" class="form-control" placeholder="Fecha Inicio" id="txtfechaInicio"   name="dt_fechaInicio" required="" value=""  maxlength="20">
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label>Días Hábiles</label>
                                                                                        <input type="text" class="form-control" placeholder="Días Hábiles" id="txtdiasHabiles"  name="txt_diasHabiles" required="" >

                                                                                    </div>

                                                                                </div>
                                                                                <div class="col-md-6 pl-1">
                                                                                    <div class="form-group">

                                                                                        <div class="form-group">
                                                                                            <label>Observación</label>
                                                                                            <input type="text" class="form-control" placeholder="Observación" id="txtObservacion"  name="txt_Observacion" required="" value="<"  maxlength="500">
                                                                                        </div>
                                                                                        <div class="form-group">

                                                                                            <div class="form-group">
                                                                                                <label>Última actualización </label>
                                                                                                <input type="date" class="form-control" placeholder='Ultima actualizacion' id="txtultimaactualizacion"  name="dt_ultimaActua" required="" value=""  maxlength="20" pattern="[0-9]{1,11}" title="Solo se adminten numeros" required>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <label>Estado</label>
                                                                                            <select name="txt_estado" id="txtestadoContrat" class="form-control" >
                                                                                                <option value="">Seleccionar</option>
                                                                                                <option value="activo">Activo</option>
                                                                                                <option value="inactivo">Inactivo</option>

                                                                                            </select>

                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <input type="hidden" name="idcontrato" id="idcontrato">
                                                                                <button class="btn btn-outline-danger" data-dismiss="modal"><i class="far fa-times-circle"></i></button>
                                                                                <button type="submit" class="btn btn-outline-info" name="opcion" value="2"><i class="fas fa-check"></i></button>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="row">
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
                                                    El contrato se registró corectamente</span>
                                            </div>
                                            <%}%>
                                        </div>


                                        <div class="col-md-12">
                                            <% if (request.getAttribute("MensajeErrorA") != null) {%>
                                            <div class="alert alert-danger alert-dismissible">
                                                <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                    <i class=""></i>
                                                </button>
                                                <span>
                                                    No es posible realizar el registr</span>
                                            </div>
                                            <%}%>
                                            <% if (request.getAttribute("MensajeExitoA") != null) {%>

                                            <div class=" alert alert-success alert-dismissible " >
                                                <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                    <i class=""></i><br>
                                                </button>
                                                <span>
                                                    El Contrato se actualizó corectamente</span>
                                            </div>
                                            <%}%>
                                        </div>
                                    </div>

                                </div>  
                                <!-- Footer -->
                                <footer class="footer">
                                    <div class="row align-items-center justify-content-xl-between">
                                        <div class="col-xl-6">
                                            <div class="copyright text-center text-xl-left text-muted">
                                                <p class="text-sm font-weight-500">Copyright 2018 © All Rights Reserved.Dashboard Template</p>
                                            </div>
                                        </div>
                                        <div class="col-xl-6">
                                            <p class="float-right text-sm font-weight-500"><a href="www.templatespoint.net">Templates Point</a></p>
                                        </div>
                                    </div>
                                </footer>
                                <!-- Footer -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Back to top -->
        <a href="#top" id="back-to-top"><i class="fa fa-angle-up"></i></a>


        <script>
            $(function (e) {
                $('#example').DataTable();
                var table = $('#example1').DataTable();
                $('button').click(function () {

                });
                $('#example2').DataTable({
                    "scrollY": "200px",
                    "scrollCollapse": true,
                    "paging": false
                });
            });
            function verContrato(id) {
                console.log(id);
                // {"estado":"activo","fechainicio_Contrato":"2020-04-05","ultimaActualizacion":"2020-05-03","diasHabiles":"3","idContrato":"40","observacion":"contrato en proceso"}
                $.post("contratoContrato?opcion=3", {contrato: id}, function (out) {
                    var json = JSON.parse(out);

                    console.log(json.fechainicio_Contrato);
                    $('#txtfechaInicio').val(json.fechainicio_Contrato);
                    $('#txtdiasHabiles').val(json.diasHabiles);
                    $('#txtObservacion').val(json.observacion);
                    $('#txtultimaactualizacion').val(json.ultimaActualizacion);
                    $('#txtestadoContrat').val(json.estado);
                    $('#txtObservacion').val(json.observacion);
                    $('#txt_idContrato').val(json.idContrato);

                    $('#ModalActualizar').modal();

                });

            }

        </script>

        <!-- Ansta Scripts -->
        <!-- Core -->
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
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
    }%>
