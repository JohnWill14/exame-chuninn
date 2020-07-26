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

        <!--Produtos procurados-->
        <div id="painel" class="col-md-9 col-sm-12" >
            <section id="novidades" class="painel">
                <!--Seleciona um h2 próprio se o cliente chegou até aqui por uma busca ou por uma categoria-->
                <c:if test="${categoriaSelecionada!=null}">
                    <h2 class="titulo-painel" >${categoriaSelecionada.nome}</h2>
                </c:if>
                <c:if test="${categoriaSelecionada==null}">
                    <h2 class="titulo-painel" >Pesquisa por '${pesquisa}'</h2>
                </c:if>
                    
                <div class="row">
                    <!--Se tiver encontrado algum produto-->
                    <c:if test="${produtos.size()!=0}">
                        <c:forEach items="${produtos}" var="carro" varStatus="count" >
                            <div class="col-md-4 col-sm-12 ">
                                <mytag:produto carro="${carro}" />
                            </div>
                        </c:forEach>
                    </c:if>
                    
                    <!--Se não tiver encontrado nenhum carro-->
                    <c:if test="${produtos.size()==0}">
                        <div class="jumbotron jumbotron-fluid ">
                            <div class="container">
                                <p class="display-4">Nenhum carro encontrado :(</p>

                            </div>
                        </div>
                    </c:if>
                </div>

            </section>


        </div>

    </div>


</main>


<c:import url="/include/rodape.jsp"/>