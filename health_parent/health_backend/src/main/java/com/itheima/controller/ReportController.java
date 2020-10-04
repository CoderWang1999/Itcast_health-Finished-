package com.itheima.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.itheima.constant.MessageConstant;
import com.itheima.entity.Result;
import com.itheima.service.MemberService;
import com.itheima.service.SetmealService;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping("/report")
public class ReportController {
    @Reference
    private MemberService memberService;
    @Reference
    private SetmealService setmealService;

    //会员数量折线图
    @RequestMapping("/getMemberReport")
    public Result getMemberReport() {
        try {
            Map<String, List> map = new HashMap<>();
            //用于存储月份的集合
            List<String> months = new ArrayList<>();
            //获取日历对象,假设时间是现在
            Calendar calendar = Calendar.getInstance();
            //计算过去一年的十二个月
            calendar.add(Calendar.MONTH, -12);
            for (int i = 0; i < 12; i++) {
                //获取当前时间往后退一个月
                calendar.add(Calendar.MONTH, 1);
                Date date = calendar.getTime();
                months.add(new SimpleDateFormat("yyyy.MM").format(date));
            }
            map.put("months", months);
            //用于存储会员数量的集合
            List<Integer> memberCount = memberService.findMemberCountByMonths(months);
            map.put("memberCount", memberCount);
            return new Result(true, MessageConstant.GET_MEMBER_NUMBER_REPORT_SUCCESS, map);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.GET_MEMBER_NUMBER_REPORT_FAIL);
        }
    }

    //套餐预约占比饼形图
    @RequestMapping("/getSetmealReport")
    public Result getSetmealReport() {
        try {
            //使用模拟数据测试使用什么样的java对象转为饼形图所需的json数据格式
            Map<String, Object> data = new HashMap<>();
            List<Map<String,Object>> setmealCount=setmealService.findSetmealCount();
            data.put("setmealCount",setmealCount);
            List<String> setmealNames=new ArrayList<>();
            for (Map<String, Object> map : setmealCount) {
                //获取套餐名称
                String name= (String) map.get("name");
                setmealNames.add(name);
            }
            data.put("setmealNames",setmealNames);
            return new Result(true,MessageConstant.GET_SETMEAL_COUNT_REPORT_SUCCESS,data);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.GET_SETMEAL_COUNT_REPORT_FAIL);
        }
    }
}
