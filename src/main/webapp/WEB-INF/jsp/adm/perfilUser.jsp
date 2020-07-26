<%-- 
    Document   : perfilUSer
    Created on : 25/07/2020, 09:56:09
    Author     : John William Vicente <johnwill.v.2017@gmail.com>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="mytag" tagdir="/WEB-INF/tags/" %>

<c:import url="/include/adm/navbar.jsp" />

<div id="layoutSidenav_content">
    <div class="container-fluid">
        <h1 class="mt-4">Perfil do usuário</h1>


        <form action="<c:url value='/adm/save/' />" method="POST">
            <input type="hidden" name='id' value="${usuario.id}" />
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" value="${usuario.email}" 
                       name="email" placeholder="Insira um email válido">
            </div>
            <div class="row">
                <div class="col form-group">
                    <label for="nome">Nome completo</label>
                    <input type="text" class="form-control" name="nomeCompleto" value="${usuario.nomeCompleto}" id="nome" placeholder="Insira um nome">
                </div>
                <div class="col ">
                    <label for="senha">Senha</label>
                    <button  type="button" class="btn btn-outline-primary btn-block"  data-toggle="modal" data-target="#exampleModal" >
                        Clique aqui
                    </button>
                </div>
            </div>
            <div class="modal-footer">
                <a href="<c:url value="/adm/excluir" />"  class="btn btn-danger" data-dismiss="modal"
                   onclick="return confirm('Você irá excluir sua conta do sistema. Está de acordo com isso ?');" >
                    Excluir conta
                </a>
                <button  type="submit"  class="btn btn-success" 
                         onclick="return confirm('Você irá atualizar os dados do seu perfil. Está de acordo com as mudanças ?');">
                    Alterar dados
                </button>
            </div>
        </form>

    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Alterar senha</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <form action="<c:url value="/adm/saveSenha/" />" method="POST">
                    <input type="hidden" name='id' value="${usuario.id}" />
                    <div class="form-group">
                        <label for="senhaAntiga">Senha antiga</label>
                        <input type="password" class="form-control" id="senhaAntiga" name="senhaAntiga" 
                               placeholder="Insira a senha que você quer alterar">
                    </div>
                    <div class="form-group">
                        <label for="novaSenha">Nova Senha</label>
                        <input type="password" class="form-control" name="novaSenha" id="novaSenha" 
                               placeholder="Insira uma nova senha" oninput="compararSenhas();">
                    </div>
                    <div class="form-group">
                        <label for="repeteSenha">Repita a  Senha</label>
                        <p id="senhas-identicas"></p>
                        <input type="password" class="form-control" name="repeteSenha" id="repeteSenha" 
                               placeholder="Repita a nova senha" oninput="compararSenhas();">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        <button disabled="" id="botaoSubmit"  type="submit"  class="btn btn-success">Modificar senha</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<script>
//    Compara senhas quando o usuário digitar files
    function compararSenhas() {
        var novaSenha = document.getElementById("novaSenha");
        var repete = document.getElementById("repeteSenha");
        var paragrafo = document.getElementById("senhas-identicas");
        var boatoSubmit = document.getElementById("botaoSubmit");

        if (repete.value == '')
            return;

        if (novaSenha.value == repete.value) {
            paragrafo.innerHTML = "Senhas idênticas :)";
            paragrafo.style = "color:green;"
            boatoSubmit.disabled = false;
        } else {
            paragrafo.innerHTML = "Senhas não conferem :(";
            paragrafo.style = "color:red;"
            boatoSubmit.disabled = true;
        }

    }
</script>

<c:import url="/include/adm/rodape.jsp" />