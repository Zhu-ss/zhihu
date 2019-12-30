package com.baizhi.controller;

import com.baizhi.entity.Article;
import com.baizhi.entity.Commend;
import com.baizhi.entity.UA;
import com.baizhi.entity.User;
import com.baizhi.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @ClassName ArticleController
 * @Author
 * @Date 2019/11/26 23:09
 * @Version 1.0
 **/
@RequestMapping("/article")
@SessionAttributes({"article"})
@Controller
public class ArticleController {
    @Autowired
    private ArticleService articleService;

    //查出推荐信息
    @RequestMapping("/query")
    public String query(Model model, HttpSession session) {
        List<Article> list = articleService.queryAllArticle();
        Article article = list.get(0);
        //session作用域
        model.addAttribute("article",article);
        //精选信息两条
        model.addAttribute("list",list);
        //所有信息,除了精选
        List<Commend> users = articleService.queryAlls();
        model.addAttribute("users",users);
        return "forward:/main.jsp";

    }

    //用户评论
    @RequestMapping("/pl_user")
    public String pl_user(String pl,String id,String aid) {
        //将用户的评论存储进数据库
        System.out.println(pl+" "+id+""+aid);
        articleService.insertUser_pl(id,pl,aid);
        return "redirect:/article/query";
    }

    //点赞
    @RequestMapping("/dz_a")
    @ResponseBody
    public Integer dz_article(Integer count,Article article,Boolean dz) {
        if (dz) {
            count++;
            article.setDz_count(count);
            Article at = articleService.dz_count(article);
        } else {
            count--;
            article.setDz_count(count);
            Article at = articleService.dz_count(article);
        }
        return article.getDz_count();
    }
    @RequestMapping("/dz_c")
    @ResponseBody
    public Integer dz_commend(Integer count,String cid) {
        System.out.println(count+" "+cid);
        Integer num = articleService.dz_com(count + 1, cid);
        System.out.println(num);
        return num;
    }

    //详细评论
    @RequestMapping("/queryAll")
    public String queryAllArticle(Model model,String id) {
        if (id == null) {
            return "login";
        }
        List<Article> list = articleService.queryAll_Plus(id);
        model.addAttribute("list", list);
        return "commend";
    }

    @RequestMapping("/sc_ua_init")
    @ResponseBody
    public UA sc_us_init(String aid,String uid) {
        System.out.println("收藏状态初始化"+aid+uid);
        String s = articleService.selectUa_status(aid, uid);
        if (s == null) {
            return new UA().setSc_status("未收藏");
        }
        return new UA().setSc_status(s);
    }
    //收藏
    @ResponseBody
    @RequestMapping("/sc_ua")
    public UA sc_ua(String aid,String uid) {
        UA ua = articleService.updateUa(aid, uid);
        System.out.println(ua.getSc_status());
        return ua;
    }

    @RequestMapping("/error")
    public String err() {
        System.out.println("异常触发");
        String s=null;
        s.length();
        return null;
    }

}
