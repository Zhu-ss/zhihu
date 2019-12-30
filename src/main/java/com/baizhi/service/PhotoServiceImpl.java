package com.baizhi.service;

import com.baizhi.dao.PhotoDao;
import com.baizhi.entity.Photo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.List;

/**
 * @ClassName PhotoServiceImpl
 * @Author
 * @Date 2019/11/29 21:16
 * @Version 1.0
 **/
@Service
@Transactional
public class PhotoServiceImpl implements PhotoService {
    @Autowired
    private PhotoDao photoDao;

    @Override
    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public Photo insertPhoto(Photo photo) {
        //获取到用户个人id，以及图片文件，将图片文件上传到数据库，成功-》返回对象
        boolean b = photoDao.insertPhoto(photo);
        if (b) {
            return photo;
        }
        return null;
    }

    @Override
    public List<Photo> queryPhoto(String uid) {
        List<Photo> list = photoDao.queryPhoto(uid);
        if (list != null) {
            return list;
        }
        return null;
    }

    @Override
    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public Integer updatePhoto(String pid) {
        //修改图片的下载数量,先取出数量,当该方法调用时,代表进行了一次 ,加一
        Photo photo = photoDao.selectPhoto(pid);
        boolean b = photoDao.updatePhotot(photo.getCount() + 1, pid);
        if (b) {
            return photo.getCount() + 1;
        }

        return null;
    }
}
