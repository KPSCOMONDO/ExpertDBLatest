package org.expert.database.configuration;

import org.springframework.boot.autoconfigure.web.WebMvcAutoConfiguration;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;

@Configuration
public class ViewConfiguration extends WebMvcAutoConfiguration.WebMvcAutoConfigurationAdapter{

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        
        registry.addViewController("/home").setViewName("/fronts/homes/home");
        registry.addViewController("/").setViewName("/fronts/homes/home");
        registry.addViewController("/logout").setViewName("/fronts/homes/home");
        
        registry.addViewController("/expert/filter").setViewName("/fronts/experts/filter");          
        registry.addViewController("/expert/detail").setViewName("/fronts/experts/details/detail");        
        
        registry.addViewController("/login").setViewName("/fronts/authentications/login");
        registry.addViewController("/sigin").setViewName("/fronts/authentications/sigin");
                
        registry.addViewController("/about").setViewName("/fronts/utility/about");
        registry.addViewController("/contact").setViewName("/fronts/utility/contact");
    }
    
    
}
