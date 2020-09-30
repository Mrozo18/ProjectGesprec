<%  if (session.getAttribute("ROL") != null) { %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "ModeloDAO.ModalidadDAO"%>
<%@page import = "java.util.ArrayList"%>
<%@page import = "ModeloVO.Modalidad"%>
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
        <title>Modificar Modalidad</title>
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
                                <div class="container-fluid pt-8"></div>
                                <div class="col-md-8 col-lg-0">
                                    <div class="card border-info shadow">
                                        <div class="card-body">
                                            <h3 class="card-title text-center text-muted">Actualizar Modalidades</h3>
                                        <%
                                            ArrayList<Modalidad> lista = new ModalidadDAO().getBy("Id_Modalidad = " + request.getParameter("idModalidad"));
                                        %>
                                        <section>
                                            <form action="ModalidadServlet" method="GET">
                                                <input hidden name="action" value="modificar">
                                                <label for="IdMod">Id Modalidad:</label>

                                                <input readonly name="IdMod" class=" form-control text-dark" value="<%= lista.get(0).getIdModalidad()%>">
                                                <br><label for="NombreMod">Nombre Modalidad:</label>

                                                <input name="NombreMod" class=" form-control text-dark" value="<%= lista.get(0).getNombre_Modalidad()%>">
                                                <br>
                                                <input type="submit" class="btn btn-outline-success far fa-thumbs-up" >
                                            </form>           
                                        </section>
                                    </div>
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

</script>
</body>
</html>

<%} else {
        request.getRequestDispatcher("sesion.jsp").forward(request, response);
    }%>