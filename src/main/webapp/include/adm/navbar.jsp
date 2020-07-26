<%-- 
    Document   : navbar
    Created on : 12/07/2020, 14:31:26
    Author     : John William Vicente <johnwill.v.2017@gmail.com>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:import url="/include/adm/cabecalho.jsp" />
<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <a class="navbar-brand" href="<c:url value="/adm/" />">DEVCAR</a>
        <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
        <!-- Navbar Search-->
        <div class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">

        </div>
        <!-- Navbar-->
        <a target="_blank" href="<c:url value="/public/"  />" title="Visualizar página do cliente"><i class="fas fa-home"></i> Página inicial</a>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="<c:url value="/public/login/logout/" />" title="Sair do dashboard"><i class="fas fa-sign-out-alt"></i> Sair</a>
    </nav>

    <div id="layoutSidenav">
        <c:import url="/include/adm/barralateral.jsp" />