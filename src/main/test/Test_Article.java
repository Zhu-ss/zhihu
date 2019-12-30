import com.baizhi.App;
import com.baizhi.dao.ArticleDao;
import com.baizhi.entity.Article;
import com.baizhi.entity.Commend;
import com.baizhi.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

/**
 * @ClassName Test_Article
 * @Author
 * @Date 2019/11/26 23:00
 * @Version 1.0
 **/
@SpringBootTest(classes = App.class)
@RunWith(SpringRunner.class)
public class Test_Article {
    @Autowired
    ArticleDao articleDao;

    @Test
    public void test_query() {
        List<Article> articles = articleDao.queryAllArticle();
        for (Article a : articles) {
            System.out.println(a);
        }
//        System.out.println(articles);
    }

    @Test
    public void test2() {
        List<Article> list = articleDao.queryAllAs();
        Article article = list.get(0);
        List<Commend> commends = article.getCommends();
        for (Commend c : commends) {
            System.out.println(c);
        }

    }

    @Test
    public void test_pl() {
        Commend asdasd = new Commend().setId("999").setA_id("201").setContent("asdasd").setU_id("104").setLevel("2").setDz_count(2);
        System.out.println(asdasd);
        boolean b = articleDao.insertUser_pl(asdasd);
        System.out.println(b);
    }

    @Test
    public void test_all() {
        List<Article> list = articleDao.queryArticle_plus("201");
        Article article = list.get(0);
        List<Commend> commends = article.getCommends();
        for (Commend c : commends) {
            System.out.println(c);
        }
    }
}
