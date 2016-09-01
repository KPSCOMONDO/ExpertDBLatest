<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" ng-app="detail--app">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GEEKH</title>
        <jsp:include page="../../includes/home-style.jsp"/>
    </head>
    <body ng-controller="detail__controller">
        <jsp:include page="includes/menubar.jsp"/>
        <jsp:include page="includes/header.jsp"/>
        <jsp:include page="includes/detail.jsp"/>
        <jsp:include page="includes/contact.jsp"/> 
        <jsp:include page="../../includes/footer.jsp"/> 
        <jsp:include page="../../includes/home-script.jsp"/>
        <script src="../../../../../resources/scripts/utility/configuration.js" type="text/javascript"></script>
        <script src="../../../../../resources/static/angular/angular.js" type="text/javascript"></script>
        <script src="../../../../../resources/scripts/frontend/angular/detail.js" type="text/javascript"></script>
    </body>
</html>