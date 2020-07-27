<%-- 
    Document   : index
    Created on : 12/07/2020, 13:17:41
    Author     : John William Vicente <johnwill.v.2017@gmail.com>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="mytag" tagdir="/WEB-INF/tags/" %>
<%@taglib  prefix = "form"  uri = "http://www.springframework.org/tags/form"  %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<c:import url="/include/adm/navbar.jsp" />
<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid">

            <h1 class="mt-4">Automóveis</h1>

            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item selected">Aqui você pode gerenciar os automóveis dos veículos</li>
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

                    <c:when  test="${show.nome == 'ALTERAR' and message!=null and mostrarForm==null}" >
                        <!--Se nenhum automovel for encontrado-->
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

                        <!--Criar novos automóveis-->
                        <div class=" paigna-apresentacao">
                            <div class="row">
                                <div class="col-6" >
                                    <c:choose>
                                        <c:when test="${show.nome=='SAVE'}" >
                                            <h2>Adicione automóveis   </h2>
                                        </c:when>
                                        <c:otherwise>
                                            <h2>Alterar automóveis   </h2>
                                        </c:otherwise>
                                    </c:choose>

                                </div>
                                <div class="col-2"></div>

                                <div class="col-4" >
                                    <a  class="btn btn-success " href="<c:url value="/adm/automovel/"/>">
                                        Todos os automóveis
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
                                        <li class="lead">Selecione imagens preferencialmente pequenas e com nomes inteligentes;</li>
                                        <li class="lead">É obrigatório haver alguma imagem selecionada;</li>
                                        <li class="lead">As imagens só poderão ser do tipo png, jpg, jpeg e jfif, mas de preferência png;</li>
                                        <li class="lead">Uma foto de capa deverá ser selecionada.</li>

                                    </ul>
                                </div>
                            </div>

                            <div class="row">

                                <form class="form  col-12" method="POST" action="<c:url value='/adm/automovel/save/' />" enctype="multipart/form-data">
                                    <c:if test="${objeto.id!=null}" >
                                        <input type="hidden" value="${objeto.id}" name="id" id="id"/>
                                    </c:if>

                                    <input type="hidden" value="null" name="postagem" id="postagem"/>
                                    <input type="hidden" value="${objeto.imagens}" name="imagens" id="imagens"/>
                                    <div class="row">

                                        <!--input do nome-->
                                        <div class="form-group col-md-6">
                                            <label for="nome" class="">Nome</label>
                                            <input  type="text" class="form-control"  value="${objeto.nome}" id="nome" name="nome" placeholder="Insira o nome do automóvel" />
                                        </div>

                                        <!--ano do veículo-->
                                        <div class="form-group col-md-3">
                                            <label for="ano" class="">Ano</label>
                                            <input  type="number" class="form-control"  value="${objeto==null?2020:objeto.ano}" id="ano" name="ano"  />
                                        </div>

                                        <!--kilometragem do veículo-->
                                        <div class="form-group col-md-3">
                                            <label for="kilometragem" class="">Kilometragem</label>
                                            <input  type="number" class="form-control" value="${objeto==null?0:objeto.kilometragem}" id="kilometragem" name="kilometragem" />
                                        </div>

                                    </div>

                                    <div class="row">

                                        <!--input do fabricante-->
                                        <div class="form-group col-md-6">
                                            <label for="fabricante" class="">Fabricante</label>
                                            <select class="form-control"    id="fabricante" name="fabricante">
                                                <option value="0" disabled>Selecione algum fabricante</option>
                                                <c:forEach var="f" items="${fabricantes}">
                                                    <option value="${f.id}"
                                                            ${objeto.fabricante.getId()==f.id? "selected":""}>
                                                        ${f.nome}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <!--input do modelo-->
                                        <div class="form-group col-md-6">
                                            <label for="modelo" class="">Modelo</label>
                                            <select class="form-control" name="modelo"    id="modelo">
                                                <option value="0" disabled>Selecione algum modelo</option>
                                                <c:forEach var="f" items="${modelos}">
                                                    <option value="${f.id}"
                                                            ${objeto.modelo.getId()==f.id? "selected":""}>
                                                        ${f.nome}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <!--Preco veículo-->
                                        <div class="form-group col-md-5">
                                            <label for="valor" class="">Preco</label>
                                            <input  type="text" value="${objeto.valor}" placeholder="Insira o valor do veículo" name="valor" class="form-control"    id="valor" required/>

                                        </div>

                                        <!--Tipo do veículo-->
                                        <div class="form-group col-md-7">
                                            <label for="tipo" class="">Categoria</label>
                                            <select class="form-control" name="tipo"    id="tipo">
                                                <option value="0" disabled>Selecione alguma categoria</option>
                                                <c:forEach var="f" items="${categorias}">
                                                    <option value="${f.id}"
                                                            ${objeto.tipo.getId()==f.id? "selected":""}>
                                                        ${f.nome}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <!--Descricao do veículo-->
                                        <div class="form-group col-md-12">
                                            <label for="descricao">Descrição</label>
                                            <textarea class="form-control" cols="80" id="descricao" name="descricao" rows="10" data-sample-short>
                                                <c:if test="${objeto.descricao==null}">
                                                    Digite&nbsp;a&nbsp;descrição&nbsp;do carro&nbsp;aqui.
                                                </c:if>
                                                <c:if test="${objeto.descricao!=null}">
                                                    ${objeto.descricao}
                                                </c:if>
                                            </textarea>
                                            <script>
                                                CKEDITOR.replace('descricao', {
                                                    height: 110,
                                                    width: '100%',
                                                });
                                            </script>
                                        </div>
                                    </div>

                                    <div class="form-group mx-sm-3 mb-2">

                                        <label for="logo" class="">Imagens</label>
                                        <div id="imagens2" class=" mydropzone imagedropzone">
                                            <c:forEach items="${objeto.imagens.split(',')}" var="img" >
                                                <img
                                                    title="${img}"
                                                    src="<c:url value="/" />${img}" />

                                            </c:forEach>  

                                        </div>
                                        <div class="">
                                            <!--files-->
                                            <input class="filestyle" data-btnClass="btn-success" 
                                                   data-text="<i class='far fa-image'></i>&nbsp;Selecione algumas imagens"
                                                   name="file" type="file" onchange="readURL()" 
                                                   accept="image/*" multiple />
                                        </div>

                                    </div>
                            </div>

                            <!--Tumblr-->
                            <div class="row">
                                <div class="form-group col-12">
                                    <label for="indexTumblr">Selecione uma imagem de capa</label>
                                    <select class="form-control" name="tumblr" id="tumblr" required >

                                        <c:forEach items="${listaImagem}" var="img" varStatus="cont" >
                                            <option value="${cont.index}" ${cont.index eq objeto.indexTumblr?'selected':''} > ${img}</option>
                                        </c:forEach>
                                    </select>
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




                            <script>
