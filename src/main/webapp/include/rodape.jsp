<%-- 
    Document   : rodape
    Created on : 12/07/2020, 06:27:36
    Author     : John William Vicente <johnwill.v.2017@gmail.com>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


        <!-- Footer -->
        <footer class="page-footer font-small bg-dark pt-4">

            <!-- Footer Links -->
            <div class="container-fluid text-center text-md-left">

                <!-- Grid row -->
                <div class="row">

                    <!-- Grid column -->
                    <div class="col-md-6 mt-md-0 mt-3">

                        <!-- Content -->
                        <h5 class="text-uppercase" style="font-size:80px;"><span style="color:orange;">DEV</span><span style="color:#fff;">CAR</span></h5>
                        <p>Compre o seu carro com quem entende dos paranauês.</p>
                        <hr/>
                        <p>
                            Telefone: (35) 9261-5330<br/>
                            Endereco: Juruaia-MG<br/>
                            Email: johnwill.v.2017@gmail.com
                        </p>
                    </div>
                    <!-- Grid column -->

                    <hr class="clearfix w-100 d-md-none pb-3">

                    <!-- Grid column -->
                    <div class="col-md-3 mb-md-0 mb-3">


                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-3 mb-md-0 mb-3">

                        <!-- Links -->
                        <h5 class="">Navegue no site</h5>
                        <hr/>
                        <ul class="lista-links" >

                            <li class="">
                                <a class="" href="<c:url value="/public/index/" />">Home</a>
                            </li>
                            <li class="">
                                <a class="" href="<c:url value="/public/produtosAll" />">Produtos</a>
                            </li>
                            <li class="">
                                <a class="" href="<c:url value="/public/sobre/" />" >Quem somos</a>
                            </li>


                            <li class="">
                                <a class="  " title="Area restrita" href="<c:url value="/adm/" />" >Área restrita
                                </a>
                            </li>
                        </ul>

                    </div>
                    <!-- Grid column -->

                </div>
                <!-- Grid row -->

            </div>
            <!-- Footer Links -->

            <!-- Copyright -->
            <div class="footer-copyright text-center py-3">© 2020 Copyright:
                <a href="<c:url value="/public/index" />"> DEVCAR</a>
            </div>
            <!-- Copyright -->

        </footer>
            
         
        <c:url var="bootstrap" value="/assets/public/js/bootstrap.min.js" />
        <c:url var="all" value="/assets/public/js/all.min.js" />
        <c:url var="all" value="/assets/public/fontawesome/js/all.min.js" />
        <c:url var="slick" value="/assets/public/js/slick.min.js" />
        <!-- Footer -->

        <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script src="${bootstrap}"></script>
        <script src="${all}"></script>
        <script src="${slick}"></script>
        
        <script>
//            Scripts para fazer com que o slick, carrosel, funcione
            $('.imagem-marca').slick({
                dots: true,
                infinite: true,
                slidesToShow: 3,
                slidesToScroll: 3,
                autoplay: true,
                autoplaySpeed: 4000
            });
            $('.slider-for').slick({
                slidesToShow: 1,
                slidesToScroll: 1,
                arrows: false,
                fade: true,
                asNavFor: '.slider-nav'
            });
            $('.slider-nav').slick({
                slidesToShow: 3,
                slidesToScroll: 1,
                asNavFor: '.slider-for',
                dots: true,
                centerMode: true,
                focusOnSelect: true
            });
        </script>
    </body>
</html>
