package com.itheima.service;

import java.util.List;
import java.util.Map;

public interface ReportService {


    Map<String, Object> getBusinessReportData() throws Exception;

    List<Integer> findOrderByMonth(List<String> yearAndMonth) throws Exception;

    List<Map> findSetmealMoney();

    Map<String, Object> getMemberAgeReport();

    List<Integer> findArriveByMonth(List<String> yearAndMonth) throws Exception;

    //List<Map> findPersonCount();
}
