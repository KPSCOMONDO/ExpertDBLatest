<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section class="" style="background-color: #EEEEEE;padding: 112px 0 15px 0;">
    <div class="container">
        <div class="text-left">
            <div class="col-sm-12 search--expert">
                <!--                <input type="text" class="form-control expert--search-box animated fadeInUp delay" style="padding: 10px;" 
                                ng-model="searh_for_skill" placeholder="ស្វែងរកតាមរយះជំនាញ...">                                -->
                <!--<tags-input ng-model="ADD_SEARCHS"></tags-input>-->               
                <tags-input placeholder="ស្វែងរកជំនាញ" ng-model="ADD_SKILLS" add-on-paste="true" on-tag-removed="tagSkillRemove()" on-tag-added="tagSkillAdd()">
                    <auto-complete source="loadTags($query)"></auto-complete>                                       
                </tags-input>
            </div>            
        </div>
    </div>
</section>
<section class="text-left content-2 container" style="padding-top: 20px;">
    <span class="pull-left subject"><a href="${pageContext.request.contextPath}/home"><span class="fa fa-home"></span>ទំព័រដើម</a>/ទំព័រស្វែងរក</span>
    <div class="pull-right">        
        <span ng-repeat="item in counters">            
            {{item.CATEGORYSTATUS}}
            <span class="fa fa-chevron-right"  style="color: #004D40"></span>
            {{item.SKILLSTATUS}}
            <small class="fa fa-chevron-right"  style="color: #004D40"></small>
            <strong>{{item.COUNT}}</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span>
    </div>
</section>

