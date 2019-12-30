package com.baizhi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

/**
 * @ClassName TestController
 * @Author
 * @Date 2019/11/27 22:41
 * @Version 1.0
 **/
@RequestMapping("/t")
@Controller
public class TestController {

    @RequestMapping("/t1")
    public String test1(MultipartFile file, HttpServletRequest request) throws IOException {
        //获取文件上传的数据,以及服务器真实路径
        String contentType = file.getContentType();
        String filename = file.getOriginalFilename();
        String realPath = request.getServletContext().getRealPath("/upload");
        System.out.println(filename+""+contentType+""+realPath);
        //将文件拷贝到服务器真实路径下
        file.transferTo(new File(realPath,filename));
        return "photo";
    }
}
