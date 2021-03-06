<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="ModeloVO.Usuario"%>
<%@page import="ModeloDAO.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" dir="ltr">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1, shrink-to-fit=no" name="viewport">
        <meta content="Start your development with a Dashboard for Bootstrap 4." name="description">
        <meta content="Spruko" name="author">

        <!-- Title -->
        <title>Usuarios</title>

        <!-- Favicon -->
        <link href="../assets/img/logo.png" rel="icon" type="image/png">

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,600,700,800" rel="stylesheet">

        <!-- Icons -->
        <link href="../assets/css/icons.css" rel="stylesheet">

        <!--Bootstrap.min css-->
        <link rel="stylesheet" href="../assets/plugins/bootstrap/css/bootstrap.min.css">

        <!-- Ansta CSS -->
        <link href="../assets/css/dashboard.css" rel="stylesheet" type="text/css">

        <!-- Tabs CSS -->
        <link href="../assets/plugins/tabs/style.css" rel="stylesheet" type="text/css">

        <!-- jvectormap CSS -->
        <link href="../assets/plugins/jvectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet" />

        <!-- Custom scroll bar css-->
        <link href="../assets/plugins/customscroll/jquery.mCustomScrollbar.css" rel="stylesheet" />

        <!-- Sidemenu Css -->
        <link href="../assets/plugins/toggle-sidebar/css/sidemenu.css" rel="stylesheet">

    </head>
    <body class="app sidebar-mini rtl" >
        <div id="global-loader" ></div>
        <div class="page">
            <div class="page-main">
                <!-- Sidebar menu-->
                <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
                <aside class="app-sidebar ">
                    <div class="sidebar-img">
                        <a class="navbar-brand" ><img alt="..." class="navbar-brand-img main-logo" src="../assets/img/gesprec-large1.png"></a>
                        <ul class="side-menu">
                            <li class="slide">
                                <a class="side-menu__item active" data-toggle="slide" href="#"><i class="side-menu__icon fe fe-home"></i><span class="side-menu__label">Inicio</span><i class="angle fa fa-angle-right"></i></a>
                                <ul class="slide-menu">
                                    <li>
                                        <a class="slide-item" href="../Dashboard.jsp">Inicio</a>
                                    </li>

                                </ul>
                            </li>

                            <li class="slide">
                                <a class="side-menu__item" data-toggle="slide" href="#"><i class="side-menu__icon fe fe-edit"></i><span class="side-menu__label">Contratos</span><i class="angle fa fa-angle-right"></i></a>
                                <ul class="slide-menu">
                                    <li>
                                        <a href="forms.html" class="slide-item">Consultar Contrato</a>
                                    </li>
                                    <li>
                                        <a href="form-select2.html" class="slide-item">Registrar Contrato</a>
                                    </li>

                                </ul>
                            </li>
                            <li class="slide">
                                <a class="side-menu__item" data-toggle="slide" href="#"><i class="side-menu__icon fe fe-map"></i><span class="side-menu__label">Abogados</span><i class="angle fa fa-angle-right"></i></a>
                                <ul class="slide-menu">
                                    <li>
                                        <a href="maps.html" class="slide-item"> Consultar Abogado</a>
                                    </li>
                                    <li>
                                        <a href="vector-map.html" class="slide-item">Registrar Abogado</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="slide">
                                <a class="side-menu__item" data-toggle="slide" href="#"><i class="side-menu__icon fe fe-file-text"></i><span class="side-menu__label">Seguimiento</span><i class="angle fa fa-angle-right"></i></a>
                                <ul class="slide-menu">
                                    <li>
                                        <a href="tables.html" class="slide-item">Consulta Seguimiento</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="slide">
                                <a class="side-menu__item" data-toggle="slide" href="#"><i class="side-menu__icon fe fe-folder"></i><span class="side-menu__label">Modalidades</span><i class="angle fa fa-angle-right"></i></a>
                                <ul class="slide-menu">
                                    <li>
                                        <a href="user-profile.html" class="slide-item">Consulta de Modalidades</a>
                                    </li>
                                </ul>
                            </li>

                            <li class="slide">
                                <a class="side-menu__item" data-toggle="slide" href="#"><i class="side-menu__icon fe fe-user"></i><span class="side-menu__label">Usuarios</span><i class="angle fa fa-angle-right"></i></a>
                                <ul class="slide-menu">
                                    <li>
                                        <a href="#" class="slide-item">Consultar Usuarios</a>
                                    </li>
                                    <li>
                                        <a href="Controlador?accion=add" class="slide-item">Registrar Usuarios</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </aside>
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
                            <nav class="navbar navbar-top  navbar-expand-md navbar-dark" id="navbar-main">
                                <div class="container-fluid">
                                    <a aria-label="Hide Sidebar" class="app-sidebar__toggle" data-toggle="sidebar" href="#"></a>

                                    <!-- Brand -->
                                    <a class="navbar-brand pt-0 d-md-none" href="index-2.html">
                                        <img src="../assets/img/brand/logo-light.png" class="navbar-brand-img" alt="...">
                                    </a>
                                    <!-- User -->
                                    <ul class="navbar-nav align-items-center ">
                                        <li class="nav-item d-none d-md-flex">
                                            <div class="dropdown d-none d-md-flex mt-2 ">
                                                <a class="nav-link full-screen-link pl-0 pr-0"><i class="fe fe-maximize-2 floating " id="fullscreen-button"></i></a>
                                            </div>
                                        </li>
                                        <li class="nav-item dropdown">
                                            <a aria-expanded="false" aria-haspopup="true" class="nav-link pr-md-0" data-toggle="dropdown" href="#" role="button">
                                                <div class="media align-items-center">
                                                    <span class="avatar avatar-sm rounded-circle"><img alt="Image placeholder" src="../assets/img/faces/female/32.jpg"></span>
                                                    <div class="media-body ml-2 d-none d-lg-block">
                                                        <span class="mb-0 ">Cori Stover</span>
                                                    </div>
                                                </div></a>
                                            <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
                                                <div class=" dropdown-header noti-title">
                                                    <h6 class="text-overflow m-0">Bienvenido!</h6>
                                                </div>
                                                <div class="dropdown-divider"></div><a class="dropdown-item" href="../index.jsp"><i class="ni ni-user-run"></i> <span>Salir</span></a>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </nav>
                            <!-- Top navbar-->

                            <!-- Paginá de contenido -->
                            <div class="container-fluid pt-8">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card shadow">
                                            <div class="card-header">
                                                <h2 class="mb-0">Información de Usuarios</h2>
                                            </div>
                                            <div class="card-body">
                                                <a class="btn btn-outline-success" href="Controlador?accion=add"><span class="btn-inner--icon"><i class="far fa-user"></i></span>
                                                    <span class="btn-inner--text"></span></a>
                                                <br><br><div class="table-responsive">
                                                    <table border="1" id="example2" class="table table-striped table-bordered w-100 text-nowrap">
                                                        <thead>
                                                            <tr>
                                                                <th class="wd-15p">ID</th>
                                                                <th class="wd-15p">Nombre Usuario</th>
                                                                <th class="wd-20p">Contraseña</th>
                                                                <th class="wd-15p">Rol</th>
                                                                <th class="wd-10p">Acciones</th>
                                                            </tr>
                                                        </thead>
                                                        <%
                                                            UsuarioDAO dao = new UsuarioDAO();
                                                            List<Usuario> list = dao.listar();
                                                            Iterator<Usuario> iter = list.iterator();
                                                            Usuario usu = null;
                                                            while (iter.hasNext()) {
                                                                usu = iter.next();
                                                            }
                                                        %>
                                                        <tbody>
                                                            <tr>
                                                                <td><%= usu.getId()%></td>
                                                                <td><%= usu.getNombreUsu()%></td>
                                                                <td><%= usu.getContrasena()%></td>
                                                                <td><%= usu.getId_rol()%></td>
                                                                <td>
                                                                    <a class="btn btn-outline-info" href="Controlador?accion=editar&id=<%= usu.getId()%>">Editar</a>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
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
    <script src="../assets/plugins/jquery/dist/jquery.min.js"></script>
    <script src="../assets/js/popper.js"></script>
    <script src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>

    <!-- Echarts JS -->
    <script src="../assets/plugins/chart-echarts/echarts.js"></script>

    <!-- Fullside-menu Js-->
    <script src="../assets/plugins/toggle-sidebar/js/sidemenu.js"></script>

    <!-- Custom scroll bar Js-->
    <script src="../assets/plugins/customscroll/jquery.mCustomScrollbar.concat.min.js"></script>

    <!-- peitychart -->
    <script src="../assets/plugins/peitychart/jquery.peity.min.js"></script>
    <script src="../assets/plugins/peitychart/peitychart.init.js"></script>

    <!-- Vector Plugin -->
    <script src="../assets/plugins/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="../assets/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="../assets/plugins/jvectormap/gdp-data.js"></script>
    <script src="../assets/plugins/jvectormap/jquery-jvectormap-us-aea-en.js"></script>
    <script src="../assets/plugins/jvectormap/jquery-jvectormap-uk-mill-en.js"></script>
    <script src="../assets/plugins/jvectormap/jquery-jvectormap-au-mill.js"></script>
    <script src="../assets/plugins/jvectormap/jquery-jvectormap-ca-lcc.js"></script>
    <script src="../assets/js/dashboard2map.js"></script>

    <!-- Ansta JS -->
    <script src="../assets/js/custom.js"></script>
    <script src="../assets/js/dashboard-sales.js"></script>

</body>

</html>