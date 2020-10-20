package com.itheima.pojo;


import java.io.Serializable;
import java.util.Date;

public class Syslog implements Serializable {

    private String id;
    private Date visitTime;
    private String formatVisitTime;//格式化的访问时间
    private String visitTimestr; //注意 visitTimestr 设计数据库字段为visit_timestr Mapper才会识别
    private String username;
    private String ip;
    private String url;
    private String executionTime;
    private String method;
    private String consumerName;



    public String getConsumerName() {
        return consumerName;
    }
    public void setConsumerName(String consumerName) {
        this.consumerName = consumerName;
    }
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getVisitTime() {
        return visitTime;
    }

    public void setVisitTime(Date visitTime) {
        this.visitTime = visitTime;
    }

    public String getFormatVisitTime() {
        return formatVisitTime;
    }

    public void setFormatVisitTime(String formatVisitTime) {
        this.formatVisitTime = formatVisitTime;
    }

    public String getVisitTimestr() {
        return visitTimestr;
    }

    public void setVisitTimestr(String visitTimestr) {
        this.visitTimestr = visitTimestr;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getExecutionTime() {
        return executionTime;
    }

    public void setExecutionTime(String executionTime) {
        this.executionTime = executionTime;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }
}
