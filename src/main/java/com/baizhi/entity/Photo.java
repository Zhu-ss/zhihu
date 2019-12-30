package com.baizhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * @ClassName Photo
 * @Author
 * @Date 2019/11/29 20:00
 * @Version 1.0
 **/
@NoArgsConstructor
@AllArgsConstructor
@Data
@Accessors(chain = true)
public class Photo  implements Serializable {
    private String id;
    private String photo;
    private Integer count;
    private String u_id;

}
