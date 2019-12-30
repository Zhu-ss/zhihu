package com.baizhi.controller;

import com.baizhi.entity.Photo;
import com.baizhi.entity.User;
import com.baizhi.service.PhotoService;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

/**
 * @ClassName imgUpload
 * @Author
 * @Date 2019/11/29 21:06
 * @Version 1.0
 **/
@RequestMapping("/upload")
@Controller
public class imgUpload {
    @Autowired
    private PhotoService photoService;

    @RequestMapping("/query")
    public String list_img(HttpSession session, Model model) {
        User login = (User) session.getAttribute("login");
        List<Photo> list = photoService.queryPhoto(login.getId());
        model.addAttribute("list",list);
        return "photo";
    }
    //图片的上传
    @RequestMapping("/img_up")
    @ResponseBody
    public Photo img_upload(MultipartFile img, String uid, HttpServletRequest request) throws IOException {
        String imgName = img.getOriginalFilename();
        String realPath = request.getServletContext().getRealPath("upload");

        //将文件拷贝到数据库,获取项目名+文件名,保存到对象返回
        String contextPath = request.getContextPath();
        HttpSession session = request.getSession();
        User login = (User) session.getAttribute("login");
        img.transferTo(new File(realPath,imgName));
        System.out.println(realPath+"/"+imgName);
        Photo photo = new Photo(UUID.randomUUID().toString(), contextPath + "/upload/" + imgName, 0, login.getId());
        System.out.println(photo);
        Photo photo1 = photoService.insertPhoto(photo);
        return photo1;
    }
    @ResponseBody
    @RequestMapping("/img_dow")
    public Integer  dowload_img(String img_name,String pid, HttpServletRequest request, HttpServletResponse response) throws Exception {
        //获取服务器真实路径,在路径中寻找img_name文件,进行响应
        System.out.println(img_name);
        String realPath = request.getServletContext().getRealPath("/upload");
        String[] split = img_name.split("/");
        String s = split[3];
        System.out.println(realPath+"/"+s+"  "+pid);
        //当该图片被下载时,将下载次数记录
        Integer count = photoService.updatePhoto(pid);
        //使用流读取到文件
        FileInputStream is = new FileInputStream(new File(realPath,s));
        //获得响应输出流
        ServletOutputStream out = response.getOutputStream();
        //设置响应头
        response.setHeader("content-disposition", "attachment;fileName=" + URLEncoder.encode(s, "UTF-8"));
        IOUtils.copy(is, out);
        return count;
    }
}
