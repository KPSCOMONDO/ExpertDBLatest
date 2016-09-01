<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" ng-app="filter--app">
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GEEK DIR</title>
        <jsp:include page="../includes/home-style.jsp"/>    
        <link href="../../../../resources/static/libs/ng-tags-input.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.2/angular.min.js"></script>
    </head>
    <body ng-cloak ng-controller="filter__controller">
        <jsp:include page="includes/menubar.jsp"/>
        <jsp:include page="includes/header.jsp"/>
    <section class="text-left content">
        <div class="col-2 container">
            <jsp:include page="includes/search-session.jsp"/>
            <jsp:include page="includes/expert-list.jsp"/>    
        </div>
    </section>
    <jsp:include page="../utility/loading.jsp"/>
    <jsp:include page="../includes/footer.jsp"/>
    <jsp:include page="../includes/home-script.jsp"/> 
    <script src="../../../../resources/scripts/utility/configuration.js" type="text/javascript"></script>
<!--    <script src="../../../../resources/static/angular/angular.js" type="text/javascript"></script>-->
    <script src="../../../../resources/static/libs/dirPagination.js" type="text/javascript"></script>
    <script src="../../../../resources/static/libs/ng-tags-input.js" type="text/javascript"></script>
    <script src="../../../../resources/static/libs/jsel.js" type="text/javascript"></script>
    <script src="../../../../resources/scripts/frontend/angular/filter.js" type="text/javascript"></script>

    <%-- Pagination --%>

</body>
</html>