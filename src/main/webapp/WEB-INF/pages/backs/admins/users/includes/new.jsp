<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="box box-info collapsed-box">
    <div class="box-header">
        <h3 class="box-title">Add new user
            <small>Click on + drop down form to add new.</small>
        </h3>
        <div class="pull-right box-tools">
            <button type="button" class="btn btn-info btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                <i class="fa fa-plus"></i>
            </button>                   
        </div>
    </div>
    <div class="box-body pad">
        <div class="col-sm-6">
            <form role="form">
                <div class="box-body">
                    <div class="form-group">
                        <label for="cbskillcategory">User role</label>
                        <select id="cbskillcategory" type="text" class="form-control">
                            <option>Sub admin</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="txfirstname">First name</label>
                        <input id="txfirstname" class="form-control" placeholder="example: Sok"/>
                    </div>
                    <div class="form-group">
                        <label for="txlastname">Last name</label>
                        <input id="txlastname" class="form-control" placeholder="example: Channy"/>
                    </div>
                    <div class="form-group">
                        <label for="txemail">Email</label>
                        <input id="txemail" type="email" class="form-control" placeholder="example: Sokchanny12@expert.org.com"/>
                    </div>
                    <div class="form-group">
                        <label for="txusername">Username</label>
                        <input id="txusername" class="form-control" placeholder="example: channysok12"/>
                    </div>
                    <div class="form-group">
                        <label for="txpassword">Password</label>
                        <input id="txpassword" type="password" class="form-control" placeholder="example: 12U@abc"/>
                    </div>
                    <div class="form-group">
                        <label for="txconfirmpassword">Confirm password</label>
                        <input id="txconfirmpassword" type="password" class="form-control" placeholder="example: 12U@abc"/>
                    </div>                                    
                    <div class="form-group">
                        <small>Default is deactive, you can turn in on to be active.</small><br>
                        <label for="chactive">Active</label><br>
                        <label class="switch">
                            <input type="checkbox">
                            <div class="slider round"></div>
                        </label> 
                    </div>
                </div>
                <div class="box-footer">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>
