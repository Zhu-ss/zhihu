package com.baizhi.service;

import com.baizhi.dao.ArticleDao;
import com.baizhi.entity.Article;
import com.baizhi.entity.Commend;
import com.baizhi.entity.UA;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

/**
 * @ClassName ArticleServiceImpl
 * @Author
 * @Date 2019/11/26 23:11
 * @Version 1.0
 **/
@Service
@Transactional
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleDao articleDao;
    @Override
    @Transactional
    public List<Article> queryAllArticle() {
        List<Article> list = articleDao.queryAllArticle();
        if (list != null) {
            return list;
        }
        return null;
    }

    @Override
    @Transactional
    public List<Commend> queryAlls() {
        List<Article> list = articleDao.queryAllAs();
        if (list != null) {
            Article article = list.get(0);
            List<Commend> commends = article.getCommends();
            return commends;
        }
        return null;
    }

    @Override
    public List<Article> queryAll_Plus(String id) {
        List<Article> list = articleDao.queryArticle_plus(id);
        if (list != null) {
            return list;
        }
        return null;
    }

    @Override
    @Transactional
    public Article dz_count(Article article) {
        boolean b = articleDao.dz_count(article);
        if (b) {
            Article article1 = articleDao.selectArticle(article.getId());
            return article;
        }
        return null;
    }

    @Override
    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public Integer dz_com(Integer count, String cid) {
        boolean b = articleDao.dz_com(cid, count);
        if (b) {
            return count;
        }
        return null;
    }

    @Override
    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public boolean insertUser_pl(String id, String pl,String aid) {
        //添加用户评论的同时,将文章表中的评论数量加一
        Commend commend = new Commend().setId(UUID.randomUUID().toString()).setLevel("1").setA_id(aid).setDz_count(1).setU_id(id).setContent(pl);
        boolean b = articleDao.insertUser_pl(commend);
        Article article = articleDao.selectArticle(aid);
        boolean b1 = articleDao.updateArticle(article.getPl_count() + 1,aid);
        if (b && b1) {
            return b;
        }
        return false;
    }

    @Override
    @Transactional
    public String selectUa_status(String aid, String uid) {
        UA ua = articleDao.selectUa(aid, uid);
        if (ua == null) {
            return null;
        }
        return ua.getSc_status();
    }

    @Override
    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public UA updateUa(String aid, String uid) {
        UA ua = articleDao.selectUa(aid, uid);
        if (ua == null) {
            //为空代表用户点击了收藏,数据库没有记录,新增记录,收藏为是
            UA u = new UA().setId(UUID.randomUUID().toString()).setU_id(uid).setA_id(aid).setPl_status("1").setSc_status("已收藏");
            boolean b = articleDao.insertUA(u);
            if (b) {
                return u;
            }
        } else {
            //能取出数据,代表用户以前收藏过,但是当触发该方法时,将用户收藏状态取反保存
            if (ua.getSc_status().equals("未收藏")) {
                ua.setSc_status("已收藏");
                articleDao.updateUA(ua);
                return ua;
            }else{
                ua.setSc_status("未收藏");
                articleDao.updateUA(ua);
                return ua;
            }
        }
        return null;
    }
}
