<%-- 
    Document   : produto
    Created on : 18/07/2020, 12:48:43
    Author     : John William Vicente <johnwill.v.2017@gmail.com>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@tag description="put the tag description here" pageEncoding="UTF-8"%>

<%-- Código para tornar um card do carro vísivel para o cliente --%>
<%@attribute name="carro" required="" type="br.com.william.devdojo.model.Automovel" %>

<div class="card " style="width: 18rem;margin-bottom: 5%;">
    
    <img src="<c:url value="/" />${carro.imagens.split(",")[carro.indexTumblr]}" 
         class="card-img-top" alt="${carro.nome}" title="${carro.nome}" 
         width="100%" height="200px">

    <div class="card-body">
        <h5 class="card-title">${carro.nome} </h5>
        <p class=" preco-produto">

            <fmt:setLocale value="pt_BR" />
         R$   <fmt:formatNumber value="${carro.valor}" minFractionDigits="2"  />

        </p>
        <div class="row dados-adicionais">
            <div class="col-6 ">
                Ano: ${carro.ano} 
            </div>
            <div class="col-6 ">
                ${carro.kilometragem} km
            </div>
        </div>

        <hr/>
        
        <!--Link para uma descrição mais precisa do produto-->
        
        <a href="<c:url value="/public/produto/${carro.id}" />" class="btn btn-success btn-block"><i class="fas fa-eye"></i>&nbsp;Ver carro</a>
    </div>
</div>
<%-- any content can be specified here e.g.: --%>
