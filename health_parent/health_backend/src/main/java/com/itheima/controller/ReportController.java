package com.itheima.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.itheima.constant.MessageConstant;
import com.itheima.entity.Result;
import com.itheima.service.MemberService;
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
    //会员数量折线图数据
    @RequestMapping("/getMemberReport")
    public Result getMemberReport() {
        try {
            Map<String, List> map=new HashMap<>();
            //用于存储月份的集合
            List<String> months=new ArrayList<>();
            //获取日历对象,假设时间是现在
            Calendar calendar = Calendar.getInstance();
            //计算过去一年的十二个月
            calendar.add(Calendar.MONTH,-12);
            for (int i = 0; i < 12; i++) {
                //获取当前时间往后退一个月
                calendar.add(Calendar.MONTH,1);
                Date date = calendar.getTime();
                months.add(new SimpleDateFormat("yyyy.MM").format(date));
            }
            map.put("months",months);
            //用于存储会员数量的集合
            List<Integer> memberCount = memberService.findMemberCountByMonths(months);
            map.put("memberCount",memberCount);
            return new Result(true,MessageConstant.GET_MEMBER_NUMBER_REPORT_SUCCESS,map);
        }catch (Exception e){
            e.printStackTrace();
            return new Result(false,MessageConstant.GET_MEMBER_NUMBER_REPORT_FAIL);
        }
    }
}
