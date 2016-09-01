<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<div class="row">
    <div class="col-xs-12">                        
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">Level list</h3>
            </div>
            <div class="box-body">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>First name</th>
                            <th>Last name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Role</th>
                            <th style="width: 5%;">Active</th>
                            <th style="width: 15%;">Action</th>                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Channy</td>
                            <td>Sok</td>
                            <td>Sokchanny.sg@gmail.com</td>
                            <td>086 65 14 43</td>                           
                            <td>Admin</td>
                            <td>         
                                <label class="switch">
                                    <input type="checkbox">
                                    <div class="slider round"></div>
                                </label>                                       
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/user/detail" class="btn btn-primary btn-xs"><i class="fa fa-info"></i></a>
                                <a href="#" data-skin="skin-blue-light" class="btn btn-warning btn-xs"><i class="fa fa-remove"></i></a>
                            </td>                            
                        </tr>                                
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>#</th>
                            <th>First name</th>
                            <th>Last name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Role</th>
                            <th style="width: 5%;">Active</th>
                            <th style="width: 15%;">Action</th>                            
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>
</div>
