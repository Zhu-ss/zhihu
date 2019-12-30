package com.baizhi.config;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @ClassName MyException
 * @Author
 * @Date 2019/11/28 14:16
 * @Version 1.0
 **/
@ControllerAdvice //异常注解
public class MyException {

    @ResponseBody
    @ExceptionHandler(value = Exception.class)
    public String exception(Exception e) {
        e.printStackTrace();
        e.getMessage();
        System.out.println(e);
        return "出现异常";
    }
}
