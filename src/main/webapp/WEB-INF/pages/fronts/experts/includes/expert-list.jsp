<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-8 text-left">             
    <%-- --------------------------- RECORD -----------------------------%>
    <div class="">           
        <div class="col-sm-5">
            <div class="dropdown">
                <button class="" data-toggle="dropdown" style="width: 100%;">
                    <span class="pull-left">តម្រៀបតាម : {{sortName}}</span>
                    <span class="fa pull-right" ng-class="{'fa-sort-desc':reverse,'fa-sort-asc':!reverse}"></span>
                </button>
                <ul class="dropdown-menu subject">
                    <li><a href="" class="subject" ng-click="sort('FULLNAME', 'ឈ្មោះ')">ឈ្មេាះ</a></li>
                    <li><a href="" class="subject" ng-click="sort('YEAREXPERIENCE', 'ឆ្នាំនៃបទពិសោធន')">ឆ្នាំនៃបទពិសោធន៍</a></li>
                    <li><a href="" class="subject" ng-click="sort('SALARY', 'ប្រាក់ខែ')">ប្រាក់ខែ</a></li>
                    <li><a href="" class="subject" ng-click="sort('PROVINCESTATUS', 'ទីតាំងការងារ')">ទីតាំងការងារ</a></li>
                    <li><a href="" class="subject" ng-click="sort('AGE', 'អាយុ')">អាយុ</a></li>
                </ul>
            </div> 
            <div ng-if="EXPERTS">
                <h3 class="heading">លទ្ធផល</h3>
            </div>
        </div>
        <div>            
            <div class="pull-right">
                <form class="form-inline">
                    <div class="form-group">
                        <label>ច្រោះយក</label>
                        <input type="text" ng-model="search" class="form-control search--expert" placeholder="ច្រោះតាមពាក្យ">
                    </div>
                </form>            
                <dir-pagination-controls max-size="5" direction-links="true" boundary-links="true"></dir-pagination-controls> 
            </div>
        </div>
        <table style="width: 100%;" >    
            <tbody>
                <tr dir-paginate="item in EXPERTS|orderBy:sortKey:reverse|filter:search|itemsPerPage:15">
                    <td>
                        <div class="col-sm-12 col-lg-12 col-xs-12 box--result">
                            <div class="pull-left image--profile">                                                                                         
                                <img class="img-responsive" src="{{item.IMAGEURL}}" 
                                     onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/resources/images/profile/na-profile.jpg';">                           
                            </div>
                            <div class="col-sm-10 col-lg-10 col-xs-10 row pull-right">
                                <div class="col-sm-8 col-xs-10 row">                                  
                                    <h3 class="row"><strong>{{item.FULLNAME}}</strong></h3>                                    
                                </div>
                                <div class="col-sm-4 col-xs-4 col-lg-4 pull-right">                                                                      
                                    <h4 class="text-right row">{{item.YEAREXPERIENCE}} years experience</h4>
                                    <h4 class="text-right row"><span class="fa fa-money"> {{item.SALARY| currency:"USD ":0}}</span></h4>                                                                                                                             
                                </div>
                                <div class="col-sm-12 col-lg-12 col-xs-12 row">
                                    <div class="col-sm-8 col-xs-8 col-lg-8 pull-left" style="padding-left: 0;margin-left: 0;">
                                        <span ng-repeat="pos in item.POSITIONS| limitTo:1" class="fa fa-briefcase">
                                            &nbsp;&nbsp;<strong>{{pos.POSITION}}</strong>
                                        </span><br>
                                        <span ng-repeat="pos in item.POSITIONS" ng-if="$index>0" class="fa fa-briefcase">
                                            &nbsp;&nbsp;<strong>{{pos.POSITION}}</strong>
                                        </span><br>
                                        <span ng-if="item.GENDER == 'Male'" class="fa fa-male">&nbsp;&nbsp;&nbsp;</span>
                                        <span ng-if="item.GENDER == 'Female'" class="fa fa-female">&nbsp;&nbsp;&nbsp;</span>
                                        <span class="fa fa-birthday-cake">&nbsp;&nbsp;&nbsp;{{item.AGE}}&nbsp;&nbsp;&nbsp;</span>
                                        <span class="fa fa-location-arrow">&nbsp;&nbsp;{{item.Province.PROVINCESTATUS}}</span>
                                    </div>
                                    <div class="pull-right row">
                                        <a class="btn btn-primary row" ng-click="onViewDetailClick(item)" href="${pageContext.request.contextPath}/expert/detail">
                                            <i class="glyphicon glyphicon-eye-open"></i> DETAIL
                                        </a> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td> 
                </tr>
            </tbody>
        </table> 
        <div class="pull-right">
            <dir-pagination-controls max-size="5" direction-links="true" boundary-links="true"></dir-pagination-controls> 
        </div>
    </div>
</div>