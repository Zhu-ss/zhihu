package com.baizhi;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

/**
 * @ClassName com.baizhi.App
 * @Author
 * @Date 2019/11/26 19:43
 * @Version 1.0
 **/
@SpringBootApplication
@MapperScan("com.baizhi.dao")
public class App  extends SpringBootServletInitializer {
    public static void main(String[] args) {
        SpringApplication.run(App.class);

    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(App.class);
    }
}
