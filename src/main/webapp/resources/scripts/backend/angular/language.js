var app = angular.module('language--app', ['angularUtils.directives.dirPagination']);
app.controller('language__controller', function ($scope, $http) {
    $scope.FinallLanguage = function () {
        REQUEST.GET("/component/language/findall", $http, function (response) {
            $scope.LANGUAGES = (response.data.DATA);
            if ($scope.LANGUAGES) {
                $scope.LANGUAGES = $scope.LANGUAGES.reverse();
            }
            $scope.setItemStatus();
        }, function (error) {
            REQUEST.ERROR(error)
        })
    }

    $scope.sort = function (keyname, name) {
        $scope.sortKey = keyname; //set the sortKey to the param passed
        $scope.sortName = name;
        $scope.reverse = !$scope.reverse; //if true make it false and vice versa
    }


    $scope.editClick = function (element) {
        console.log(element)
        if (element.STATUS) {
            $scope.updateLanguage(element);
        }
        element.STATUS = !element.STATUS;
    }

    $scope.setItemStatus = function () {
        $.map($scope.LANGUAGES, function (item) {
            item.STATUS = false;
        })
    }

    /*
     * Create new 
     */

    $scope.createLanguage = function () {
        REQUEST.POST("/component/language/create", {
            "LANGUAGE STATUS": $scope.txtLanguage
        }, $http, function (response) {
            REQUEST.SUCCESS(response);
            $scope.FinallLanguage()
            $scope.txtLanguage = ""
        }, function (error) {
            REQUEST.ERROR(error)
        })
    }
    /**
     * Update language  
     */
    $scope.updateLanguage = function (element) {
        REQUEST.PUT("/component/language/update", {
            "LANGUAGE ID": element.ID,
            "LANGUAGE STATUS": element.LANGUAGE
        }, $http, function (response) {
            REQUEST.SUCCESS(response);
            $scope.FinallLanguage()
        }, function (error) {
            REQUEST.ERROR(error);
        })
    }

    $scope.deleteLanguage = function (element) {
        DIALOG.confirm("Deleting!", element.LANGUAGE + " is being deleted.", function () {
            REQUEST.DELETE("/component/language/delete/" + element.ID, $http, function (data) {
                REQUEST.SUCCESS(data)
                $scope.FinallLanguage()
            }, function (error) {
                REQUEST.ERROR(error)
            })
        })
    }
    $scope.FinallLanguage();
});