//                                Carrega as imagens no quadro branco da página
                                function readURL() {
                                    var imagensExistentes = document.getElementById('imagens2');
                                    while (imagensExistentes.firstChild) {
                                        imagensExistentes.removeChild(imagensExistentes.firstChild);
                                    }

                                    var files = document.querySelector('input[name=file]').files;

                                    for (var i = 0, f; f = files[i]; i++) {

                                        if (!f.type.match('image.*')) {
                                            continue;
                                        } //verifica se os arquivos são imagens

                                        var reader = new FileReader();

                                        reader.onload = (function (filei) {
                                            return function (e) {

                                                var tag = document.createElement('img');
                                                tag.src = e.target.result;
                                                tag.title = escape(filei.name);
//                                                tag.innerHTML = ['<img src="', e.target.result,
//                                                    '" title="', escape(filei.name), '"/>'].join('');
//                                                console.log(tag);   
                                                imagensExistentes.appendChild(tag);
                                            };
                                        })(f);
                                        reader.readAsDataURL(f);
                                    }
                                    criaOpcaoTumblr();
                                }

//                                Preenche o select com os nomes das imagens
                                function criaOpcaoTumblr() {
                                    var select = document.getElementById('tumblr');
                                    var files = document.querySelector('input[name=file]').files;

                                    while (select.firstChild) {
                                        select.removeChild(select.firstChild);
                                    }
                                    var cont = 0;
                                    for (var i = 0, f; f = files[i]; i++) {

                                        var tag = document.createElement('option');
                                        tag.value = i;
                                        tag.textContent = escape(f.name);
//                                        tag.innerHTML = ['<option value="', cont, '    ">'cont, escape(f.name), '</option>'].join('');
                                        select.appendChild(tag);
                                        console.log(tag);

                                    }



                                }
                            </script>

                        </div>
                    </c:when>
                    <c:when  test="${show.nome == 'MOSTRAR_DADOS'}" >

                        <!--Criar novos automóveis-->
                        <div class=" paigna-apresentacao">
                            <div class="row">
                                <div class="col-6" >
                                    <h2>Todos os automóveis    </h2>
                                </div>
                                <div class="col-2"></div>
                                <div class="col-4" >
                                    <a  class="btn btn-success " href="<c:url value="/adm/automovel/add/"/>">
                                        Adicionar automóvel
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
                                                        <th>Nome</th>
                                                        <th>Categoria</th>
                                                        <th>Preco</th>
                                                        <th>Modelo</th>
                                                        <th>Fabricante</th>
                                                        <th>Ano</th>
                                                        <th>Postagem</th>
                                                        <th></th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>Nome</th>
                                                        <th>Categoria</th>
                                                        <th>Preco</th>
                                                        <th>Modelo</th>
                                                        <th>Fabricante</th>
                                                        <th>Ano</th>
                                                        <th>Postagem</th>
                                                        <th></th>
                                                        <th></th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <c:forEach items="${lista}" var="obj" >
                                                        <tr>
                                                            <td>${obj.nome}</td>
                                                            <td>${obj.tipo.getNome()}</td>
                                                            <td>R$ ${obj.valor}</td>
                                                            <td>${obj.modelo.nome}</td>
                                                            <td>${obj.modelo.fabricante.nome}</td>
                                                            <td>${obj.ano}</td>
                                                            <td>
                                                                <javatime:format value="${obj.postagem}" pattern="dd/MM/yyyy" />
                                                            </td>

                                                            <td>
                                                                <a href="<c:url value="/adm/automovel/update/${obj.id}"/>" class="btn btn-warning btn-block"><i class="fas fa-marker"></i></a>
                                                            </td>
                                                            <td >
                                                                <a  onclick="return confirm('Você quer realmente excluir ${obj.nome}')" href="<c:url value="/adm/automovel/remove/${obj.id}"/>" class="btn btn-danger btn-block"><i class="far fa-trash-alt"></i></a>
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


                    </c:choose>

                </div>

            </main>

            <c:import url="/include/adm/rodape.jsp" />