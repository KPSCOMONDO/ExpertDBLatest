<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" ng-app="home--app">
    <head>       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GEEK DIR</title>
        <jsp:include page="../includes/home-style.jsp"/>
    </head>
    <body>
    <body ng-controller="home__controller">
        <jsp:include page="../includes/menubar.jsp"/>   
        <jsp:include page="includes/header.jsp"/><%-- --- Header --- --%>
        <jsp:include page="includes/filter.jsp"/>
        <jsp:include page="includes/about.jsp"/>    
        <jsp:include page="includes/guidline.jsp"/>
        <jsp:include page="../includes/footer.jsp"/><%-- --- Footer --- --%>
        <jsp:include page="../includes/home-script.jsp"/> <%-- --- include script template --- --%>        
        <jsp:include page="../utility/loading.jsp"/><%-- --- Loading path --- --%>  
        <script src="${pageContext.request.contextPath}/resources/scripts/utility/configuration.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/static/angular/angular.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/scripts/frontend/angular/home.js" type="text/javascript"></script>
    </body>
</html>