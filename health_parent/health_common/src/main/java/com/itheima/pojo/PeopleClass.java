package com.itheima.pojo;

/**
 * 人群分类对应的实体类
 */
public class PeopleClass {
    private String fileName;//档案号
    private String name;//会员姓名
    private String sex;//性别

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }
}
