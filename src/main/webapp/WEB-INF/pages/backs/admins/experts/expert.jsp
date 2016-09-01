<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ex" ng-app="expert--app">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <jsp:include page="../includes/sub-style.jsp"/>
        <link href="../../../../../resources/static/switch/switch.css" rel="stylesheet" type="text/css"/>
    </head>
    <body  class="hold-transition skin-blue sidebar-mini">   
        <div class="wrapper"> 
            <jsp:include page="../../includes/menubar.jsp"/>
            <jsp:include page="../../includes/sidbar-left.jsp"/>
            <div class="content-wrapper">                                
                <section class="content" ng-controller="expert__controller">
                    <jsp:include page="includes/new.jsp"/>
                    <jsp:include page="includes/expert-list.jsp"/>
                </section>
            </div>             
            <jsp:include page="../../includes/footer.jsp"/>
        </div>        
    </div>
    <jsp:include page="../includes/sub-script.jsp"/>    
    <script src="../../../../../resources/scripts/utility/configuration.js" type="text/javascript"></script>
    <script src="../../../../../resources/static/angular/angular.js" type="text/javascript"></script>
    <script src="../../../../../resources/static/libs/dirPagination.js" type="text/javascript"></script>
    <script src="../../../../../resources/scripts/backend/angular/expert.js" type="text/javascript"></script>
   <!--<script src="../../../../../resources/scripts/backend/angular/update_expert.js" type="text/javascript"></script>-->
</body>
</html>