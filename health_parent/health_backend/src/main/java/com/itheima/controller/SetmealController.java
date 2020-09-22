package com.itheima.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.itheima.constant.MessageConstant;
import com.itheima.constant.RedisConstant;
import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.entity.Result;
import com.itheima.pojo.Setmeal;
import com.itheima.service.SetmealService;
import com.itheima.utils.QiniuUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import redis.clients.jedis.JedisPool;

import java.io.IOException;
import java.util.UUID;

@RestController
@RequestMapping("/setmeal")
public class SetmealController {
    @Reference
    private SetmealService setmealService;
    //使用JedisPool操作Redis服务
    @Autowired
    private JedisPool jedisPool;
    @RequestMapping("upload")
    public Result upload(@RequestParam("imgFile") MultipartFile imgFile){
        String originalFilename = imgFile.getOriginalFilename();
        int index = originalFilename.lastIndexOf(".");
        String pn = originalFilename.substring(index - 1);//.jpg
        String fileName = UUID.randomUUID().toString()+pn;
        try {
            //将图片存入七牛云
            QiniuUtils.upload2Qiniu(imgFile.getBytes(),fileName);
            //将图片上传到七牛云的同时将图片名称存入Redis大集合中
            jedisPool.getResource().sadd(RedisConstant.SETMEAL_PIC_RESOURCES,fileName);
        } catch (IOException e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.PIC_UPLOAD_FAIL);
        }
        return new Result(true, MessageConstant.PIC_UPLOAD_SUCCESS,fileName);
    }
    //新增
    @RequestMapping("/add")
    public Result add(@RequestBody Setmeal setmeal, Integer[] checkgroupIds){
        try {
            setmealService.add(setmeal,checkgroupIds);
        }catch (Exception e){
            e.printStackTrace();
            return new Result(false, MessageConstant.ADD_SETMEAL_FAIL);
        }
        return new Result(true,MessageConstant.ADD_SETMEAL_SUCCESS);
    }
    //查询所有(分页查询)
    @RequestMapping("/findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean){
        return setmealService.findPage(queryPageBean);
    }
}
