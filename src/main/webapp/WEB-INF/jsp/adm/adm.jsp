<%-- 
    Document   : adm
    Created on : 16/07/2020, 14:45:28
    Author     : John William Vicente <johnwill.v.2017@gmail.com>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="mytag" tagdir="/WEB-INF/tags/" %>

<c:import url="/include/adm/navbar.jsp" />

<div id="layoutSidenav_content">
    <main>

        <div class="container-fluid">
            <!--Titulo que aparece para o usuário-->
            <h1 class="mt-4">Administradores</h1>

            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item selected">Aqui você pode gerenciar a inserção de administradores do sistema</li>
            </ol>

            <div class="row">
                <div class="col-12">
                    <!--Casa haja aulgum erro-->
                    <c:if test="${message!=null}">
                        <mytag:mensagem tipo="${message.tipoDeMensagem}" message="${message.mensagem}" />
                    </c:if>
                </div>
            </div>

            <main class="pagina">
                <!--Adicionar administradores-->
                <div class=" paigna-apresentacao">
                    <div class="row">

                        <div class="col-6" >
                            <h2>Usuários do sistema </h2>
                        </div>

                        <div class="col-2"></div>

                        <div class="col-4" >
                            <!--Aparece um model quando clicado-->
                            <button  class="btn btn-success " data-toggle="modal" data-target="#exampleModal">
                                Adicionar adimistradores
                            </button>

                        </div>
                    </div>

                    <hr/>
                    <div class="row">

                        <div class="row">

                            <div class=" col-12">

                                <div class="" style=" width: 140%;">
                                    <div class="col-12">
                                        <!--Tabela com dados dos usuários-->
                                        <table class="table table-bordered col-12" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Nome</th>
                                                    <th>Email</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th>Nome</th>
                                                    <th>Email</th>
                                                    <th></th>
                                                </tr>
                                            </tfoot>
                                            <tbody>
                                                
                                                <c:forEach items="${lista}" var="obj" >
                                                    <tr>
                                                        <td>${obj.nomeCompleto}</td>
                                                        <td>${obj.email}</td>
                                                        <td>
                                                            <a  href="<c:url value="/adm/perfil/"/>" class="btn btn-info btn-block <c:out value="${obj.id!=usuario.id?'disabled':''}" />">
                                                                <i class="fas fa-user"></i>
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
                    </div>
                </div>
            </main>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Cadastrar novo usuário</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row"  >
                            <div class="col-12">
                                
                                <div class="alert alert-success" role="alert">
                                    A senha será o nome completo do usuário, sem espaço e sem letras maiusculas, por isso 
                                    é aconselhado sua troca imediatamente.
                                </div>
                                
                            </div>
                        </div>
                        <form action="<c:url value="/adm/save/" />" method="POST">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Insira um email válido">
                            </div>
                            <div class="form-group">
                                <label for="nome">Nome completo</label>
                                <input type="text" class="form-control" name="nomeCompleto" id="nome" placeholder="Insira um nome">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                <button  type="submit"  class="btn btn-success">Criar novo Administrador</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <c:import url="/include/adm/rodape.jsp" />
