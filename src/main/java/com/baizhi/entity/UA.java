package com.baizhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * @ClassName UA
 * @Author
 * @Date 2019/11/26 19:26
 * @Version 1.0
 **/
@NoArgsConstructor
@AllArgsConstructor
@Data
@Accessors(chain = true)
public class UA implements Serializable {
    /**
        中间表 用户《==》文章表
     */
    private String id;
    private String u_id;
    private String a_id;
    private String sc_status;
    private String pl_status;
}
