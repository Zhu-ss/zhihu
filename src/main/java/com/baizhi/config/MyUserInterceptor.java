package com.baizhi.config;

import com.baizhi.inter.UserInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * @ClassName MyUserInterceptor
 * @Author
 * @Date 2019/11/28 13:57
 * @Version 1.0
 **/
@Configuration
public class MyUserInterceptor extends WebMvcConfigurerAdapter {

    @Autowired
    private UserInter userInter;

    //注册自定义拦截器,使之生效,可以配置多个自定义拦截器
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        InterceptorRegistration ir = registry.addInterceptor(userInter);

        //配置拦截器拦截路径
        ir.addPathPatterns("/article/*");
        ir.addPathPatterns("/upload/*");

        //拦截器排除路径
        ir.excludePathPatterns("/user/login");
        ir.excludePathPatterns("/article/error");
    }
}
