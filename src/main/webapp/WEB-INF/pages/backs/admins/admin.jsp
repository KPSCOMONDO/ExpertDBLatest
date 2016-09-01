<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" ng-app="admin--app" ng-controller="admin__controller">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <jsp:include page="../includes/back-style.jsp" />
    </head>
    <body class="hold-transition skin-blue sidebar-mini" >   
        <div class="wrapper">
            <jsp:include page="../includes/menubar.jsp" />             
            <jsp:include page="../includes/sidbar-left.jsp" />             
            <jsp:include page="includes/dashboard.jsp" /> 
            <jsp:include page="../includes/footer.jsp"/>
        </div>
        <jsp:include page="../includes/back-script.jsp" />           
        <script src="../../../../resources/scripts/utility/configuration.js" type="text/javascript"></script>
        <script src="../../../../resources/static/angular/angular.js" type="text/javascript"></script>     
        <script src="../../../../resources/scripts/backend/angular/admin.js" type="text/javascript"></script>
        <script type="text/javascript">            
                var app = angular.module('admin--app', []);
                app.controller('admin__controller', function ($scope, $http) {
                    console.log("FUCK", $scope.COUNTS)
                    $scope.COUTS=[]
                    REQUEST.GET("/component/count", $http, function (response) {
                        console.log(response)
                        $scope.COUNTS = response.data.DATA;
                        console.log($scope.COUNTS)
                    }, function (error) {
                        REQUEST.ERROR(error)
                    })
                });
        </script>
    </body>
</html>
