package com.itheima.service;

import java.util.Map;

public interface BusinessReportService {
    //运营数据统计
    Map<String, Object> getBusinessReportData() throws Exception;
}
