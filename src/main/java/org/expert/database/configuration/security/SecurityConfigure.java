package org.expert.database.configuration.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;


/**
 *
 * @author sokchanny
 */
@Configuration
@EnableWebSecurity
public class SecurityConfigure extends WebSecurityConfigurerAdapter {

    @Autowired
    @Qualifier(value = "ajaxAuthenticationSuccessHandler")
    private AjaxAuthenticationSuccessHandler ajaxAuthenticationSuccessHandler;

    @Autowired
    @Qualifier(value = "ajaxAuthenticationFailureHandler")
    private AjaxAuthenticationFailureHandler ajaxAuthenticationFailureHandler;

    //@Autowired
    //private UserDetailsService userDetailService;
    //@Value("${spring.profiles.active}")
//	private String env;
    @Autowired
    protected void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication().withUser("admin").password("123").roles("ADMIN");
        auth.inMemoryAuthentication().withUser("user").password("123").roles("USER");
        
       // auth.userDetailsService(userDetailService)
        //       .passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/about").permitAll()
                .antMatchers("/contact").permitAll()
                .antMatchers("/home/**").permitAll()
                .antMatchers("/expert/filter/**").permitAll()
                .antMatchers("/admin/**").hasRole("ADMIN")
                .antMatchers("/expert/detail/**").hasAnyRole("ADMIN","USER");                                
        http
                .formLogin()
                .loginPage("/login")
                .usernameParameter("username")
                .passwordParameter("password")
                .permitAll().failureHandler(ajaxAuthenticationFailureHandler)
                .successHandler(ajaxAuthenticationSuccessHandler);

        http.csrf().disable();
        http.exceptionHandling().accessDeniedPage("/access-denied");
        //if (!env.equals("dev"))
        //http.requiresChannel().anyRequest().requiresSecure();
    }

//    @Bean
//    public PasswordEncoder passwordEncoder() {
//        return new BCryptPasswordEncoder();
//    }
}
