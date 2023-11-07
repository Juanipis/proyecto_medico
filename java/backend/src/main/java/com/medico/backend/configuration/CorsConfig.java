package com.medico.backend.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class CorsConfig {

    @Bean
    public WebMvcConfigurer corsConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/**") // Aquí definimos el patrón de URL para el cual se aplicará CORS. `/**`
                                           // indica que se aplica a todas las rutas.
                        .allowedOrigins("*") // Con `*` indicamos que aceptamos cualquier origen.
                        .allowedMethods("*") // Aquí indicamos que permitimos todos los métodos HTTP (GET, POST, etc.).
                        .allowedHeaders("*"); // Permite todas las cabeceras.
            }
        };
    }
}
