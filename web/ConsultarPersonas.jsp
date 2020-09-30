
<%  if (session.getAttribute("ROL") != null) { %>
<% if (session.getAttribute("ROL").equals("1")) { %> 

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.PersonasDAO"%>
<%@page import="ModeloVO.PersonasVO"%>
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
        <title>Consultar Abogados</title>

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

        <!-- Data table css -->
        <link href="assets/plugins/datatable/dataTables.bootstrap4.min.css" rel="stylesheet" />

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
                                <div class="container-fluid pt-8">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="card shadow">
                                                <div class="card-header">
                                                    <h2 class="mb-0">Abogados</h2>
                                                </div>
                                                <div class="card-body">
                                                    <div class="table-responsive">
                                                        <table id="example" class="table table-striped table-bordered w-100 text-nowrap">
                                                            <thead>
                                                                <tr>
                                                                    <th class="wd-15p">Identidicación</th>
                                                                    <th class="wd-15p">Nombre</th>
                                                                    <th class="wd-20p">Apellido</th>
                                                                    <th class="wd-15p">Teléfono</th>
                                                                    <th class="wd-10p">E-mail</th>
                                                                    <th class="wd-25p">Identidicación Usuario</th>
                                                                    <th class="wd-15p">Estado</th>
                                                                    <th class="wd-15p">Acciones</th>

                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                            <%
                                                                PersonasVO PersonVO = new PersonasVO();
                                                                PersonasDAO PersonDAO = new PersonasDAO();
                                                                ArrayList<PersonasVO> listarPersonas = PersonDAO.listar();
                                                                for (int i = 0; i < listarPersonas.size(); i++) {
                                                                    PersonVO = listarPersonas.get(i);
                                                            %>

                                                            <tr >
                                                                <td ><%=PersonVO.getIdPersona()%></td>
                                                                <td><%=PersonVO.getNombrePersona()%></td>
                                                                <td><%=PersonVO.getApellidoPersona()%></td>  
                                                                <td><%=PersonVO.getTelefonoPersona()%></td>
                                                                <td><%=PersonVO.getEmailPersona()%></td>
                                                                <td><%=PersonVO.getIdUsuario()%></td>
                                                                <td><%=PersonVO.getEstadoPersona()%></td>
                                                                <td><a class="btn btn-outline-info" title="Actualizar" onclick="editDatos('<%=PersonVO.getNombrePersona()%>', '<%=PersonVO.getEmailPersona()%>', '<%=PersonVO.getApellidoPersona()%>', '<%=PersonVO.getIdPersona()%>', '<%=PersonVO.getTelefonoPersona()%>', '<%=PersonVO.getEstadoPersona()%>')" ><i class="fas fa-user-edit"></i></a></td>
                                                            </tr>
                                                            <% }%>
                                                        </tbody>
                                                    </table>

                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                    <div>
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
                                                            La persona actualizó corectamente</span>
                                                    </div>
                                                    <%}%>
                                                </div>


                                                <div class="col-md-12">
                                                    <% if (request.getAttribute("MensajeErrorA") != null) {%>
                                                    <div class="alert alert-danger alert-dismissible">
                                                        <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                            <i class=""></i>
                                                        </button>
                                                        <span>No es posible realizar el registro </span>
                                                    </div>
                                                    <%}%>
                                                    <% if (request.getAttribute("MensajeExitoA") != null) {%>

                                                    <div class=" alert alert-success alert-dismissible " >
                                                        <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                                            <i class=""></i><br>
                                                        </button>
                                                        <span>
                                                            La persona se actualizó corectamente</span>
                                                    </div>
                                                    <%}%>
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
            </div>
        </div>
        <div class="modal fade" id="mdActualizar">
            <div class="modal-dialog" >
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Modificando el usuario <strong></strong></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div> 
                    <div class="modal-body">
                        <form method="POST" action="personasControlador" >
                            <div class="row">
                                <input type="hidden"   name="usuario" id="txtidPersona">
                                <div class="col-md-5 pr-1">
                                    <div class="form-group">
                                        <label>Nombre</label>
                                        <input type="text" class="form-control" placeholder="Nombre" id="txtnombrePersona"  name="txtnombrePersona" required=""  maxlength="20">
                                    </div>
                                    <div class="form-group">
                                        <label>Apellido</label>
                                        <input type="text" class="form-control" placeholder="Apellido" name="txtapellidoPersona" id="txtapellidoPersona"  required="" valname="txtapellidoPersona"  maxlength="11" >
                                    </div>
                                    <div class="form-group">
                                        <label>Teléfono</label>
                                        <input type="text" class="form-control" placeholder="Teléfono"  name="txttelefonoPersona" id="txttelefonoPersona" required="" value=""  maxlength="20">
                                    </div>
                                </div>
                                <div class="col-md-6 pl-1">
                                    <div class="form-group">

                                        <div class="form-group">
                                            <label>Email address</label>
                                            <input type="text" class="form-control" placeholder="Email"  name="txtemailPersona"  id="txtemailPersona" required="" value=""  maxlength="20">
                                        </div>
                                       
                                        <div class="form-group">
                                            <label>Estado</label>
                                            <select name="estado" id="txtestadoPersona" class="form-control" required="" >
                                                <option value="">Seleccionar</option>
                                                <option value="Activo">Activo</option>
                                                <option value="Inactivo">Inactivo</option>
                                            </select>
                                            <small id="smallestado">El estado actual del Usuario es: <strong> </strong></small>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-outline-primary" data-dismiss="modal">Cerrar</button>
                                <button type="submit" class="btn btn-outline-secondary" name="opcion" value="2">Actualizar</button>
                            </div>
                        </form>
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


                                                                    function editDatos(nombre, email, apellido, identi, telefono, estado) {
                                                                        console.log('holis');

                                                                        $('#txtnombrePersona').val(nombre);
                                                                        $('#txtapellidoPersona').val(apellido);
                                                                        $('#txttelefonoPersona').val(telefono);
                                                                        $('#txtemailPersona').val(email);
                                                                        $('#txtidPersona').val(identi);
                                                                        $('#txtestadoPersona').val(nombre);
                                                                        $('#smallestado').text(estado);


                                                                        $('#mdActualizar').modal();

                                                                    }


        </script>
    </body>


</html>
<%} else {
        request.getRequestDispatcher("sesion.jsp").forward(request, response);
    }  %>
<% } else {
        request.getRequestDispatcher("sesion.jsp").forward(request, response);
    }%>