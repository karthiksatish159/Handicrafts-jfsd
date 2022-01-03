package com.example.demo.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "example.com")
public class webConfig implements WebMvcConfigurer {

    // =======================================
    // =             Bean Config             =
    // =======================================


    @Bean
    public InternalResourceViewResolver getInternalResourceViewResolver(){
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/views/jsp/");
        resolver.setSuffix(".jsp");

        return resolver;
    }


    // =======================================
    // =          Override Methods           =
    // =======================================

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/img/**")
                .addResourceLocations("/views/img/");
        registry.addResourceHandler("/webfonts/**")
        .addResourceLocations("/views/webfonts/");

        registry.addResourceHandler("/css/**")
                .addResourceLocations("/views/css/");

        registry.addResourceHandler("/js/**")
                .addResourceLocations("/js/");
        registry.addResourceHandler("/php/**")
        .addResourceLocations("/views/php/");

    }
    
}
