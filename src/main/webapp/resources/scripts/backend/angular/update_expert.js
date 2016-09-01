app.controller('update__expert__controller', function ($scope, $http) {
    $scope.catId = null
    $scope.cityId = null
    $scope.city = null
    $scope.docuemntType = null
    $scope.locationId = null
    $scope.positionAId = null
    $scope.positionBId = null
    $scope.gender = null

    $scope.AGES = DECLARATION.fetchAge()
    $scope.EXPERIENCES = DECLARATION.fetchExperience()
    $scope.SALARIES = DECLARATION.fetchSalary()
    $scope.GENDERS = DECLARATION.fetchGender()
    $scope.DOCUMENTS = DECLARATION.fetchDocument()

    $scope.ADD_SKILLS = []
    $scope.ADD_LANGUAGES = []
    $scope.ADD_SKILLS = []
    $scope.ADD_EXPERIENCES = []
    $scope.ADD_DOCUMENTS = []
    $scope.ADD_POSITIONS = new Array()
    $scope.ADD_EDUCATIONS = []

   
    REQUEST.GET("/component/language/findall", $http, function (response) {
        $scope.LANGUAGES = (response.data.DATA);
        if ($scope.LANGUAGES) {
            $scope.LANGUAGES = $scope.LANGUAGES.reverse();
        }
        $.map($scope.LANGUAGES, function (item) {
            item.CHECKED = false
        })
    }, function (error) {
        DIALOG.error("Error", error.message);
    })
    
    $scope.onLanguageCheck = function (laguage) {
        if (laguage.CHECKED) {
            var i = 0
            $.map($scope.ADD_LANGUAGES, function (item) {
                if (laguage.LANGUAGEID == item.ID) {
                    $scope.deleteLanguage
                }
                i++
            })
            console.log("Removed:", $scope.ADD_LANGUAGES)
        } else {

        }
        laguage.CHECKED = !laguage.CHECKED
    }
    $scope.onLaguageLevelCheck = function (language, level) {
        var update = false
        $.map($scope.ADD_LANGUAGES, function (item) {
            if (item.LANGUAGEID == language.ID) {
                item.LEVELID = level.LEVELID
                console.log("UPDATED:", $scope.ADD_LANGUAGES)
                update = true
                return
            }
        })
        if (!update) {
            $scope.ADD_LANGUAGES.push({"LANGUAGEID": language.ID, "LEVELID": level.LEVELID})
            console.log("ADDED:", $scope.ADD_LANGUAGES)
        }
    }
    $scope.deleteLanguage = function (index) {
        JYSON.DELETE($scope.ADD_LANGUAGES, i, function (data) {
            $scope.ADD_LANGUAGES = data
        })
    }

    /*
     *  Location
     */
    REQUEST.GET("/component/location/findall", $http, function (response)
    {
        $scope.LOCATIONS = (response.data.DATA);
        if ($scope.LOCATIONS) {
            $scope.LOCATIONS = $scope.LOCATIONS.reverse();
        }
    }, function (error) {
        DIALOG.error("Error", error.message);
    })
    /**
     * Position
     */
    REQUEST.GET("/component/position/findall", $http, function (response)
    {
        $scope.POSITIONS = (response.data.DATA);
        if ($scope.POSITIONS) {
            $scope.POSITIONS = $scope.POSITIONS.reverse();
        }
    }, function (error) {
        DIALOG.error("Error", error.message);
    })
    /*
     * Skill Category
     */
    REQUEST.GET("/component/skill/category/findall", $http, function (response)
    {
        $scope.SKILLCATEGORIES = (response.data.DATA);
        if ($scope.SKILLCATEGORIES) {
            $scope.SKILLCATEGORIES = $scope.SKILLCATEGORIES.reverse();
        }
    }, function (error) {
        DIALOG.error("Error", error.message);
    })
    $scope.FindSkillBycatId = function () {
        REQUEST.GET("/component/skill/find-by-categoryid/" + $scope.catId, $http, function (response) {
            $scope.SKILLS = (response.data.DATA);
            if ($scope.SKILLS) {
                $scope.SKILLS = $scope.SKILLS.reverse();
            }
            $scope.setItemStatus();
        }, function (error) {
            DIALOG.error("Error", error.message);
        })
    }

    $scope.onSkillCheck = function (skill, index) {
        if (skill.CHECKED) {
            //$scope.deleteSkill(index)
            console.log("Removed:", $scope.ADD_SKILLS)
        }
        skill.CHECKED = !skill.CHECKED
    }

    $scope.deleteSkill = function (index) {
        JYSON.DELETE($scope.ADD_SKILLS, index, function (data) {
            $scope.ADD_SKILLS = data
        })
    }

    $scope.onSkillLevelCheck = function (skill, level) {
        var update = false
        $.map($scope.ADD_SKILLS, function (item) {
            if (item.SKILLID == skill.ID) {
                item.LEVELID = level.LEVELID
                item.LEVEL = level.LEVELSTATUS
                console.log("UPDATED:", $scope.ADD_SKILLS)
                update = true
                return
            }
        })
        if (!update) {
            $scope.ADD_SKILLS.push({"SKILLID": skill.ID, "LEVELID": level.LEVELID, "SKILL": skill.SKILL, "LEVEL": level.LEVELSTATUS})
            console.log("ADDED:", $scope.ADD_SKILLS)
        }
    }
    /*
     * Level
     */
    REQUEST.GET("/component/level/findall", $http, function (response)
    {
        $scope.LEVELS = (response.data.DATA);
        if ($scope.LEVELS) {
            $scope.LEVELS = $scope.LEVELS.reverse();
        }
    }, function (error) {
        DIALOG.error("Error", error.message);
    })
    /*
     * Watch
     */
    $scope.$watch('skill_category_id', function (element) {
        if (element != undefined) {
            $scope.catId = element.ID;
            $scope.FindSkillBycatId()
        }
    });
    $scope.$watch('cboCategory', function (element) {
        if (element != undefined) {
            $scope.catId = element.ID;
            $scope.FindSkillBycatId()
        }
    });
    $scope.$watch('cboSkill', function (element) {
        if (element != undefined) {
            console.log(element)
            $scope.ADD_SKILLS.push({"SKILLID": element.ID, "LEVELID": 2})
            console.log($scope.ADD_SKILLS)
        }
    });
    $scope.$watch('cboGender', function (element) {
        if (element != undefined) {
            console.log("Element :", element)
            $scope.gender = element.VALUE;
        }
    });
    $scope.$watch('cboCity', function (element) {
        if (element != undefined) {
            console.log("Element :", element)
            $scope.cityId = element.ID;
            $scope.city = element.LOCATIONSTATUS
        }
    });
    $scope.$watch('cboLocation', function (element) {
        if (element != undefined) {
            console.log("Element :", element)
            $scope.locationId = element.ID;
        }
    });
    $scope.$watch('cboPositionA', function (element) {
        if (element != undefined) {
            $scope.ADD_POSITIONS[0] = element.ID
        }
    });
    $scope.$watch('cboPositionB', function (element) {
        if (element != undefined) {
            $scope.ADD_POSITIONS[1] = element.ID
        }
    });

    /*
     * Related Function
     */
    $scope.setItemStatus = function () {
        $.map($scope.SKILLS, function (item) {
            item.STATUS = false;
        })
    }

    $scope.onDocumentTypeClick = function (type) {
        $scope.docuemntType = type.VALUE
        console.log("Tpe: ", $scope.docuemntType)
    }

    $scope.addDocument = function () {
        $scope.ADD_DOCUMENTS.push({
            "STATE": $scope.docuemntType,
            "STATUS": $scope.txtDocumentTitle,
            "URL": "Not avaliable",
            "DESCRIPTION": $scope.txtDocumentDescription
        })
        console.log($scope.ADD_DOCUMENTS)
    }
    $scope.deleteDocument = function (index) {
        JYSON.DELETE($scope.ADD_DOCUMENTS, index, function (data) {
            $scope.ADD_DOCUMENTS = data
        })
    }

    $scope.addEducation = function () {
        $scope.ADD_EDUCATIONS.push({
            "STATUS": $scope.txtMajor,
            "GRADUATED_DATE": $scope.txtGraduateDate,
            "DESCRIPTION": $scope.txtEducationDescription
        })

    }

    $scope.addExperience = function () {
        $scope.ADD_EXPERIENCES.push({
            "STATUS": $scope.txtPosition,
            "YEAR": $scope.txtYearFromB + " to " + $scope.txtYearToB,
            "DESCRIPTION": $scope.txtExperienceDescription
        })
    }
    $scope.deleteExperience = function (index) {
        JYSON.DELETE($scope.ADD_EXPERIENCES, index, function (data) {
            $scope.ADD_EXPERIENCES = data
        })
    }
    $scope.prepareSkill = function () {
        var temp = []
        $.map($scope.ADD_SKILLS, function (item) {
            temp.push({"SKILL ID": item.SKILLID, "LEVEL ID": item.LEVELID})
        })
        $scope.ADD_SKILLS = temp
    }
    $scope.prepareLanguage = function () {
        var temp = []
        $.map($scope.ADD_LANGUAGES, function (item) {
            temp.push({"LANGUAGE ID": item.LANGUAGEID, "LEVEL ID": item.LEVELID})
        })
        $scope.ADD_LANGUAGES = temp
    }
  
    /**
     * 
     * @returns {undefined}
     * 
     * EDIT
     */
    $scope.editData = function () {
        $scope.prepareSkill()
        $scope.prepareLanguage()
        var data = {
            "ID":$scope.expertId,
            "FULL NAME": $scope.EXPERT.FULLNAME,
            "GENDER": $scope.EXPERT.GENDER,
            "DATE OF BIRTH": $scope.EXPERT.DATEOFBIRTH,
            "CURRENT WORK": $scope.EXPERT.CURRENTWORK,
            "SALARY": $scope.EXPERT.SALARY,
            "INTEREST": $scope.EXPERT.INTEREST,
            "YEAR EXPERIENCE": $scope.EXPERT.YEAREXPERIENCE,
            "IMAGE URL": "not avaliable",
            "LOCATION ID": $scope.locationId, //$scope.locationId,
            "ADDRESS": {
                "COMMUNE": $scope.EXPERT.ADDRESS.COMMUNE,
                "DISTRICT": $scope.EXPERT.ADDRESS.DISTRICT,
                "CITY": $scope.EXPERT.ADDRESS.CITY,
                "COUNTRY": $scope.EXPERT.ADDRESS.CITY
            },
            "CONTACTS": $scope.EXPERT.CONTACTS,
            "EDUCATIONS": $scope.ADD_EDUCATIONS,
            "DOCUMENTS": $scope.ADD_DOCUMENTS,
            "EXPERIENCES": $scope.ADD_EXPERIENCES,
            "LANGUAGES": $scope.ADD_LANGUAGES,
            "SKILLS": $scope.ADD_SKILLS,
            "POSITION ID": $scope.ADD_POSITIONS
        }
        console.log("Edit Data:", data)
        return data
    }

    $scope.prepareEdit = function () {
        $.map($scope.ADD_LANGUAGES, function (item) {
            $.map($scope.LEVELS, function (lev) {
                if (item.LEVEL === lev.LEVELSTATUS) {
                    item.LEVELID = lev.LEVELID
                    item.LANGUAGEID = item.ID
                }
            })
        })
        $.map($scope.ADD_SKILLS, function (item) {
            $.map($scope.LEVELS, function (lev) {
                if (item.LEVEL === lev.LEVELSTATUS) {
                    item.LEVELID = lev.LEVELID
                    item.SKILLID = item.ID
                }
            })
        })

        $.map($scope.ADD_EDUCATIONS, function (item) {
            var temp = []
            temp.push({
                "STATUS": item.EDUCATION,
                "GRADUATED_DATE": item.EDUCATEDDATE,
                "DESCRIPTION": item.DESCRIPTION
            })
            $scope.ADD_EDUCATIONS = temp
        })
        $.map($scope.ADD_DOCUMENTS, function (item) {
            var temp = []
            temp.push({
                "STATE": item.DOCUMENTSTATE,
                "STATUS": item.DOCUMENTSTATUS,
                "URL": item.DOCUMENTURL,
                "DESCRIPTION": item.DOCUMENTDESCRIPTION
            })
            $scope.ADD_DOCUMENTS = temp
        })

        $.map($scope.ADD_EXPERIENCES, function (item) {
            var temp = []
            temp.push({
                "STATUS": item.EXPERIENCE,
                "YEAR": item.YEAR,
                "DESCRIPTION": item.DESCRIPTION
            })
            $scope.ADD_EXPERIENCES = temp
        })
        console.log("SKILLS,", $scope.ADD_SKILLS)
        console.log("Lang,", $scope.ADD_LANGUAGES)
    }

    $scope.addPosition = function () {
        var i = 0;
        $.map($scope.EXPERT.POSITIONS, function (item) {
            $scope.ADD_POSITIONS[i] = item.ID
            i++
        })
    }
    $scope.FindExpertByID = function () {       
        REQUEST.GET("/expert/find-by-id/" + APP_CACHE.get("EXPERT_ID"), $http, function (response) {
            $scope.EXPERT = response.data.DATA;
            if ($scope.EXPERT) {
                $scope.ADD_SKILLS = $scope.EXPERT.SKILLS
                $scope.ADD_LANGUAGES = $scope.EXPERT.LANGUAGES
                $scope.ADD_EXPERIENCES = $scope.EXPERT.EXPERIENCES
                $scope.ADD_EDUCATIONS = $scope.EXPERT.EDUCATIONS
                $scope.ADD_DOCUMENTS = $scope.EXPERT.DOCUMENTS
                $scope.addPosition()
                $scope.prepareEdit()
            }
            console.log($scope.EXPERT, ":  :", APP_CACHE.get("EXPERT_ID"))
        }, function (error) {
            DIALOG.error("Error", error.message);
        })
    }

    $scope.updateExpert = function () {
        REQUEST.PUT("/expert/update/" + APP_CACHE.get("EXPERT_ID"), $scope.editData(), $http, function (response) {
            REQUEST.SUCCESS(response);
            $scope.FindAllExpert()
        }, function (error) {
            REQUEST.ERROR(error)
        })
    }    
    $scope.FindExpertByID()
    console.log(APP_CACHE.get("EXPERT_ID"), ": EXPER ID")
});
