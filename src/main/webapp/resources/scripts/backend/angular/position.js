var app = angular.module('position--app', ['angularUtils.directives.dirPagination']);

app.controller('position__controller', function ($scope, $http) {
    $scope.FinallPosition = function () {
        REQUEST.GET("/component/position/findall", $http, function (response) {
            $scope.POSITIONS = (response.data.DATA);
            if ($scope.POSITIONS) {
                $scope.POSITIONS = $scope.POSITIONS.reverse();
            }
            $scope.setItemStatus();
        }, function (error) {
            REQUEST.ERROR(error)
        })
    }

    $scope.sort = function (keyname, name) {
        $scope.sortKey = keyname;   //set the sortKey to the param passed
        $scope.sortName = name;
        $scope.reverse = !$scope.reverse; //if true make it false and vice versa
    }


    $scope.editClick = function (element) {
        console.log(element)
        if (element.STATUS) {
            $scope.updatePosition(element);
        }
        element.STATUS = !element.STATUS;
    }

    $scope.setItemStatus = function () {
        $.map($scope.POSITIONS, function (item) {
            item.STATUS = false;
        })
    }

    /*
     * Create new 
     */
    $scope.createPosition = function () {
        REQUEST.POST("/component/position/create", {
            "POSITION STATUS": $scope.txtPosition
        }, $http, function (response) {
            REQUEST.SUCCESS(response);
            $scope.FinallPosition()
            $scope.txtPosition = ""
        }, function (error) {
            REQUEST.ERROR(error)
        })
    }
    $scope.updatePosition = function (element) {
        REQUEST.PUT("/component/position/update", {
            "POSITION ID": element.POSITIONID,
            "POSITION STATUS": element.POSITION
        }, $http, function (response) {
            REQUEST.SUCCESS(response)
            $scope.FinallPosition()
        }, function (error) {
            REQUEST.ERROR(error)
        })
    }
    $scope.deletePosition = function (element) {
        DIALOG.confirm("Deleting!", element.POSITION + " is being deleted.", function () {
            REQUEST.DELETE("/component/position/delete/" + element.POSITIONID, $http, function (data) {
                REQUEST.SUCCESS(data)
                $scope.FinallPosition()
            }, function (error) {
                REQUEST.ERROR(error)
            })
        })
    }
    $scope.setItemStatus = function () {
        $.map($scope.POSITIONS, function (item) {
            item.STATUS = false;
        })
    }

    $scope.FinallPosition();
});
