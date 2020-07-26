<%-- 
    Document   : mensagem
    Created on : 13/07/2020, 08:49:58
    Author     : John William Vicente <johnwill.v.2017@gmail.com>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag description="put the tag description here" pageEncoding="UTF-8"%>

<%-- Essas são as mesnagens de sucesso e as de erro do sistema --%>
<%@attribute name="message"%>
<%@attribute name="tipo"%>

<c:choose>
    <c:when test="${tipo=='SUCESSO'}" >
        <div class="alert alert-success" role="alert">
            ${message}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:when>
    <c:otherwise >
        <div class="alert alert-danger" role="alert">
            ${message}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:otherwise>

</c:choose>