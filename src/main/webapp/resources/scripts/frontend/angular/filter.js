var app = angular.module('filter--app', ['ngTagsInput', 'angularUtils.directives.dirPagination']);

app.controller('filter__controller', function ($scope, $http) {


    $scope.ADD_LANGUAGES = []
    $scope.ADD_SKILLS = []

    $scope.temp = []
    $scope.WHERE_CLAUSE = {
        "SKILL_ID": [],
        "POSITION_ID": [],
        "GENDERS": [],
        "AGES": [],
        "LOCATION_ID": [],
        "LANGUAGE_ID": [],
        "EXPERIENCE_ID": [],
        "SALARIES": []
    }
    $scope.ADD_SEARCHS = []
    $scope.getAdvanceExpert = function () {
        REQUEST.POST("/expert/expert/advancefind",
                $scope.WHERE_CLAUSE
                , $http, function (data) {
                    console.log("Success ", data)
                    if (!($scope.EXPERTS = data.data.DATA)) {
                        $scope.EXPERTS = []
                    }

                }, function (data) {
            console.log("Error ", data)
            $scope.EXPERTS = []
        })
    }

    // getting where clause back 
//    var temp = JSON.stringify(APP_CACHE.get("WHERE_CLAUSE"))
//    if (temp != null) {
//        $scope.WHERE_CLAUSE = temp
//        console.log("Teme Where :", temp)
//        $scope.getAdvanceExpert()
//    }

    $scope.LOGIN = APP_CACHE.get("LOGIN")
    $scope.logOut = function () {
        APP_CACHE.set("LOGIN", false)
        $scope.LOGIN = false
    }
    // DECLARATION 
    $scope.LOGIN = APP_CACHE.get("LOGIN")
    $scope.loading = true;
    $scope.AGES = DECLARATION.fetchAge();
    $scope.EXPERIENCES = DECLARATION.fetchExperience();
    $scope.SALARIES = DECLARATION.fetchSalary();
    $scope.GENDERS = DECLARATION.fetchGender();
    /**
     * sort epert 
     */
    $scope.sort = function (keyname, name) {
        $scope.sortKey = keyname; //set the sortKey to the param passed
        $scope.sortName = name;
        $scope.reverse = !$scope.reverse; //if true make it false and vice versa
    }



    REQUEST.GET("/filter/expert/by-skill-id/" + APP_CACHE.get("SKILL_ID"), $http, function (response) {
        $scope.loading = false;
        $scope.EXPERTS = response.data.DATA;
        $scope.COUNTERS = response.data.COUNTER;
    }, function (error) {
        REQUEST.ERROR(error)
        $scope.loading = false;
    })

    $scope.loadTags = function (query) {
        return $scope.ALL_SKILLS
    };

    REQUEST.GET("/component/skill/findall", $http, function (response) {
        $scope.ALL_SKILLS = response.data.DATA
        if ($scope.ALL_SKILLS) {
            $.map($scope.ALL_SKILLS, function (item) {
                item.text = item.SKILL
            })
        }
    }, function (error) {
        REQUEST.ERROR(error)
        $scope.loading = false;
    })



    REQUEST.GET("/component/skill/category/skill/findall", $http, function (response) {
        $scope.SKILL_CATEGORIES = response.data.DATA;
    }, function (error) {
        REQUEST.ERROR(error)
    })

    REQUEST.GET("/component/location/findall", $http, function (response) {
        $scope.LOCATIONS = response.data.DATA;
    }, function (error) {
        REQUEST.ERROR(error)
    })

    REQUEST.GET("/component/language/findall", $http, function (response) {
        $scope.LANGUAGES = response.data.DATA;
    }, function (error) {
        REQUEST.ERROR(error)
    })

    REQUEST.GET("/component/position/findall", $http, function (response) {
        $scope.POSITIONS = response.data.DATA;
    }, function (error) {
        REQUEST.ERROR(error)
    })

    // fucntion > > >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>   >>>> >>>   

    $scope.onViewDetailClick = function (element) {
        APP_CACHE.set("EXPERT_ID", element.ID)
        //APP_CACHE.set("WHERE_CLAUSE", JSON.stringify($scope.WHERE_CLAUSE)
        //$.cookie("WHERE_CLAUSE", $scope.WHERE_CLAUSE)

        $cookies.putObject("WHERE_CLAUSE", $scope.WHERE_CLAUSE)
    }

    $scope.appendWhereClause = function (key, VALUE) {
        switch (key) {
            case 'POSITION':
                $scope.temp.POSITIONID = VALUE.POSITIONID
                break
            case 'GENDER':
                $scope.temp.GENDERS = VALUE.VALUE
                break
            case 'AGE':
                $scope.temp.AGES_MIN = VALUE.MIN
                if (!($scope.temp.AGES_MAX = VALUE.MAX)) {
                    $scope.temp.AGES_MAX = 100
                }
                break
            case 'EXPERIENCE':
                $scope.temp.EXPERIENCE_MIN = VALUE.MIN
                if (!($scope.temp.EXPERIENCE_MAX = VALUE.MAX)) {
                    $scope.temp.EXPERIENCE_MAX = 100
                }
                break
            case 'SALARY':
                $scope.temp.SALARY_MIN = VALUE.MIN
                if (!($scope.temp.SALARY_MAX = VALUE.MAX)) {
                    $scope.temp.SALARY_MAX = 1000000
                }
                break
        }
        $scope.doSearchAdvance()
        console.log("ZIN :", VALUE)
    }

    $scope.onSkillCheck = function (skill) {
        var n = false
        $.map($scope.ADD_SKILLS, function (item, i) {
            if (item.ID == skill.ID) {
//                JYSON.DELETE($scope.ADD_SKILLS, i, function (data) {
//                    $scope.ADD_SKILLS = data
//                })
//                console.log("Deleted:", $scope.ADD_SKILLS)
                n = true
            }
        })
        if (!n) {
            $scope.ADD_SKILLS.push({
                "ID": skill.ID, "text": skill.SKILL
            })
        }
        $scope.doSearchAdvance()
    }

    $scope.tagSkillRemove = function () {
        $scope.doSearchAdvance()
    }

    $scope.tagSkillAdd = function () {
        console.log($scope.ADD_SKILLS)
        $scope.doSearchAdvance()
    }

    $scope.onLaguageCheck = function (language) {
        var n = false
        $.map($scope.ADD_LANGUAGES, function (item, i) {
            if (item.LANGUAGEID == language.ID) {
                JYSON.DELETE($scope.ADD_LANGUAGES, i, function (data) {
                    $scope.ADD_LANGUAGES = data
                })
                console.log("Deleted:", $scope.ADD_LANGUAGES)
                n = true
            }
        })
        if (!n) {
            $scope.ADD_LANGUAGES.push({
                "LANGUAGEID": language.ID,
            })
            console.log("ADDED:", $scope.ADD_LANGUAGES)
        }
        $scope.doSearchAdvance()
    }

    $scope.$watch('skill_category_id', function (element) {
        if (element != undefined) {
            $scope.SKILLS = element.SKILLS;
        }
    });
    $scope.$watch('cbo_location', function (element) {
        if (element != undefined) {
            $scope.temp.LOCATIONS = element.LOCATIONID
            $scope.doSearchAdvance()
        }
    });
    $scope.PREPARE_WHERE_CLUASE = function () {
        $scope.WHERE_CLAUSE.LANGUAGE_ID = []
        $.map($scope.ADD_LANGUAGES, function (item) {
            $scope.WHERE_CLAUSE.LANGUAGE_ID.push(item.LANGUAGEID)
        })
        $scope.WHERE_CLAUSE.SKILL_ID = []
        $.map($scope.ADD_SKILLS, function (item) {
            $scope.WHERE_CLAUSE.SKILL_ID.push(item.ID)
        })

        if ($scope.temp.POSITIONID) {
            $scope.WHERE_CLAUSE.POSITION_ID = []
            $scope.WHERE_CLAUSE.POSITION_ID.push($scope.temp.POSITIONID)
        }
        if ($scope.temp.AGES_MIN) {
            $scope.WHERE_CLAUSE.AGES = []
            $scope.WHERE_CLAUSE.AGES.push($scope.temp.AGES_MIN)
            $scope.WHERE_CLAUSE.AGES.push($scope.temp.AGES_MAX)
        }
        if ($scope.temp.SALARY_MIN) {
            $scope.WHERE_CLAUSE.SALARIES = []
            $scope.WHERE_CLAUSE.SALARIES.push($scope.temp.SALARY_MIN)
            $scope.WHERE_CLAUSE.SALARIES.push($scope.temp.SALARY_MAX)
        }

        if ($scope.temp.EXPERIENCE_MIN) {
            $scope.WHERE_CLAUSE.EXPERIENCE_ID = []
            $scope.WHERE_CLAUSE.EXPERIENCE_ID.push($scope.temp.EXPERIENCE_MIN)
            $scope.WHERE_CLAUSE.EXPERIENCE_ID.push($scope.temp.EXPERIENCE_MAX)
        }
        if ($scope.temp.GENDERS) {
            $scope.WHERE_CLAUSE.GENDERS = []
            $scope.WHERE_CLAUSE.GENDERS.push($scope.temp.GENDERS)
        }
        if ($scope.temp.LOCATIONS) {
            $scope.WHERE_CLAUSE.LOCATION_ID = []
            $scope.WHERE_CLAUSE.LOCATION_ID.push($scope.temp.LOCATIONS)
        }
        console.log("WHERE CLUASE:", $scope.WHERE_CLAUSE)
    }

    $scope.doSearchAdvance = function () {
        $scope.PREPARE_WHERE_CLUASE()
        if ($scope.PREPARE_WHERE_CLUASE) {
            $scope.getAdvanceExpert()
        }
    }
    $scope.reset = function () {
        $scope.EXPERTS = []
        $scope.ADD_LANGUAGES = []
        $scope.ADD_SKILLS = []
        $scope.WHERE_CLAUSE = {
            "SKILL_ID": [],
            "POSITION_ID": [],
            "GENDERS": [],
            "AGES": [],
            "LOCATION_ID": [],
            "LANGUAGE_ID": [],
            "EXPERIENCE_ID": [],
            "SALARIES": []
        }

    }

    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>=======================================
});
$(document).ready(function () {
    onChange = function (element) {
        $span1 = $(element).children().first()
        $span2 = $(element).children().eq(1)
        if ($span2.hasClass("fa-sort-desc")) {
            $span2
                    .removeClass("fa-sort-desc")
                    .addClass("fa-sort-asc")
            $span1.text("បន្ថយ");
        } else {
            $span2
                    .removeClass("fa-sort-asc")
                    .addClass("fa-sort-desc");
            $span1.text("ច្រើនទៀត");
        }
    }
    onCatClick = function (element) {
        $span = $(element).children().first().children().first();
        if ($span.hasClass("fa-chevron-right")) {
            $span
                    .removeClass("fa-chevron-right")
                    .addClass("fa-chevron-down")
        } else {
            $span
                    .removeClass("fa-chevron-down")
                    .addClass("fa-chevron-right")
        }
    }
});
