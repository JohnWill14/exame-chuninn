<%-- 
    Document   : produtos
    Created on : 12/07/2020, 06:36:23
    Author     : John William Vicente <johnwill.v.2017@gmail.com>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="mytag" tagdir="/WEB-INF/tags/" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:import url="/include/navbar.jsp"/>


<!-- Main -->
<main class="container-fluid">

    <div class="row">

        <!--Lista de categorias-->
        <div id="categoria" class="col-md-3 col-sm-12" >
            <mytag:categorias categorias="${categorias}" />

        </div>

        <!--Painel central de produtos-->
        <div id="painel" class="col-md-9 col-sm-12" >

            <!--produto selecionado-->
            <section id="produto-amostra">

                <!--Caso tenha sido encontrado com sucesso-->
                <c:if test="${message==null}" >
                    <%--<mytag:produto carro="${produto}" />--%>
                    <div class="row">
                        <div class="col-12">
                            <h2>
                                ${produto.nome}
                            </h2>
                            <hr/>
                            <br/>
                        </div>
                    </div>

                    <div class="row  produto-em-destaque">

                        <div class="col-md-6 col-sm-12">

                            <!--Carrosel com produto no centro-->
                            <div class="row  slider-for">
                                <c:forEach items="${produto.imagens.split(',')}" var="img" >
                                    <div>
                                        <img src="<c:url value='/' />${img}" 
                                             class="img-produto-amostra" alt="${img}" title="${img}" 
                                             />
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="row">
                                <div id="imgs-produto" class="slider slider-nav">
                                    <c:forEach items="${produto.imagens.split(',')}" var="img" >
                                        <div>
                                            <img src="<c:url value='/' />${img}" 
                                                 class="card-img-top" alt="${img}" title="${img}" 
                                                 />
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>

                        </div>
                        <div class="col-md-6 col-sm-12">
                            <!--Ficha técnica do produto-->
                            <table class="table" style=" " >

                                <thead>
                                    <tr>
                                        <th colspan="2" scope="col">Ficha </th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <!--Dados do produto-->
                                    <tr>
                                        <td>Valor:&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                        <td>
                                            <h3>
                                                <fmt:setLocale value="pt_BR" />
                                                R$   <fmt:formatNumber value="${produto.valor}" minFractionDigits="2"  />
                                            </h3>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Categoria: </td>
                                        <td class="capitalize">${produto.tipo.nome}</td>
                                    </tr>
                                    <tr>
                                        <td>Modelo:</td>
                                        <td class="capitalize">${produto.modelo.nome.toLowerCase()}</td>
                                    </tr>
                                    <tr>
                                        <td>Ano do modelo:</td>
                                        <td class="capitalize">${produto.ano}</td>
                                    </tr>
                                    <tr>
                                        <td>Kilometragem:</td>
                                        <td class="capitalize">${produto.kilometragem} Km</td>
                                    </tr>
                                    <tr>
                                        <td>Fabricante:</td>
                                        <td>
                                            <img class="border-0" width="60%" height="70%" alt="${produto.modelo.fabricante.nome}" 
                                                 title="${produto.modelo.fabricante.nome}"  
                                                 src="<c:url  value="/imagens/fabricantes/${produto.modelo.fabricante.logo}"/>" />
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="row" style="margin-top: 10%;">
                        <div class="col-12">
                            <!--Coloquei a descrição fora da ficha com um intuito estético-->
                            <h2>
                                Descrição do veículo
                            </h2>
                            <hr/>
                            <br/>
                            <div class="row paragrafo">
                                ${produto.descricao}
                            </div>
                        </div>
                    </div>

                    <!--Adicionei produtos da mesma categoria caso exista-->
                    <c:if test="${produtosSemelhantes.size()>0}">
                        <div class="row" style="margin-top: 10%;">
                            <div class="col-12">
                                <h2>
                                    Produtos semelhantes
                                </h2>
                                <hr/>
                                <br/>
                                <div class="row ">
                                    <c:forEach items="${produtosSemelhantes}" var="carro">
                                        <div class="col-md-4 col-sm-12 ">
                                            <mytag:produto carro="${carro}"/>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:if>

                <!--Caso o sistema não tenha encontrado no sistema-->
                <c:if test="${message!=null}" >
                    <div class="jumbotron jumbotron-fluid ">
                        <div class="container">
                            <p class="display-4">

                                <c:out value="${message.mensagem}" /> :(
                            </p>

                        </div>
                    </div>
                </c:if>
            </section>
        </div>

    </div>


</main>


<c:import url="/include/rodape.jsp"/>
