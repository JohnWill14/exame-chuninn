<%-- 
    Document   : welcome
    Created on : 11/07/2020, 21:19:28
    Author     : John William Vicente <johnwill.v.2017@gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mytag" tagdir="/WEB-INF/tags/" %>
<c:import url="/include/navbar.jsp"/>

<!-- Main -->
<main class="container-fluid">

    <div class="row">

        <!--Mostra uma lista de categorias-->
        <div id="categoria" class="col-md-3 col-sm-12" >
            <mytag:categorias categorias="${categorias}" />

        </div>

        <div id="painel" class="col-md-9 col-sm-12">

            <section id="marcas" class=" painel ">
                <div class="row">
                    <h2 class="" >Marcas associadas</h2>
                    <div class="imagem-marca slider" style="margin-top: 6px;" >
                        <c:forEach items="${listaMarcas}" var="marca"  varStatus="count">
                            <div>
                                <img class="border-0 slick-fabricante" alt="${marca.nome}" 
                                     title="${marca.nome}"  src="<c:url  value="/imagens/fabricantes/${marca.logo}"/>" />                                       
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>

            <section id="novidades" class="painel">
                <h2 class="titulo-painel" >Novidades</h2>

                <div class="row">

                    <c:forEach items="${carros}" var="carro" >
                        <div class="col-md-4 col-sm-12 ">
                            <mytag:produto carro="${carro}" />
                        </div>
                    </c:forEach>

                </div>

            </section>
        </div>

    </div>


</main>


<c:import url="/include/rodape.jsp"/>