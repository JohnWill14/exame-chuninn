<%-- 
    Document   : produtos
    Created on : 12/07/2020, 06:36:23
    Author     : John William Vicente <johnwill.v.2017@gmail.com>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="mytag" tagdir="/WEB-INF/tags/" %>

<c:import url="/include/navbar.jsp"/>


<!-- Main -->
<main class="container-fluid">

    <div class="row">

        <!--Lista de categorias-->
        <div id="categoria" class="col-md-3 col-sm-12" >
            <mytag:categorias categorias="${categorias}" />
        </div>

        <div id="painel" class="col-md-9 col-sm-12" >

            <!--Amostras de veículos agrupados pela categoria-->
            <c:forEach items="${produtosAgrupados.keySet()}" var="key" >
                <section id="novidades" class="painel">
                    <h2 class="titulo-painel" >${key.nome}</h2>
                    
                    <div class="row">
                        <c:forEach items="${produtosAgrupados.get(key)}" var="carro" varStatus="count" >
                            <div class="col-md-4 col-sm-12 ">
                                <mytag:produto carro="${carro}" />
                            </div>
                        </c:forEach>
                    </div>
                    
                    <div class="">
                        <div class="text-right">
                            <a class="btn btn-success " href="
                               <c:url value="/public/produtosCategoria/${key.id}" />">
                                Ver mais carros do tipo ${key.nome.toLowerCase()}
                            </a>
                        </div>
                    </div>
                            
                </section>

            </c:forEach>

        </div>

    </div>


</main>


<c:import url="/include/rodape.jsp"/>