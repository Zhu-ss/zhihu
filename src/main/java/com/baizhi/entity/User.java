package com.baizhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

/**
 * @ClassName User
 * @Author
 * @Date 2019/11/26 19:16
 * @Version 1.0
 **/
@NoArgsConstructor
@AllArgsConstructor
@Data
@Accessors(chain = true)//可以使用链表形式
public class User  implements Serializable {
    private String id;
    private String realname;
    private String tel;
    private String email;
    private String password;
    private String icon;
    private String status;
    List<UA> uas;//中间表
    List<Article> articles;//文章表
    Commend commends;//评论表
//    Photo photo;//照片表


}
