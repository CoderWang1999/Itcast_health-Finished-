package com.itheima.pojo;

import java.io.Serializable;

/**
 * 饮食管理实体类
 */
public class Food implements Serializable {
    private Integer id;//主键 编号
    private String foodname;//名称
    private String kind;//种类
    private String size;//尺寸
    private String age;//年龄区间

    public Food() {
    }

    public Food(String foodname, String kind, String size, String age) {
        this.foodname = foodname;
        this.kind = kind;
        this.size = size;
        this.age = age;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFoodname() {
        return foodname;
    }

    public void setFoodname(String foodname) {
        this.foodname = foodname;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }
}
