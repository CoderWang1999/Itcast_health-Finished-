package com.itheima.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.service.Intervention_controlService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 干预控制台
 */
@RestController
@RequestMapping("/intervention_control")
public class Intervention_control {
    @Reference
    private Intervention_controlService intervention_controlService;

    /**
     * 分页查询
     * @param queryPageBean  前端的数据信息
     * @return  返回查询结果 和分页的数据
     */
    @RequestMapping("/findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return  intervention_controlService.findPage(queryPageBean);
    }
}
