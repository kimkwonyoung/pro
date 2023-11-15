package com.kosa.pro.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;


@Configuration
public class CommonConfig {
	
//	@Bean
//    public UrlBasedViewResolver viewResolver() {
//    	UrlBasedViewResolver tilesViewResolver = new UrlBasedViewResolver();
//    	tilesViewResolver.setViewClass(TilesView.class);
//    	tilesViewResolver.setOrder(0);
//    	return tilesViewResolver;
//    }
	//////ㅇㅇㅇㅇㅇㅇㅇㅇ아니 왜 안되냐고ㅇㅇ

//    @Bean
//    public TilesConfigurer tilesConfigurer() {
//        final TilesConfigurer configurer = new TilesConfigurer();
//
//        configurer.setDefinitions(new String[]{"classpath:/common/resource/tiles_main.xml"});
//        configurer.setCheckRefresh(true);
//        return configurer;
//    }
    
    
    @Bean
    public PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
        PropertySourcesPlaceholderConfigurer configurer = new PropertySourcesPlaceholderConfigurer();
        
        Resource[] resources = new Resource[] {
            new ClassPathResource("common/properties/globals.properties"),
            new ClassPathResource("common/properties/message-common.properties")
        };
        
        configurer.setLocations(resources);
        return configurer;
    }
    
    @Bean
    public CorsFilter corsFilter() {
       UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
       CorsConfiguration config = new CorsConfiguration();
       config.setAllowCredentials(true);
       config.addAllowedOrigin("*"); // e.g. http://domain1.com
       config.addAllowedHeader("*");
       config.addAllowedMethod("*");

       source.registerCorsConfiguration("/api/**", config);
       return new CorsFilter(source);
    }
    
//    @Bean
//    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
//        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
//        sessionFactory.setDataSource(dataSource); // DataSource를 주입합니다.
//        sessionFactory.setConfigLocation(new PathMatchingResourcePatternResolver().getResource("classpath:/common/resource/modelConfig.xml"));
//        sessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:/common/mappers/*.xml"));
//        return sessionFactory.getObject();
//    }
//
//    @Bean
//    public SqlSessionTemplate sqlSession(SqlSessionFactory sqlSessionFactory) {
//        return new SqlSessionTemplate(sqlSessionFactory);
//    }
}
