package com.baizhi.inter;

import com.baizhi.entity.User;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @ClassName UserInter
 * @Author
 * @Date 2019/11/28 13:53
 * @Version 1.0
 **/
@Configuration //将拦截器对象交由Springboot容器管理
public class UserInter implements HandlerInterceptor {
    //主要方法,处理请求,进行判断是否允许跳转
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        HttpSession session = request.getSession();
        User login = (User) session.getAttribute("login");

        if (login == null) {
            //拦截条件成功,重定向跳转
            System.out.println("拦截器false");
            response.sendRedirect(request.getContextPath()+"/login.jsp");
            return false;
        }
        System.out.println("拦截器true");
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
