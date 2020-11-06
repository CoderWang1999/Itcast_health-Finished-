package com.itheima.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.itheima.dao.AdviceDao;
import com.itheima.dao.FoodDao;
import com.itheima.dao.MemberDao;
import com.itheima.dao.SportDao;
import com.itheima.pojo.Food;
import com.itheima.pojo.Member;
import com.itheima.pojo.Order;
import com.itheima.pojo.Sport;
import com.itheima.service.AdviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

@Service(interfaceClass = AdviceService.class)
@Transactional
public class AdviceServiceImpl implements AdviceService {
    @Autowired
    private AdviceDao adviceDao;
    @Autowired
    private FoodDao foodDao;
    @Autowired
    private SportDao sportDao;
    @Autowired
    private MemberDao memberDao;

    //添加
    @Override  //tempOrderId:预约表中的id值 suggestion：健康师的建议
    public void add(Integer tempOrderId, String[] foodIds, String[] sportIds, String username, String suggestion) {
          String foodtemp = "";//定义一个food中间字符串接收 饮食的名称
          String sporttemp = "";//定义一个字符串接受 运动的id数组信息

        for (String foodId : foodIds) {
            Integer foodid = Integer.parseInt(foodId.substring(1));//获取food的id值（去掉数a1 中的a）
            Food food_name = foodDao.findById(foodid);//根据food的id值 获取到food
            String foodname = food_name.getFoodname();//获取food的名称属性
            foodtemp+=foodname+",";//苹果，葡萄，
        }
        String food = foodtemp.substring(0, foodtemp.length() - 1);//去掉最后一个逗号 //苹果，葡萄

        for (String sportId : sportIds) {
           Integer sportid = Integer.parseInt(sportId.substring(1));
            Sport sport_name = sportDao.findById(sportid);//根据sport的id值 获取到sport
            String sportname = sport_name.getSportname();//获取sport的名称属性
            sporttemp += sportname + ",";//跑步，跳绳，
        }
        String sport = sporttemp.substring(0, sporttemp.length() - 1);//跑步，跳绳

        Order order = new Order();
        order.setId(tempOrderId);
        order.setFood(food);
        order.setSport(sport);
        order.setHealthName(username);
        order.setSuggestion(suggestion);

        //把健康管理师 添加到会员表中
        memberDao.update(tempOrderId,username);//把管理师姓名添加到会员表中

        adviceDao.update(order);//把预约订单的id值 饮食 运动 健康管理师 建议 保存到Order表中

    }
}
