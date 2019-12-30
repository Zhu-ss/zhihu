import com.baizhi.App;
import com.baizhi.dao.PhotoDao;
import com.baizhi.entity.Photo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

/**
 * @ClassName Test_Photo
 * @Author
 * @Date 2019/11/29 23:09
 * @Version 1.0
 **/
@SpringBootTest(classes = App.class)
@RunWith(SpringRunner.class)
public class Test_Photo {
    @Autowired
    private PhotoDao photoDao;

    @Test
    public void test() {
        List<Photo> list = photoDao.queryPhoto("f5915ed4-4cde-4f3b-8154-577efae5e170");
        System.out.println(list);
    }
}
