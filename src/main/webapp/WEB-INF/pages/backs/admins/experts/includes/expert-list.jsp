<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="row">
    <div class="col-xs-12">                        
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">បញ្ចី</h3>
            </div>
            <form class="form-inline box-header">
                <div class="form-group">
                    <input type="text" ng-model="search" class="form-control" placeholder="Search">
                </div>
            </form>
            <div class="box-body">
                <table class="table table-striped table-responsive">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th ng-click="sort('FULLNAME')">ឈ្មោះ
                                <span class="fa" ng-show="sortKey == 'FULLNAME'" 
                                      ng-class="{'fa-sort-desc':reverse,'fa-sort-asc':!reverse}">              
                                </span>
                            </th>        
                            <th>ភេទ</th>                           
                            <th>អិុម៉ែល</th>
                            <th>លេខទូរស័ព្ទ</th>                                                        
                            <th>សកម្ម</th>
                            <th>សកម្មភាព</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr dir-paginate="item in EXPERTS|orderBy:sortKey:reverse|filter:search|itemsPerPage:10">
                            <td>{{$index + 1}}</td>
                            <td>{{item.FULLNAME}}</td> 
                            <td>{{item.GENDER}}</td>
                            <td ng-repeat="con in item.CONTACTS|limitTo:1">{{con.EMAIL}}</td>
                            <td ng-repeat="con in item.CONTACTS|limitTo:1">{{con.PHONE}}</td>              
                            <td>
                                <label class="switch">
                                    <input ng-checked="item.STATE" ng-click="onActiveClick(item)" type="checkbox">
                                    <div class="slider round"></div>
                                </label>
                            </td>
                            <td>
                                <a href="#head" ng-click="detailClick(item)" class="btn btn-primary btn-xs">
                                    <i class="fa fa-info"></i>
                                </a>
                                <a ng-click="deleteExpert(item)" data-skin="skin-blue-light" class="btn btn-danger btn-xs">
                                    <i class="fa fa-remove"></i>
                                </a>
                            </td> 
                        </tr>
                    </tbody>
                </table>
                <div class="pull-right">
                    <dir-pagination-controls max-size="5" direction-links="true" boundary-links="true"></dir-pagination-controls> 
                </div>
            </div>
        </div>                
    </div>   
</div>
