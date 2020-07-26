/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.william.devdojo.configuration;

import br.com.william.devdojo.filter.Interceptador;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 *
 * @author John William Vicente <johnwill.v.2017@gmail.com>
 */
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    
//    Apenas criei essa classe com o intuito de adicionar um interceptador no sistema 
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        WebMvcConfigurer.super.addInterceptors(registry); //To change body of generated methods, choose Tools | Templates.
        registry.addInterceptor(new Interceptador());
    }
    
}
