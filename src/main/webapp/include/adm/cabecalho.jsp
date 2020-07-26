<%-- 
    Document   : cabecalho
    Created on : 12/07/2020, 14:23:12
    Author     : John William Vicente <johnwill.v.2017@gmail.com>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:url var="normalize" value="/assets/public/css/normalize.css" />
<c:url var="bootstrap" value="/assets/public/css/bootstrap.min.css" />
<c:url var="fontawesome" value="/assets/public/fontawesome/css/all.min.css" />
<c:url var="all" value="/assets/public/fontawesome/js/all.min.js" />
<c:url var="css" value="/assets/adm/css/styles.css" />
<c:url var="mycss" value="/assets/adm/css/mycss.css" />
<c:url var="dropzone" value="/assets/adm/css/dropzone.css" />

<!DOCTYPE html>

<html lang="pt-br">
    <head>
        
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="John William Vicente" />
        
        <link rel="icon"  href="<c:url value="/assets/public/" />images/icone.png">
        
        <title>Dashboard - DEVCAR</title>
        
        <link href="" rel="stylesheet" />
        <link href="${normalize}" rel="stylesheet" crossorigin="anonymous" />
        <link href="${bootstrap}" rel="stylesheet" crossorigin="anonymous" />
        <link href="${css}" rel="stylesheet" crossorigin="anonymous" />
        <link href="${mycss}" rel="stylesheet" crossorigin="anonymous" />
        <link href="${fontawesome}" rel="stylesheet" crossorigin="anonymous" />
        <link href="${dropzone}" rel="stylesheet" crossorigin="anonymous" />
        
        <script type="text/javascript" src="<c:url value="/assets/adm/ckeditor/ckeditor.js" />"></script>
        <script src="${all}" crossorigin="anonymous"></script>

  <!--<script src="https://cdn.ckeditor.com/4.14.1/standard-all/ckeditor.js"></script>-->
    </head>