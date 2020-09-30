
<%  if (session.getAttribute("ROL") != null) { %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "ModeloDAO.ModalidadDAO"%>
<%@page import = "java.util.ArrayList"%>
<%@page import = "ModeloVO.Modalidad"%>
<!DOCTYPE html>
<html>
    <head>
        <%  response.setHeader("Programa", "No-cache");
            response.setHeader("Cache-Control", "no-cache, no-store,must-revalidate");
            response.setDateHeader("Expires", 0); %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="img/logo.png">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="css/modalidades.css">
        <title>Modalidades</title>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1, shrink-to-fit=no" name="viewport">
        <meta content="Start your development with a Dashboard for Bootstrap 4." name="description">
        <meta content="Spruko" name="author">

        <!-- Title -->
        <title>Modalidad</title>

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
    <body>

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

                                <!-- Página de Contenido -->
                                <section>
                                    <div class="container-fluid pt-8">
                                        <div class="col-md-12">


                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="card shadow">
                                                        <div class="card-header mb-2">
                                                            <h2 class="mb-0">Modalidades</h2>
                                                        </div>
                                                        <div class="col-lg-11">
                                                        <% if (session.getAttribute("ROL").equals("1")) { %> 
                                                        <button type="button" class="btn btn-outline-info float-right" data-toggle="modal" data-target="#modalForm">
                                                            <i class="fas fa-book"></i> Agregar
                                                        </button>
                                                        <%} %>
                                                    </div>

                                                    <div class="card-body text-center">
                                                        <div class="table-responsive">
                                                            <table id="example" class="table table-striped table-bordered w-100 text-nowrap">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="wd-15p">Id</th>
                                                                        <th class="wd-15p">Nombre de Modalidad</th>
                                                                        <th class="wd-20p">Acciones</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <%
                                                                        if (request.getAttribute("busqueda") == null) {
                                                                            ArrayList<Modalidad> lista = new ModalidadDAO().getAll();
                                                                            for (int i = 0; i < lista.size(); i++) {
                                                                    %>
                                                                    <tr>
                                                                        <td>
                                                                            <%= lista.get(i).getIdModalidad()%>
                                                                        </td>
                                                                        <td>
                                                                            <%= lista.get(i).getNombre_Modalidad()%>
                                                                        </td>
                                                                        <td>
                                                                            <a href="actualizarModalidad.jsp?idModalidad=<%= lista.get(i).getIdModalidad()%>" class="btn btn-outline-info"> <i class="fas far fa-edit"></i></a>
                                                                        </td>
                                                                    </tr>
                                                                    <% }%>
                                                                </tbody>


                                                                <%} else {
                                                                    ArrayList<Modalidad> lista = (ArrayList) request.getAttribute("busqueda");
                                                                %><tbody><%
                                                                    for (int i = 0; i < lista.size(); i++) {
                                                                    %>
                                                                    <tr>
                                                                        <td>
                                                                            <%= lista.get(i).getIdModalidad()%>
                                                                        </td>
                                                                        <td>
                                                                            <%= lista.get(i).getNombre_Modalidad()%>
                                                                        </td>
                                                                        <td>
                                                                            <a href="#" class="btn btn-info"> Seguimiento </a>
                                                                            <a href="actualizarModalidad.jsp?idModalidad=<%= lista.get(i).getIdModalidad()%>" class="btn btn-secondary">Modificar</a>

                                                                        </td>
                                                                    </tr>
                                                                    <%}%>
                                                                </tbody>
                                                                <%}%>
                                                            </table>

                                                            </tbody>
                                                            </table>	
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Footer -->
                                                <footer class="footer">
                                                    <div class="row align-items-center justify-content-xl-between">
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


                                                <div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h4 class="modal-title" id="exampleModalLabel">Digite Nombre de Modalidad</h4>

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
                                                                        <button type="button" class="btn btn-outline-danger" data-dismiss="modal"><i class="fas fa-times"></i></button>
                                                                        <button class="btn btn-outline-success"><i class="fas fa-external-link-alt"></i></button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>           
                                                </section>



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
                                                <script>
                                                    function consultarModalidad(modalidad) {
                                                        console.log(modalidad);
                                                        $.post("Seguimiento?", function (data) {
                                                            $(".result").html(data);
                                                        });
                                                    }
                                                </script>
                                                <script src="js/modalidades.js"></script>
                                                </body>
                                                </html>

                                                <%} else {
                                                        request.getRequestDispatcher("sesion.jsp").forward(request, response);
                                                    }%>