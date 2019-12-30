package com.baizhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
 * @ClassName Article
 * @Author
 * @Date 2019/11/26 19:20
 * @Version 1.0
 **/
@NoArgsConstructor
@AllArgsConstructor
@Data
@Accessors(chain = true)
public class Article implements Serializable {
    private String id;
    private String title;
    private String message;
    private Integer pl_count;
    private Integer sc_count;
    private Integer dz_count;
    List<UA> uas;
    List<User> users;
    List<Commend> commends;
}
