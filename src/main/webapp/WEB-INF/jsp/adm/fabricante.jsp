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
            <h1 class="mt-4">Fabricantes</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item active">Aqui você pode gerenciar os fabricantes dos veículos</li>
            </ol>

            <div  class="row">
                <div id="mensagem-cliente" class="col-12">
                    <c:if test="${message!=null}">
                        <!--caso haja algum msg-->

                        <mytag:mensagem tipo="${message.tipoDeMensagem}" message="${message.mensagem}" />

                    </c:if>
                </div>
            </div>

            <main class="pagina">


                <c:choose >



                    <c:when  test="${show.nome == 'ALTERAR' and message!=null and mostrarForm==null}" >
                        <!--Casa não haja registros selecionados-->

                        <div class="jumbotron jumbotron-fluid">
                            <div class="container">
                                <p class="display-2">Erro :(</p>
                                <ul>
                                    <li class="lead">Não encontramos nenhum registro no sistema.</li>

                                </ul>
                            </div>
                        </div>
                    </c:when>
                    <c:when  test="${show.nome == 'SAVE' or show.nome == 'ALTERAR' }" >

                        <!--Criar novos fabricantes-->
                        <div class=" paigna-apresentacao">
                            <div class="row">
                                <div class="col-6" >
                                    <c:choose>
                                        <c:when test="${show.nome=='SAVE'}" >
                                            <h2>Adicione fabricantes   </h2>
                                        </c:when>
                                        <c:otherwise>
                                            <h2>Alterar fabricantes   </h2>
                                        </c:otherwise>
                                    </c:choose>

                                </div>
                                <div class="col-2"></div>
                                <div class="col-4" >
                                    <a  class="btn btn-success " href="<c:url value="/adm/fabricante/"/>">
                                        Todos os fabricantes
                                    </a>
                                </div>
                            </div>
                            <hr/>
                            <div class="jumbotron jumbotron-fluid">
                                <div class="container">
                                    <p class="display-4">Siga as normas:</p>
                                    <ul>
                                        <li class="lead">Nomes com mais de 2 letras;</li>
                                        <li class="lead">Máximo de 20 letras;</li>
                                        <li class="lead">Selecione imagens preferencialmente pequenas;</li>
                                        <li class="lead">É obrigatório haver alguma imagem selecionada.</li>

                                    </ul>
                                </div>
                            </div>
                            <div class="row">

                                <form class="form  col-12" method="POST" action="<c:url value="/adm/fabricante/save" />" enctype="multipart/form-data">
                                    <c:if test="${objeto.id!=null}" >
                                        <input type="hidden" value="${objeto.id}" name="id"/>
                                    </c:if>

                                    <input name="logo" type="hidden" value="${objeto.logo}" />
                                    <div class="row">
                                        <div class="form-group col mx-sm-3 mb-2">
                                            <label for="nome" class="">Nome</label>
                                            <input type="text" class="form-control" id="nome" value="${objeto.nome}" name="nome" placeholder="Insira o nome do fabricante" required>
                                        </div>
                                        <div class="form-group col mx-sm-3 mb-2">
                                            <label for="site" class="">Site</label>
                                            <input type="text" class="form-control" id="site" value="${objeto.site}" name="site" placeholder="Insira o site do fabricante" required>
                                        </div>
                                    </div>
                                    <div class="form-group mx-sm-3 mb-2">

                                        <label for="logo" class="">Logo</label>
                                        <div id="imagensExitentes" class="mydropzone imagedropzone" style="width: 100%;height: 200px;">
                                            <c:if test="${objeto.logo!=null}" >
                                                <img  id="preview" src="<c:url value="/imagens/fabricantes/${objeto.logo}" />" 
                                                      style="border:none;"/>
                                            </c:if>



                                        </div>
                                        <div class="">
                                            <input class="filestyle" data-btnClass="btn-success" 
                                                   data-text="<i class='far fa-image'></i>&nbsp;Selecione uma imagem"
                                                   name="file" type="file" onchange="previewImg();" 
                                                   accept="image/*"/>
                                        </div>
                                    </div>
                            </div>

                            <div class="text-right">
                                <button type="reset" class="btn btn-danger mb-2" title="Limpa todos os dados">Limpar </button>
                                <c:choose>
                                    <c:when test="${show.nome=='SAVE'}" >
                                        <button type="submit" class="btn btn-primary mb-2">Salvar </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button type="submit" class="btn btn-warning mb-2">Update </button>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                            </form>




                            <script type="text/javascript">
//                                Cria uma preview da imagem selecionada no quadro branco
                                function previewImg() {
                                    var imagensExitentes = document.getElementById("imagensExitentes");
                                    while (imagensExitentes.firstChild) {
                                        imagensExitentes.removeChild(imagensExitentes.firstChild);
                                    }


                                    var imagem = document.querySelector('input[name=file]').files[0];
                                    var preview = document.createElement('img');
                                    var reader = new FileReader();
                                    reader.onloadend = function () {
                                        preview.src = reader.result;
                                        preview.id = "preview";
                                        imagensExitentes.appendChild(preview);
                                    }
                                    if (imagem) {
                                        reader.readAsDataURL(imagem);
                                    } else {
                                        preview = "";
                                    }
                                }
                            </script>


                        </c:when>
                        <c:when  test="${show.nome == 'MOSTRAR_DADOS'}" >

                            <!--Criar novos fabricantes-->
                            <div class=" paigna-apresentacao">
                                <div class="row">
                                    <div class="col-6" >
                                        <h2>Todos os fabricantes    </h2>
                                    </div>
                                    <div class="col-2"></div>
                                    <div class="col-4" >
                                        <a  class="btn btn-success " href="<c:url value="/adm/fabricante/add/"/>">Adicionar fabricante</a>

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
                                                            <th>Logo</th>
                                                            <th>Nome</th>
                                                            <th>Site</th>
                                                            <th></th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tfoot>
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Logo</th>
                                                            <th>Nome</th>
                                                            <th>Site</th>
                                                            <th></th>
                                                            <th></th>
                                                        </tr>
                                                    </tfoot>
                                                    <tbody>
                                                        <c:forEach items="${lista}" var="cat" >
                                                            
                                                            <tr id="id${cat.id==null?'':cat.id}" >
                                                                <td>${cat.id}</td>
                                                                <td><img style="width: 80px; height: 70px;" src="<c:url value="/imagens/fabricantes/${cat.logo}" />"></td>
                                                                <td>${cat.nome}</td>
                                                                <td class="">
                                                                    <div class="row">
                                                                        <div class="col-10"> 

                                                                            <a  target="_blank" href="http://${cat.site}">
                                                                                ${cat.site}

                                                                            </a>
                                                                        </div>

                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <a href="<c:url value="/adm/fabricante/update/${cat.id}"/>" class="btn btn-warning btn-block"><i class="fas fa-marker"></i></a>
                                                                </td>
                                                                <td >
                                                                    <button  onclick="confirm('Você quer realmente excluir ${cat.nome}') == true ? excluiRegistro(${cat.id}) : ''"  class="btn btn-danger btn-block">
                                                                        <i class="far fa-trash-alt"></i>
                                                                    </button>
                                                                </td>
                                                                
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>


                                </div>

                                <script>
                                    function excluiRegistro(id) {

                                        $.get("<c:url value="/adm/fabricante/remove/${cat.id}"/>" + id, function (resp) {
                                            var linha = document.getElementById("id" + id);
                                            var msg = document.getElementById("mensagem-cliente");

                                           while(msg.firstChild)msg.removeChild(msg.firstChild);

                                            var div = document.createElement("div");
                                            
                                            if (resp == "ok") {
                                                 linha.remove();
                                                div.className = "alert alert-success";
                                                div.innerText = "Sucesso ao deletar fabricante";
                                            }else{
                                                div.className = "alert alert-danger";
                                                div.innerText = "Erro ao deletar fabricante";
                                            }

                                            msg.appendChild(div);
                                        }
                                        );
                                    }
                                </script>
                            </c:when>


                        </c:choose>
                    </div>  
                </div>

            </main>

            <c:import url="/include/adm/rodape.jsp" />