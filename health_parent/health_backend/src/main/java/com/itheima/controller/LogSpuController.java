package com.itheima.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.entity.Result;
import com.itheima.service.ISysLogService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.ParseException;


@RestController
@RequestMapping("/spuLog")
public class LogSpuController {
    @Reference
    private ISysLogService spuService;
    @RequestMapping("/findAll")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) throws ParseException {
        return spuService.findAll(queryPageBean);
    }

    @RequestMapping("/deleteById")
    public Result deleteById(String id){
        try {
            spuService.deleteById(id);
            return new Result(true,"删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false,"删除失败");

        }
    }
    @RequestMapping("/deleteByIds")
    public Result deleteByIds(@RequestBody String[] list){
        try {
            spuService.deleteByIds(list);
            return new Result(true,"批量删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false,"批量删除失败");

        }
    }
}
