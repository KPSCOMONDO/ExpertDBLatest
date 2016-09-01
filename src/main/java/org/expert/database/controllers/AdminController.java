package org.expert.database.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value={"/admin"})
public class AdminController {
    
    @RequestMapping(value={"/",""})
    public String Admin(){
        return "/backs/admins/admin";
    }
    
    @RequestMapping(value = {"/expert/list"})
    public String ExpertList(){
        return "/backs/admins/experts/expert";
    }
    
    @RequestMapping(value = {"/expert/detail"})
    public String ExpertDetail(){
        return "/backs/admins/experts/details/detail";
    }
    
    @RequestMapping(value = {"/expert/add"})
    public String ExpertAdd(){
        return "/backs/admins/experts/adds/add";
    }
    
    @RequestMapping(value = {"/skill"})
    public String Skill(){
        return "/backs/admins/skills/skill";
    }
    
    @RequestMapping(value = {"/skill/category"})
    public String SkillCategory(){
        return "/backs/admins/skillcategories/skill-category";
    }
    
    @RequestMapping(value = {"/province"})
    public String Province(){
        return "/backs/admins/provinces/province";
    }
    
    @RequestMapping(value={"/language"})
    public String Language(){
    	return "/backs/admins/languages/language";
    }
    
    @RequestMapping(value={"/level"})
    public String Level(){
    	return "/backs/admins/levels/level";
    }
    
    @RequestMapping(value={"/position"})
    public String Position(){
    	return "/backs/admins/positions/position";
    }
    
    @RequestMapping(value={"/user"})
    public String User(){
        return "/backs/admins/users/user";
    }
    @RequestMapping(value={"/user/detail"})
    public String UserDetail(){
        return "/backs/admins/users/detail";
    }
    
    @RequestMapping(value={"/report"})
    public String Report(){
        return "/backs/admins/reports/report";
    }
}
