package com.itheima.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.itheima.constant.RedisConstant;
import com.itheima.dao.SetmealDao;
import com.itheima.pojo.Setmeal;
import com.itheima.service.SetmealService;
import org.springframework.beans.factory.annotation.Autowired;
import redis.clients.jedis.JedisPool;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SetmealServiceImpl implements SetmealService {
    @Autowired
    private SetmealDao setmealDao;
    //注入JedisPool
    @Autowired
    private JedisPool jedisPool;
    //新增
    @Override
    public void add(Setmeal setmeal, Integer[] checkgroupIds) {
        //新增套餐
        setmealDao.addSetmeal(setmeal);
        //获取SetmealId
        Integer setmealId = setmeal.getId();
        //调用新增关联关系方法
        this.setSetmealIdAndCheckGroupId(setmealId,checkgroupIds);
        //获取图片名称
        String fileName = setmeal.getImg();
        //新建套餐成功之后将图片名称存入Redis小集合中
        jedisPool.getResource().sadd(RedisConstant.SETMEAL_PIC_DB_RESOURCES,fileName);
    }

    //抽取的新增关联关系的方法
    public void setSetmealIdAndCheckGroupId(Integer setmealId, Integer[] checkgroupIds){
        //判断检查项ids数组是否为空
        if (checkgroupIds!=null&&checkgroupIds.length>0){
            //不为空则遍历数组，用map存储CheckItemId和CheckGroupId
            for (Integer checkgroupId : checkgroupIds) {
                Map map=new HashMap<>();
                map.put("setmealId",setmealId);
                map.put("checkgroupId",checkgroupId);
                //新增关联关系
                setmealDao.setSetmealIdAndCheckGroupId(map);
            }
        }
    }
}
