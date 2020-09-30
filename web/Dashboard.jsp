<%  if (session.getAttribute("ROL") != null) { %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
          <%  response.setHeader("Programa", "No-cache");
     response.setHeader("Cache-Control", "no-cache, no-store,must-revalidate");
     response.setDateHeader("Expires", 0); %>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1, shrink-to-fit=no" name="viewport">
        <meta content="Start your development with a Dashboard for Bootstrap 4." name="description">
        <meta content="Spruko" name="author">

        <!-- Title -->
        <title>Dashboard - GESPREC</title>

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
                            <div class="container-fluid pt-8">
                                <div class="row">
                                    <div class="col-xl-3">
                                        <div class="card shadow overflow-hidden">
                                            <div class="card-body">
                                                <div class="widget text-center">
                                                    <div><i class="fas fa-users fa-5x text-yellow"></i></div>
                                                    <h4 class="text-muted mt-2 mb-0">Usuarios registrados</h4>
                                                    <br><h2 class="display-2 mb-0">5</h2>
                                                    <br>
                                                </div>
                                            </div>
                                            <span class="updating-chart" data-peity='{ "fill": ["#ffa21d"]}'>5,3,9,6,5,9,2,5,3,6,7,8,6</span>
                                        </div>
                                    </div>
                                    <div class="col-xl-3">
                                        <div class="">
                                            <div class="">
                                                <div class="row">
                                                    <div class="col-xl-12 col-lg-12 col-sm-12">
                                                        <div class="card shadow overflow-hidden">
                                                            <div class="card-body pb-0">
                                                                <div class="widget text-center">
                                                                    <small class="text-muted">Modalidades</small>
                                                                    <h2 class="text-xxl mb-0">+ 5</h2>
                                                                </div>
                                                            </div>
                                                            <span class="bar" data-peity='{ "fill": ["#00c3ed"]}'>5,4,5,2,8,4,5,6,5,2,4,4,8,4,6,2,3,4</span>
                                                        </div>
                                                        <div class="card shadow overflow-hidden">
                                                            <div class="card-body pb-0">
                                                                <div class="widget text-center">
                                                                    <small class="text-muted">Contratos</small>
                                                                    <h2 class="text-xxl mb-0">+ 10</h2>
                                                                </div>
                                                            </div>
                                                            <span class="bar" data-peity='{ "fill": ["#18b16f"]}'>5,4,5,2,8,4,5,6,5,2,4,4,8,4,6,2,3,4</span>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="">
                                            <div class="">
                                                <div class="row">
                                                    <div class="col-xl-6 col-lg-6 col-sm-6">
                                                        <div class="card shadow">
                                                            <div class="card-body">
                                                                <div class="widget text-center">
                                                                    <small class="">Valores de Contratos</small>
                                                                    <h2 class="text-xxl mb-1 text-success">$7'860.530</h2>
                                                                    <p class="mb-0"><span class=""><i class="fas fa-caret-up ml-1 text-success"></i> 4%</span>  Último trimeste</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="card shadow">
                                                            <div class="card-body">
                                                                <div class="widget text-center">
                                                                    <small class="">Contratos(2019)</small>
                                                                    <h2 class="text-xxl mb-1 text-yellow">- 430</h2>
                                                                    <p class="mb-0"><span class=""><i class="fas fa-caret-down text-danger ml-1"></i> 5%</span> Último año</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-6 col-lg-6 col-sm-6">
                                                        <div class="card shadow">
                                                            <div class="card-body">
                                                                <div class="widget text-center">
                                                                    <small class="">Contratos Activos(2020)</small>
                                                                    <h2 class="text-xxl text-primary mb-1">7</h2>
                                                                    <p class="mb-0"><span class=""><i class="fas fa-caret-up text-success ml-1"></i> 6%</span> Último mes</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="card shadow">
                                                            <div class="card-body">
                                                                <div class="widget text-center">
                                                                    <small class="">Contratos Futuras(2021)</small>
                                                                    <h2 class="text-xxl text-danger mb-1">- 200</h2>
                                                                    <p class="mb-0"><span class=""><i class="fas fa-caret-down text-danger ml-1"></i> 50%</span> Próximo año</p>
                                                                </div>
                                                            </div>
                                                        </div>
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
                <!-- app-content-->
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
