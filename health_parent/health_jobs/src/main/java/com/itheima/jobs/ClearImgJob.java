package com.itheima.jobs;

import com.itheima.constant.RedisConstant;
import com.itheima.utils.QiniuUtils;
import org.springframework.beans.factory.annotation.Autowired;
import redis.clients.jedis.JedisPool;

import java.util.Set;

public class ClearImgJob {
    @Autowired
    private JedisPool jedisPool;
    //定时清理垃圾图片
    public void clearImg(){
        //获取垃圾图片名称
        Set<String> set = jedisPool.getResource().sdiff(RedisConstant.SETMEAL_PIC_RESOURCES, RedisConstant.SETMEAL_PIC_DB_RESOURCES);
        if (set!=null){
            for (String picName : set) {
                //删除垃圾照片
                QiniuUtils.deleteFileFromQiniu(picName);
                //清理Redis中的垃圾图片名称
                jedisPool.getResource().srem(RedisConstant.SETMEAL_PIC_RESOURCES,picName);
                System.out.println("清理垃圾图片成功。。。。");
            }
        }
    }
}
