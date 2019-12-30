package com.baizhi.service;

import com.baizhi.dao.PhotoDao;
import com.baizhi.entity.Photo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.List;

@Service
@Transactional
public interface PhotoService {
    /**
     * @param photo
     * @return 文件上传记录
     */
    Photo insertPhoto(Photo photo);

    /**
     *
     * @param uid
     * @return 查出该表中该用户所有的上传图片
     */
    List<Photo> queryPhoto(String uid);

    /**
     * @param pid
     * @return 修改图片下载的次数
     */
    Integer updatePhoto(String pid);


}
