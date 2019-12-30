package com.baizhi.controller;

import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * @ClassName UserController
 * @Author
 * @Date 2019/11/26 20:26
 * @Version 1.0
 **/
@Controller
@RequestMapping("/user")
@SessionAttributes({"login",})
public class UserController {
    @Autowired
    private UserService userService;
    private Logger log= LoggerFactory.getLogger(UserController.class);

    @RequestMapping("/login")
    @ResponseBody
    public User login(Model model,User user) {
        log.warn("进Controller："+user);
        User login = userService.login(user);
        if (login != null) {
            model.addAttribute("login",login);
            return login;
        }
        model.addAttribute("message","错误");
        return login;
    }

    @RequestMapping("/regist")
    public String regist(User user, Model model, MultipartFile imgfile, HttpServletRequest request) throws IOException {
        //获取文件上传的数据,以及服务器真实路径
        String filename = imgfile.getOriginalFilename();
        String realPath = request.getServletContext().getRealPath("/upload");
        //将文件拷贝到服务器真实路径下
        imgfile.transferTo(new File(realPath,filename));
        String realPath1 = request.getServletContext().getContextPath();
        user.setId(UUID.randomUUID().toString()).setStatus("激活").setIcon(realPath1+"/upload/"+filename);
        System.out.println(filename+""+realPath+realPath1+"/upload");
        System.out.println(user);
        try {
            boolean b = userService.regist(user);
            if (b) {
                return "redirect:/article/query";
            }
        } catch (Exception e) {

        }
        model.addAttribute("message","注册错误");
        return "login";
    }
}
