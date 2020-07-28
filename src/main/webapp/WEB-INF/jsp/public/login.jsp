
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib prefix="mytag" tagdir="/WEB-INF/tags/" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:import url="/include/cabecalho.jsp" />
<body class="bg-dark">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>

                <div class="container">
                    <div class="row justify-content-center">

                        <div class="col-lg-5">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">

                                <c:if test="${message!=null}">
                                    <!--Caso algum erro apareça, como usuário não encontrado-->
                                    <mytag:mensagem message="${message.mensagem}" tipo="ERROR"/>
                                </c:if>
                                <div class="alert alert-info">

                                    email: spring.devcar@outlook.com    senha: devcar123
                                </div>
                                <div class="card-header"><h3 class="text-center font-weight-light my-4">DEVCAR  </h3></div>

                                <div class="card-body">


                                    <form action="<c:url value="/public/login/logar/"/>" method="POST">

                                        <div class="form-group">
                                            <label class="small mb-1" for="inputEmailAddress">Email</label>
                                            <input name="email" class="form-control py-4" id="inputEmailAddress" type="email" placeholder="Entre com o email " />
                                        </div>

                                        <div class="form-group">
                                            <label class="small mb-1" for="inputPassword">Senha</label>

                                            <input name="senha" class="form-control py-4 mb-1" id="inputPassword" type="password" placeholder="Digite sua senha" />


                                        </div>

                                        <div class="form-group d-flex align-items-center justify-content-between ">
                                            <button type="submit" class="btn btn-primary btn-block" >Login</button>
                                        </div>

                                    </form>

                                </div>

                                <div class="card-footer text-center">
                                    <div class="small">e-mail para duvidas: johnwill.v.2017@gmail.com</div>
                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </main>
        </div>

    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>


    <c:url var="all" value="/assets/public/fontawesome/js/all.min.js" />
    <script src="${all}"></script>       
    <script>
        function senha() {


            var passwordField = document.getElementById('#inputPassword');

            var passwordFieldType = passwordField.type;
            var botao = document.getElementById('#showPassword');

            if (passwordFieldType == 'password') {
                passwordField.type = 'text';
                botao.innerText = ('<i class="fas fa-eye-slash"></i>');
            } else {
                passwordField.type = 'password';
                botao.innerText = ('<i class="fas fa-eye"></i>');
            }

        }
    </script>
</body>
</html>
