package com.itheima.entity;

import java.util.Date;

public class Conditions extends QueryPageBean {
    private Date[] queryDate;
    private String queryOrderType;
    private String queryOrderStatus;

    public Date[] getQueryDate() {
        return queryDate;
    }

    public void setQueryDate(Date[] queryDate) {
        this.queryDate = queryDate;
    }

    public String getQueryOrderType() {
        return queryOrderType;
    }

    public void setQueryOrderType(String queryOrderType) {
        this.queryOrderType = queryOrderType;
    }

    public String getQueryOrderStatus() {
        return queryOrderStatus;
    }

    public void setQueryOrderStatus(String queryOrderStatus) {
        this.queryOrderStatus = queryOrderStatus;
    }
}
