package com.itheima.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.itheima.constant.MessageConstant;
import com.itheima.entity.Result;
import com.itheima.pojo.OrderSetting;
import com.itheima.service.OrderSettingService;
import com.itheima.utils.POIUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@RestController
@PreAuthorize("hasAuthority('ORDERSETTING')")//权限校验
@RequestMapping("/ordersetting")
public class OrderSettingController {
    @Reference
    private OrderSettingService orderSettingService;
    //上传Excel文件并将数据存入数据库
    @RequestMapping("upload")
    public Result upload(@RequestParam("excelFile")MultipartFile excelFile){
        try {
            //读取Excel文件
            List<String[]> sheet = POIUtils.readExcel(excelFile);
            List<OrderSetting> orderSettings=new ArrayList<>();
            for (String[] row : sheet) {
                //获取日期
                String data = row[0];
                //获取最大预约人数
                String number = row[1];
                System.out.println(data+"------"+number);
                //将日期和人数封装到OrderSetting对象中
                OrderSetting orderSetting = new OrderSetting(new Date(data), Integer.parseInt(number));
                //将对象存入集合
                orderSettings.add(orderSetting);
            }
            //调用服务层，将数据存入数据库
            orderSettingService.add(orderSettings);
            return new Result(true,MessageConstant.IMPORT_ORDERSETTING_SUCCESS);
        } catch (IOException e) {
            e.printStackTrace();
            return new Result(false,MessageConstant.IMPORT_ORDERSETTING_FAIL);
        }
    }
    //根据月份查询预约数据
    @RequestMapping("/getOrderSettingByMonth")
    public Result getOrderSettingByMonth(String date){
        try {
            List<Map> data=orderSettingService.getOrderSettingByMonth(date);
            return new Result(true,MessageConstant.GET_ORDERSETTING_SUCCESS,data);
        }catch (Exception e){
            e.printStackTrace();
            return new Result(false,MessageConstant.GET_ORDERSETTING_FAIL);
        }
    }
    //根据日期修改预约信息
    @RequestMapping("/editOrderSettingByDate")
    public Result editOrderSettingByDate(@RequestBody OrderSetting orderSetting){
        try {
            orderSettingService.editOrderSettingByDate(orderSetting);
            return new Result(true,MessageConstant.ORDERSETTING_SUCCESS);
        }catch (Exception e){
            e.printStackTrace();
            return new Result(false,MessageConstant.ORDERSETTING_FAIL);
        }
    }
}
