<%-- 
    Document   : barralateral
    Created on : 12/07/2020, 14:35:46
    Author     : John William Vicente <johnwill.v.2017@gmail.com>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        
        <div class="sb-sidenav-menu">
            
            <div class="nav">
                
                <a class="nav-link" href="<c:url value="/adm/" />">
                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                    HOME
                </a>
                <div class="sb-sidenav-menu-heading">Configurações</div>


                <a class="nav-link " href="<c:url value="/adm/categoria/" />" >
                    <div class="sb-nav-link-icon"><i class="fas fa-tasks"></i></div>
                    Categoria
                </a>
                <a class="nav-link " href="<c:url value="/adm/modelo/" />" >
                    <div class="sb-nav-link-icon"><i class="fab fa-buromobelexperte"></i></div>
                    Modelos
                </a>
                <a class="nav-link " href="<c:url value="/adm/fabricante/" />" >
                    <div class="sb-nav-link-icon"><i class="fas fa-industry"></i></div>
                    Fabricantes
                </a>
                <a class="nav-link " href="<c:url value="/adm/automovel/" />">
                    <div class="sb-nav-link-icon"><i class="fas fa-car"></i></div>
                    Veículos
                </a>
                <div class="sb-sidenav-menu-heading">Usuários</div>
                <a class="nav-link " href="<c:url value="/adm/administrador/" />" >
                    <div class="sb-nav-link-icon"><i class="fas fa-users"></i></div>
                    Administradores
                </a>

                <!--<div class="sb-sidenav-menu-heading">Perfil</div>-->

                <a class="nav-link " href="<c:url value="/adm/perfil/"/>" >
                    <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                    Perfil do usuário
                </a>

            </div>
        </div>
        <div class="sb-sidenav-footer" >
            <div class="small">Logado como:</div>
            <div style="text-transform: capitalize;">
                ${usuario.nomeCompleto}
            </div>
        </div>
    </nav>
</div>