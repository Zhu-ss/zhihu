package com.baizhi.dao;

import com.baizhi.entity.Photo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PhotoDao {
    boolean insertPhoto(Photo photo);

    List<Photo> queryPhoto(String uid);

    Photo selectPhoto(String pid);
    boolean updatePhotot(@Param("count") Integer count,@Param("pid") String pid);

}
