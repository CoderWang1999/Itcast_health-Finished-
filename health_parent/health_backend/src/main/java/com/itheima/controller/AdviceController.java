package com.itheima.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.itheima.entity.Result;
import com.itheima.pojo.Order;
import com.itheima.service.AdviceService;
import com.itheima.service.OrderService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 *  干预建议 后台管理
 *  目的：实现干预对会员 进行添加 饮食 、运动信息、健康信息、健康师 到预约表中
 */
@RestController
@RequestMapping("/advice")
public class AdviceController {
    @Reference
    private AdviceService adviceService;
    @Reference
    private OrderService orderService;

    /**
     * 保存健康建议信息
     * @param suggestion 建议页面中输入的建议信息
     * @param foodIds  建议页面中的饮食id数组
     * @param sportIds  运动id数组
     * @param orderId  预约表的id值
     * @return  返回添加成功或失败的消息
     */
    @RequestMapping("/add") //[a1,a2]  [b1,b2]
    public Result add(String suggestion, String[] foodIds, String[] sportIds, Integer orderId) {
        try {
            System.out.println(orderId);
            User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            //获取登录的用户名 进一步获取到用户的角色信息(管理师)
            if (user != null) {
                String username = user.getUsername();
                adviceService.add(orderId, foodIds, sportIds, username, suggestion);//添加数据
            }
            return new Result(true, "添加建议成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "添加建议失败");
        }
    }

    /**
     * 实现对健康干预信息的数据回显
     * @param id 预约订单的id值
     * @return 返回一个包含：建议 运动 饮食 健康管理的分装类
     */
    @RequestMapping("/findHealthMessageById")
    public Result findHealtMessageById(Integer id){
        try {
            Order order =orderService.findHealtMessageById(id);
            return new Result(true, "查询预约表成功", order);
        } catch (Exception e) {
            e.printStackTrace();
            return  new Result(false,"更新建议失败");
        }
    }
}
