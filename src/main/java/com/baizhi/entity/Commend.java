package com.baizhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
 * @ClassName Commend
 * @Author
 * @Date 2019/11/26 19:22
 * @Version 1.0
 **/
@NoArgsConstructor
@AllArgsConstructor
@Data
@Accessors(chain = true)
public class Commend implements Serializable {
    private String id;
    private String content;
    //文章id
    private String a_id;
    private String level;
    private String u_id;
    private Integer dz_count;
    User c_users;


}
