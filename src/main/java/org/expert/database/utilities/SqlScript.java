package org.expert.database.utilities;

public class SqlScript {

    // Skill 
    public static final String C_SKILL = "INSER INTO exp_skills (skill_id,skill_name) VALUES(#{skill_id},#{skill_name})";
    public static final String R_SKILL = "SELECT skill_id,skill_status FROM exp_skills WHERE skill_id=#{skill_id}";
    public static final String RS_SKILL = "SELECT skill_id,skill_name,exp_skills.skill_category_id,skill_category_status \n"
            + "FROM exp_skills INNER JOIN exp_skill_category \n"
            + "ON exp_skills.skill_category_id=exp_skill_category.skill_category_id";
    public static final String RS_SKILL_BY_CAT = "SELECT skill_id,skill_name,exp_skills.skill_category_id \n"
            + "FROM exp_skills \n"
            + "WHERE skill_category_id = #{skill_category}";
    public static final String D_SKILL = "DELETE FROM exp_skills WHERE skill_id=#{skill_id}";
    public static final String U_SKILL = "UPDATE exp_skills SET skill_name=#{skill_name} WHERE skill_id=#{skill_id}";

    //Province
    public static final String C_PROVINCE = "";
    public static final String R_PROVINCE = "SELECT province_id,province_status FROM exp_province WHERE province_id=#{province_id}";
    public static final String RS_PROVINCE = "SELECT province_id,province_status FROM exp_province";
    public static final String D_PROVINCE = "";
    public static final String U_PROVINCE = "";

    // Language
    public static final String C_LANGUAGE = "";
    public static final String R_LANGUAGE = "SELECT language_id,language_status FROM exp_languages WHERE language_id=#{language_id}";
    public static final String RS_LANGUAGE = "SELECT language_id,language_status FROM exp_languages";
    public static final String D_LANGUAGE = "";
    public static final String U_LANGUAGE = "";
    
     // skill category
    public static final String C_SKILL_CATEGORY = "";
    public static final String R_SKILL_CATEGORY = "SELECT skill_category_id,skill_category_status FROM exp_skill_category WHERE skill_category_id = #{skill_category_id}";
    public static final String RS_SKILL_CATEGORY = "SELECT skill_category_id,skill_category_status FROM exp_skill_category";
    public static final String D_SKILL_CATEGORY = "";
    public static final String U_SKILL_CATEGORY = "";
}
