package com.itheima.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.itheima.constant.MessageConstant;
import com.itheima.entity.Result;
import com.itheima.pojo.Member;
import com.itheima.pojo.Setmeal;
import com.itheima.service.SetmealService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/setmeal")
public class SetMealController {
    @Reference
    private SetmealService setMealService;

    @RequestMapping("/getSetmeal")
    public Result getSetmeal() {
        try {
            List<Setmeal> setMealList = setMealService.findAll();
            return new Result(true, MessageConstant.GET_SETMEAL_LIST_SUCCESS,setMealList);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.GET_SETMEAL_LIST_FAIL);
        }
    }

    /**
     * 返回套餐详情和手机号用于回显
     * @param id 套餐id
     * @param request 用于获取存储在session中的member对象
     * @return
     */
    @RequestMapping("/findById")
    public Result findById(Integer id, HttpServletRequest request) {
        try {
            //获取套餐对象
            Setmeal setmeal = setMealService.findById(id);

            //获取存储在session中的member对象
            Member member = (Member) request.getSession().getAttribute("MemberMessage");

            //获取登录用户的电话号码
            String phoneNumber = member.getPhoneNumber();

            //把套餐对象和电话号码封装进map集合中
            HashMap dataMap = new HashMap();
            if (member.getName()!=null&&member.getName().length()>0) {
                dataMap.put("memberName", member.getName());
            }
            dataMap.put("setmeal", setmeal);
            dataMap.put("phoneNumber", phoneNumber);

            return new Result(true, MessageConstant.QUERY_SETMEAL_SUCCESS,dataMap);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.QUERY_SETMEAL_FAIL);
        }
    }
}
