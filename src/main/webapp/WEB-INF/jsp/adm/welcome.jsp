<%-- 
    Document   : welcome
    Created on : 26/07/2020, 09:34:04
    Author     : John William Vicente <johnwill.v.2017@gmail.com>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:import url="/include/adm/navbar.jsp" />

<!--Sem ideias novas fiz essa página :P-->

<div id="layoutSidenav_content">
    <main>
        
        <div class="container-fluid">
            <h1 class="mt-4">Dashboard</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item active">Dashboard</li>
            </ol>
            <div class="row">
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-secondary text-white mb-4">
                        <div class="card-body"><i class="fas fa-tasks"></i>&nbsp;&nbsp;Categorias</div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="<c:url value="/adm/categoria/" />">
                                Ir para categorias
                            </a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-secondary text-white mb-4">
                        <div class="card-body"><i class="fab fa-buromobelexperte"></i>&nbsp;&nbsp;Modelos</div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="<c:url value="/adm/modelo/" />">
                                Ir para os modelos de carros
                            </a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-secondary text-white mb-4">
                        <div class="card-body"><i class="fas fa-industry"></i>&nbsp;&nbsp;Fabricantes</div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="<c:url value="/adm/fabricante/" />">
                                Fabricantes de veículos
                            </a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-secondary text-white mb-4">
                        <div class="card-body"><i class="fas fa-car"></i>&nbsp;&nbsp;Veículos</div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="<c:url value="/adm/automovel/" />">
                               Veja todos os veículos
                            </a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
               
            </div>

            <c:import url="/include/adm/rodape.jsp" />