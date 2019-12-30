import com.baizhi.App;
import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import com.mysql.jdbc.Driver;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * @ClassName Test_User
 * @Author
 * @Date 2019/11/26 19:38
 * @Version 1.0
 **/
@SpringBootTest(classes = App.class)//指定启动类
@RunWith(SpringRunner.class)//相当于SpringJunit测试
public class Test_User {
    @Autowired
    UserDao userDao;
    @Test
    public void test1() {
        User qq1 = new User().setEmail("qq@qq.com").setPassword("qq");
        System.out.println(userDao);
        User qq = userDao.login(qq1);
        System.out.println(qq);
    }

    @Test
    public void test() {
        Logger log= LoggerFactory.getLogger(Test_User.class);
        log.debug("rizhi");
        log.info("rizhi");
        log.warn("rizhi");
        log.error("rizhi");
    }

    @Test
    public void Conn() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test",
                "root","863");
        System.out.println(connection);
    }
}
