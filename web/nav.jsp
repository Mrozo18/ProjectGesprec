<%  if (session.getAttribute("ROL") != null) { %>
<aside class="app-sidebar ">
    <div class="sidebar-img">
        <a class="navbar-brand" ><img alt="..." class="navbar-brand-img main-logo" src="assets/img/gesprec-large1.png"></a>
        <ul class="side-menu">
            <li class="slide">
                <a class="side-menu__item active" data-toggle="slide" href="#"><i class="side-menu__icon fe fe-home"></i><span class="side-menu__label">Inicio</span><i class="angle fa fa-angle-right"></i></a>
                <ul class="slide-menu">
                    <li>
                        <a class="slide-item" href="Dashboard.jsp">Inicio</a>
                    </li>
                </ul>
            </li>

            <li class="slide">
                 
                <a class="side-menu__item" data-toggle="slide" href="#"><i class="side-menu__icon fe fe-edit"></i><span class="side-menu__label">Contrataciones</span><i class="angle fa fa-angle-right"></i></a>
               
                <ul class="slide-menu">
                    <li>
                        
                        <a href="consultarContrato.jsp" class="slide-item">Contratos</a>
                
                    </li>
                    <li>
                        <% if (session.getAttribute("ROL").equals("1")) { %>  
                        <a href="registrarContrato.jsp" class="slide-item">Registrar Contrato</a>
                        <%} %>
                    </li>

                </ul>
            </li>
            <li class="slide">
                                        <% if (session.getAttribute("ROL").equals("1")) { %>  
                <a class="side-menu__item" data-toggle="slide" href="#"><i class="side-menu__icon fe fe-map"></i><span class="side-menu__label">Abogados</span><i class="angle fa fa-angle-right"></i></a>
                    <%} %>
                <ul class="slide-menu">
                    <li>
                         <% if (session.getAttribute("ROL").equals("1")) { %> 
                        <a href="ConsultarPersonas.jsp" class="slide-item"> Consultar Abogado</a>
                         <%} %>
                    </li>
                    <li>
                        <% if (session.getAttribute("ROL").equals("1")) { %>                        
                        <a href="RegistrarPersonas.jsp" class="slide-item">Registrar Abogado</a>
                        <%} %>
                    </li>
                </ul>
            </li>
            <li class="slide">
                <a class="side-menu__item" data-toggle="slide" href="#"><i class="side-menu__icon fe fe-file-text"></i><span class="side-menu__label">Seguimiento</span><i class="angle fa fa-angle-right"></i></a>
                <ul class="slide-menu">
                    <li>
                        <a href="seguimiento.jsp" class="slide-item">Consulta Seguimiento</a>
                    </li>
                    <!-- <li>
                        <a href="seguimientoContrato.jsp" class="slide-item">Segumiento Contrato</a>
                    </li> -->
                </ul>
            </li>
            <li class="slide">
                <a class="side-menu__item" data-toggle="slide" href="#"><i class="side-menu__icon fe fe-folder"></i><span class="side-menu__label">Modalidades</span><i class="angle fa fa-angle-right"></i></a>
                <ul class="slide-menu">
                    <li>
                        <a href="listaModalidades.jsp" class="slide-item">Consulta de Modalidades</a>
                    </li>
                </ul>
            </li>

        </ul>
    </div>
</aside>
<%} else {
        request.getRequestDispatcher("sesion.jsp").forward(request, response);
    }%>
