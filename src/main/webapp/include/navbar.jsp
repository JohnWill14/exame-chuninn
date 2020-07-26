<%-- 
    Document   : navbar
    Created on : 12/07/2020, 06:20:13
    Author     : John William Vicente <johnwill.v.2017@gmail.com>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:import url="/include/cabecalho.jsp" />
<body>
    <header>
        <!--Navbar, barra de menus da página-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
            <div class="" style="margin-right: 5%;">

                <a class="navbar-brand" href="<c:url value="/public/index/" />" style="font-size: 24px;"><span style="color:orange;">DEV</span><span style="color:#fff;">CAR</span></a>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" style="float: right;">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>

            <div class="collapse navbar-collapse  " id="navbarSupportedContent" >



                <ul class="navbar-nav  mr-auto" >
                    
                    <!--O link que corresponder a página ficará 'ativado'-->
                    
                    <li class="nav-item ${title.name().equals("INDEX") ? "active":""}">
                        <a class="nav-link " href="<c:url value="/public/index/" />">Home</a>
                    </li>
                    <li class="nav-item ${title.name().equals("PRODUTOS") ? "active":""}">
                        <a class="nav-link" href="<c:url value="/public/produtosAll" />">Produtos</a>
                    </li>
                    <li class="nav-item ${title.name().equals("SOBRE") ? "active":""}">
                        <a class="nav-link" href="<c:url value="/public/sobre/" />" >Quem somos</a>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link  " title="Area restrita" href="<c:url value="/adm/" />" >Área restrita
                        </a>
                    </li>
                </ul>


                <form action="" method="GET" class="form-inline   input-group-sm w-25">
                    
                    <!--Pesquisa no sistema, só funciona se clicar no botão :D-->
                    
                    <input class="form-control mr-sm-1 " id="pesquisa"  type="search" placeholder="Digite o nome de um carro"  aria-label="Search">
                    <a id="botao" href="<c:url value="/public/pesquisa/" />" class="btn btn-outline-success my-2 my-sm-0" onclick="pegarUrldpInput()" ><i class="fas fa-search"></i></a>
                </form>
                <script>
                    
                    var input = document.getElementById("pesquisa");
                    
//                    Pega o input search e faz com que o link tenha a url de busca
                    function pegarUrldpInput() {
                        var input = document.getElementById("pesquisa");
                        var botao = document.getElementById("botao");

                        botao.href ="<c:url value="/public/pesquisa/" />"+input.value;
                    }
                    
                </script>

            </div>
        </nav>
    </header>