
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/include/navbar.jsp"/>

<c:url var="images" value="/assets/public/images" />

<br/>
<br/>
<br/>
<main class="container-fluid">
    <div class="row">
        <div class="col-3">
            <figure>
                <img src="${images}/DEVCAR.png" width="100%" height="200px" />
            </figure>
        </div>

        <div class="col-9">
            <section id="apresentacao" >
                <h2>Quem somos</h2>
                <hr/>
                <p>
                    Nosso objetivo é simular um sistema para uma pequena loja de carros,
                    na qual o cliente possa consultar os nossos produtos. Haverá um usuário administrador,
                    que vai ter o controle dos registros de carro, CRUD.
                </p>
                <p>
                    A DevCar tem como filosofia de sempre tentar oferecer um sistema de auto nível que atenda bem as necessidades do cliente.
                    Aqui você poderá visualizar carros de várias categorias, novidades, irá fazer buscas pelo nosso catálogo e se você for um dos administradores irá ter a chance de gerenciar categoria, modelos de veículos, marcas de fabricante e, principalmente, os automóveis da loja.
                </p>
            </section>
            <section id="equipe"  >
                <h2>Equipe</h2>
                <hr/>
                <div class="row ">
                    <figure class="col-3 intregantes">
                        <img  src="${images}/intregantes.png" class="rounded-circle">
                        <figcaption class="text-center">
                            John William Vicente<hr/>
                            Desenvolvedor front-End
                        </figcaption>
                    </figure>
                    <figure class="col-3 intregantes">
                        <img src="${images}/intregantes2.jpeg" class="rounded-circle">
                        <figcaption class="text-center">
                            John William Vicente<hr/>
                            Desenvolvedor Back-End
                        </figcaption>
                    </figure>
                    <figure class="col-3 intregantes">
                        <img src="${images}/intregantes3.jpeg" class="rounded-circle">
                        <figcaption class="text-center">
                            John William Vicente<hr/>
                            Estagiário 
                        </figcaption>
                    </figure>
                </div>
            </section>
        </div>
    </div>
</main>


<c:import url="/include/rodape.jsp"/>
