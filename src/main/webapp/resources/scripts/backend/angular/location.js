var app = angular.module('location--app', ['angularUtils.directives.dirPagination']);

app.controller('location__controller', function ($scope, $http) {
    $scope.FinallLocation = function () {
        REQUEST.GET("/component/location/findall", $http, function (response) {
            $scope.LOCATIONS = (response.data.DATA);
            if($scope.LOCATIONS){
                $scope.LOCATIONS=$scope.LOCATIONS.reverse();
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
        if (element.STATUS) {
            $scope.updateLocation(element);
        }
        element.STATUS = !element.STATUS;
    }

    $scope.setItemStatus = function () {
        $.map($scope.LOCATIONS, function (item) {
            item.STATUS = false;
        })
    }

    /*
     * Create new 
     */
    $scope.createLocation = function () {
        REQUEST.POST("/component/location/create", {
            "LOCATION STATUS": $scope.txtLocation,
            "DESCRIPTION": "not avaliable"
        }, $http, function (response) {
            REQUEST.SUCCESS(response);
            $scope.FinallLocation()
            $scope.txtLocation = ""
            $scope.txaLocationDescription = ""
        }, function (error) {
            REQUEST.ERROR(error)
        })
    }
    /**
     * Update language
     * 
     */
    $scope.updateLocation = function (element) {
        //console.log('LOCATION:', element)
        REQUEST.PUT("/component/location/update", {
            "LOCATION ID": element.LOCATIONID,
            "LOCATION STATUS": element.LOCATIONSTATUS,
            "DESCRIPTION": "Not Avaliable"
        }, $http, function (response) {
            REQUEST.SUCCESS(response)
            $scope.FinallLocation()
        }, function (error) {
            REQUEST.ERROR(error)
        })
    }
    $scope.deleteLocation = function (element) {
        console.log(element)
        DIALOG.confirm("Deleting!", element.LOCATION + " is being deleted.", function () {
            REQUEST.DELETE("/component/location/delete/" + element.LOCATIONID, $http, function (data) {
                REQUEST.SUCCESS(data)
                $scope.FinallLocation()
            }, function (error) {
                REQUEST.ERROR(error)
            })
        })
    }
    $scope.FinallLocation();
});
