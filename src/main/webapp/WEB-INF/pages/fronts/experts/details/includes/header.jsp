<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section class="mbr-section mbr-section--relative" style="background-image: url(/resources/static/assets/images/slide-3.jpg);">
    <div class="mbr-overlay" style="opacity: 0.2; background-color: rgb(255, 355, 255);"></div>
    <div class="mbr-section__container mbr-section__container--isolated container" style="padding-top: 10%;padding-bottom: 2%;">        
        <div class="">
            <div class="mbr-box mbr-box--fixed mbr-box--adapted box--bottom--shardow" style="background-color: white;padding: 20px">                                                
                <div class="mbr-box__magnet mbr-box__magnet--top-right mbr-section__left col-sm-2">
                    <figure class="mbr-figure mbr-figure--adapted mbr-figure--caption-inside-bottom">
                        <!--<img class="img-responsive img-thumbnail" style="margin: 20px 0px 20px 0px; padding: 10px 10px 10px 10px" src="/resources/images/profile/Screen Shot 2016-08-21 at 9.50.39 PM.png">-->
                        <img class="img-responsive img-thumbnail" style="margin: 20px 0px 20px 0px; padding: 10px 10px 10px 10px" 
                             src="/Users/sokchanny/Documents/Project/ED_API_V04/Document/NounVeyo.png">
                    </figure>                    
                </div>                                    
                <div class="mbr-box__magnet mbr-class-mbr-box__magnet--center-left col-sm-8 mbr-section__right">                    
                    <div>
                        <div class="mbr-section__container mbr-section__container--middle">
                            <div class="mbr-header mbr-header--auto-align mbr-header--wysiwyg col-sm-6">                            
                                <h2 class="" style="margin-top: 10%;">{{EXPERTS.FULLNAME}}</h2>                                
                                <h4>
                                    <i class="glyphicon glyphicon-map-marker"></i>&nbsp;&nbsp;{{EXPERTS.ADDRESS.CITY}}
                                </h4>
                                <div ng-repeat="item in EXPERTS.CONTACTS|limitTo:1">
                                    <h4 class="subject"><i class="glyphicon glyphicon-envelope"></i><a href="#">&nbsp;&nbsp;{{item.EMAIL}}</a></h4>                                
                                    <h4 class="subject"><i class="glyphicon glyphicon-phone"></i><a href="#">&nbsp;&nbsp;{{item.PHONE}}</a></h4>
                                </div>                                
                            </div>

                            <div class="col-sm-6 text-left">
                                <div>
                                    <p class="mbr-reviews__p mbr-reviews__text">
                                        <span style="color: #0097A7;"><strong ng-repeat="item in EXPERTS.POSITIONS|limitTo:1">{{item.POSITION}}</strong></span><br>
                                        <span>{{EXPERTS.YEAREXPERIENCE}}&nbsp;ឆ្នាំបទពិសោធន៍ការងារ</span><br>
                                        <span>{{EXPERTS.SALARY|currency:"USD ":0}}</span>
                                    </p> 
                                    <br>
                                    <i class="fa fa-anchor fa-3x" style="padding-left: 40px;"></i>
                                </div>                                                                                                                                                        
                            </div>
                        </div>                     
                    </div>
                </div>
            </div>
        </div>
    </div>
</section> 
