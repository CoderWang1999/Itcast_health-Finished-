package com.itheima.pojo;

import java.io.Serializable;

/**
 * 运动管理实体类
 */
public class Sport implements Serializable {
    private Integer id;//主键
    private String helpCode;//助记码
    private String sportname;//运动名称
    private String number;//运动次数
    private String sporttime;//运动时间

    public Sport() {
    }

    public Sport(String helpCode, String sportname, String number, String sporttime) {
        this.helpCode = helpCode;
        this.sportname = sportname;
        this.number = number;
        this.sporttime = sporttime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHelpCode() {
        return helpCode;
    }

    public void setHelpCode(String helpCode) {
        this.helpCode = helpCode;
    }

    public String getSportname() {
        return sportname;
    }

    public void setSportname(String sportname) {
        this.sportname = sportname;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getSporttime() {
        return sporttime;
    }

    public void setSporttime(String sporttime) {
        this.sporttime = sporttime;
    }
}
