package com.example.sweater.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfig implements WebMvcConfigurer {
    // Берёт значение из параметров и подставляет в переменную
    @Value("${upload.path}")
    private String uploadPath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Раздача изображений
        registry.addResourceHandler("/img/**")
                // В виндоус используется 3 слэша
                // filepath - поиск во всей файловой системе по указанному пути
                .addResourceLocations("file:///" + uploadPath + "/");
        // Раздача статичекого контента
        // classpath - поиск от корня проекта
        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static");
    }

    public void addViewControllers(ViewControllerRegistry registry) {
        //Перенаправление дял того, чтобы получать фалы
        registry.addViewController("/login").setViewName("login");
    }

}