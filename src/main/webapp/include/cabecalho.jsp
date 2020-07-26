<%-- 
    Document   : cabecalho
    Created on : 12/07/2020, 06:07:58
    Author     : John William Vicente <johnwill.v.2017@gmail.com>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--Importes dos aruivos css-->
<c:url var="normalize" value="/assets/public/css/normalize.css" />
<c:url var="mystyle" value="/assets/public/css/mystyle.css" />
<c:url var="bootstrap" value="/assets/public/css/bootstrap.min.css" />
<c:url var="fontawesome" value="/assets/public/fontawesome/css/all.min.css" />
<c:url var="slick" value="/assets/public/css/slick.css" />
<c:url var="slicktheme" value="/assets/public/css/slick-theme.css" />
<c:url var="jquery" value="/assets/public/js/jquery-3.5.1.min.js" />

<!--Cabecalho que será usado em todas as páginas do sistema-->

<!DOCTYPE html>


<html lang="pt-br">
    <head>
        <!--Receberá um objeto do sistema que irá setar o titulo das páginas-->
        <title>${title.nome}</title>

        <meta charset="utf-8" />
        
        <!--icone da aba igual para todas as páginas-->
        <link rel="icon"  href="<c:url value="/assets/public/" />images/icone.png">
        
        <link rel="stylesheet" type="text/css" href="${normalize}" />
        <link rel="stylesheet" type="text/css" href="${bootstrap}" />

        <link rel="stylesheet" href="${fontawesome}">
        <link rel="stylesheet" href="${mystyle}">
        <link rel="stylesheet" href="${slick}">
        <link rel="stylesheet" href="${slicktheme}">

        <script src="${jquery}" ></script>

    </head>
