package com.itheima.controller;


import com.alibaba.dubbo.config.annotation.Reference;
import com.itheima.constant.MessageConstant;
import com.itheima.constant.RedisConstant;
import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.entity.Result;
import com.itheima.pojo.Address;
import com.itheima.service.AddressService;
import com.itheima.utils.QiniuUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/address")
public class AddressController {

    @Reference
    private AddressService addressService;
    @Autowired
    private JedisPool jedisPool;

    //文件上传
    @RequestMapping("/upload")
    public Result upload(@RequestParam("imgFile") MultipartFile imgFile) {
        //获取图片上传原始文件名称
        String originalFilename = imgFile.getOriginalFilename();
        //读取文件后缀名称
        String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
        //使用UUID创建随机不重复的文件名称加上后缀名称存入数据库
        String imgName = UUID.randomUUID().toString() + extension;

        Jedis resource = null;
        try {
            resource = jedisPool.getResource();
            QiniuUtils.upload2Qiniu(imgFile.getBytes(), imgName);
            //图片上传成功后保存图片名称存入redis,基于redis的set集合存储
            resource.sadd(RedisConstant.ADDRESS_PIC_RESOURCES, imgName);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.PIC_UPLOAD_FAIL);
        } finally {
            //释放资源
            if (resource != null) {
                resource.close();
            }
        }
        return new Result(true, MessageConstant.PIC_UPLOAD_SUCCESS, imgName);
    }

    //分页查询所有机构信息
    @RequestMapping("/findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {

        return addressService.findPage(queryPageBean);
    }

    //查询所有体检机构信息
    @RequestMapping("/findAll")
    public Result findAll(){
        try {
            List<Address> addressList = addressService.findAll();
            return new Result(true, MessageConstant.QUERY_ADDRESS_LIST_SUCCESS,addressList);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.QUERY_ADDRESS_LIST_FAIL);
        }
    }

    //添加体检机构功能
    @RequestMapping("/add")
    public Result add(@RequestBody Address address) {
        try {
            addressService.add(address);
            return new Result(true, MessageConstant.ADD_ADDRESS_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.ADD_ADDRESS_FAIL);
        }
    }

    //删除体检机构功能
    @RequestMapping("/delete")
    public Result delete(Integer id) {
        try {
            //判断中间关联表   t_order_address  中是否存在该机构编号的引用
            long num = addressService.findByAddressId(id);
            if (num > 0) {
                return new Result(false, MessageConstant.DELETE_ADDRESS_AND_FAIL);
            } else {
                addressService.delete(id);
                return new Result(true, MessageConstant.DELETE_ADDRESS_SUCCESS);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.DELETE_ADDRESS_FAIL);
        }
    }


    //根据机构id查询信息进行回显
    @RequestMapping("/findUpdate")
    public Result findUpdate(Integer id) {
        try {
            Address address = addressService.findUpdate(id);
            return new Result(true, MessageConstant.GET_ADDRESS_SUCCESS,address);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.GET_ADDRESS_FAIL);
        }
    }


    //修改机构功能
    @RequestMapping("/edit")
    public Result edit(@RequestBody Address address) {
        try {
            addressService.edit(address);
            return new Result(true, MessageConstant.EDIT_ADDRESS_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.EDIT_ADDRESS_FAIL);
        }
    }
}
