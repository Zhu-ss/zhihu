package com.baizhi.service;


import com.baizhi.entity.Article;
import com.baizhi.entity.Commend;
import com.baizhi.entity.UA;

import java.util.List;

public interface ArticleService {
    /**
     * @return 精选信息两条
     */
    List<Article> queryAllArticle();

    /**
     * @return 文章的所有评论
     */
    List<Commend> queryAlls();

    List<Article> queryAll_Plus(String id);

    /**
     * @param article
     * @return 文章点赞数量
     */
    Article dz_count(Article article);

    Integer dz_com(Integer count,String cid);
    boolean insertUser_pl(String id, String pl,String aid);

    /**
     * @param aid
     * @param uid
     * @return 单纯取出状态
     */
    String selectUa_status(String aid,String uid);
    /**
     *
     * @param aid
     * @param uid
     * @return 取出用户收藏状态,同时修改
     */
    UA updateUa(String aid, String uid);

}
