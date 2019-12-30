package com.baizhi.dao;

import com.baizhi.entity.Article;
import com.baizhi.entity.Commend;
import com.baizhi.entity.UA;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleDao {
    /**
     * @return 文章推荐信息,精选两条
     */
    List<Article> queryAllArticle();

    /**
     * @return 文章推荐信息,所有评论
     */
    List<Article> queryAllAs();

    /**
     * @return 所有
     */
    List<Article> queryArticle_plus(String id);

    /**
     * @param article
     * @return 文章点赞数量
     */
    boolean dz_count(Article article);

    /**
     * @param cid
     * @return 根据id改用户评论数量
     */
    boolean dz_com(@Param("cid") String cid,@Param("count") Integer count);

    /**
     * @param id
     * @return 根据id查出该对象
     */
    Article selectArticle(String id);

    /**
     *
     * @param commend
     * @return 评论
     */
    boolean insertUser_pl(Commend commend);

    boolean updateArticle(@Param("count") Integer count,@Param("aid") String aid);

    /**
     * @param aid
     * @param uid
     * @return 查出该用户收藏状态
     */
    UA selectUa(@Param("aid")String aid,@Param("uid")String uid);

    /**
     * @param ua
     * @return 修改该用户的收藏状态
     */
    boolean updateUA(UA ua);

    /**
     * @param ua
     * @return 添加一个用户的收藏状态
     */
    boolean insertUA(UA ua);
}
