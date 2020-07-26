<%-- 
    Document   : categorias
    Created on : 12/07/2020, 12:51:49
    Author     : John William Vicente <johnwill.v.2017@gmail.com>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag description="put the tag description here" pageEncoding="UTF-8"%>


<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="categorias"%>

<%-- Mostra uma lista com tds as categorias --%>
<div class="card w-100" style="width: 18rem;">
    <ul class="list-group list-group-flush">
        <c:forEach items="${categoria}" var="cat" >

            <li class="categoria">
                <a class="list-group-item" href="<c:url value="/public/produtosCategoria/${cat.id}" />"> ${cat.nome}</a>
            </li>
        </c:forEach>
    </ul>
</div>