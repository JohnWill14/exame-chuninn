<%-- 
    Document   : index
    Created on : 12/07/2020, 13:17:41
    Author     : John William Vicente <johnwill.v.2017@gmail.com>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="mytag" tagdir="/WEB-INF/tags/" %>
<c:import url="/include/adm/navbar.jsp" />
<div id="layoutSidenav_content">
    <main>

        <div class="container-fluid">

            <h1 class="mt-4">Tipos de Veículo</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item active">Aqui você pode gerenciar as categorias dos veículos</li>
            </ol>

            <c:if test="${message!=null}">
                <!--caso haja algum erro-->
                <div class="row">
                    <div class="col-12">
                        <mytag:mensagem tipo="${message.tipoDeMensagem}" message="${message.mensagem}" />
                    </div>
                </div>
            </c:if>

            <main class="pagina">


                <c:choose >



                    <c:when  test="${show.nome == 'SAVE'}" >
                        <!--Criar novas categorias-->
                        <div class=" paigna-apresentacao">
                            <div class="row">
                                <div class="col-6" >
                                    <h2>Categoria de veículos   </h2>
                                </div>
                                <div class="col-2"></div>
                                <div class="col-4" >
                                    <a  class="btn btn-success " href="<c:url value="/adm/categoria/"/>">
                                        Todas as categorias
                                    </a>
                                </div>
                            </div>
                            <hr/>

                            <div class="jumbotron jumbotron-fluid">
                                <div class="container">
                                    <p class="display-4">Siga as normas:</p>
                                    <ul>
                                        <li class="lead">Nomes com mais de 2 letras;</li>
                                        <li class="lead">Não possuir dígitos.</li>
                                    </ul>
                                </div>
                            </div>

                            <div class="row">
                                <form class="form-inline" method="POST" action="<c:url value="/adm/categoria/save" />">
                                    <div class="form-group mx-sm-3 mb-2">
                                        <label for="nome" class="sr-only">Nome</label>
                                        <input type="text" class="form-control" id="nome" name="nome" placeholder="Insira o nome da categoria" required>
                                    </div>
                                    <div class="text-right">
                                        <button type="reset" class="btn btn-danger mb-2" title="Limpa todos os dados">Limpar </button>
                                        <button type="submit" class="btn btn-primary mb-2">Salvar </button>
                                    </div>
                                </form>
                            </div>



                        </c:when>
                        <c:when  test="${show.nome == 'MOSTRAR_DADOS'}" >
                            <!--Criar novas categorias-->
                            <div class=" paigna-apresentacao">
                                <div class="row">
                                    <div class="col-6" >
                                        <h2>Categoria de veículos   </h2>
                                    </div>
                                    <div class="col-2"></div>
                                    <div class="col-4" >
                                        <a  class="btn btn-success " href="<c:url value="/adm/categoria/add/"/>">
                                            Adicionar categoria
                                        </a>

                                    </div>
                                </div>

                                <hr/>
                                <div class="row">

                                    <div class=" col-12">

                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                    <thead>
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Nome</th>
                                                            <th></th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tfoot>
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Nome</th>
                                                            <th></th>
                                                            <th></th>
                                                        </tr>
                                                    </tfoot>
                                                    <tbody>
                                                        <!--Lista de categorias-->
                                                        <c:forEach items="${categorias}" var="cat" >
                                                            <tr>
                                                                <td>${cat.id}</td>
                                                                <td>${cat.nome}</td>
                                                                <td>
                                                                    <a href="<c:url value="/adm/categoria/update/${cat.id}"/>" class="btn btn-warning btn-block">
                                                                        <i class="fas fa-marker"></i>
                                                                    </a>
                                                                </td>
                                                                <td >
                                                                    <a  onclick="return confirm('Você quer realmente excluir ${cat.nome}')" href="<c:url value="/adm/categoria/remove/${cat.id}"/>" class="btn btn-danger btn-block">
                                                                        <i class="far fa-trash-alt"></i>
                                                                    </a>
                                                                </td>

                                                            </tr>
                                                        </c:forEach>

                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </c:when>

                            <c:when  test="${show.nome == 'ALTERAR'}" >

                                <!--Criar novas categorias-->
                                <div class=" paigna-apresentacao">
                                    <div class="row">
                                        <div class="col-6" >
                                            <h2>Alterar dados da categoria</h2>
                                        </div>
                                        <div class="col-2"></div>
                                        <div class="col-4" >
                                            <a  class="btn btn-success " href="<c:url value="/adm/categoria/"/>">Voltar à página de categoria</a>

                                        </div>
                                    </div>
                                    <hr/>
                                    <c:choose>

                                        <c:when test="${not empty message}">
                                            <div class="jumbotron jumbotron-fluid">
                                                <div class="container">
                                                    <p class="display-2">Erro :(</p>
                                                    <ul>
                                                        <li class="lead">Não encontramos nenhum registro no sistema.</li>

                                                    </ul>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="jumbotron jumbotron-fluid">
                                                <div class="container">
                                                    <p class="display-4">Siga as normas:</p>
                                                    <ul>
                                                        <li class="lead">Nomes com mais de 2 letras;</li>
                                                        <li class="lead">Não possuir dígitos.</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <form class="form-inline" method="POST" action="<c:url value="/adm/categoria/save" />">
                                                    <input type="hidden" name="id" value="${tipoVeiculo.id}" />
                                                    <div class="form-group mx-sm-3 mb-2">
                                                        <label for="nome" class="sr-only">Nome</label>
                                                        <input type="text" class="form-control" id="nome" name="nome" value="${tipoVeiculo.nome}">
                                                    </div>
                                                    <div class="text-right">
                                                        <button type="reset" class="btn btn-danger mb-2" title="Limpa todos os dados">Limpar </button>
                                                        <button type="submit" class="btn btn-warning mb-2">Update </button>
                                                    </div>
                                                </form>
                                            </div>




                                        </c:otherwise>
                                    </c:choose>


                                </c:when>
                            </c:choose>
                        </div>
                    </div>
            </main>

            <c:import url="/include/adm/rodape.jsp" />