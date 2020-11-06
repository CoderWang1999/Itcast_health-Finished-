package com.itheima.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.itheima.constant.MessageConstant;
import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.entity.Result;
import com.itheima.pojo.Scheme;
import com.itheima.service.SchemeService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 干预方案管理
 */
@RestController
@RequestMapping("/scheme")
public class SchemeController {
    @Reference
    private SchemeService schemeService;

    /**
     * 分页查询
     * @param queryPageBean
     * @return
     */
    @RequestMapping("/findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return schemeService.findPage(queryPageBean);
    }

    /**
     * 新增干预方案
     * @param scheme
     * @param foodIdss
     * @param sportIds
     * @return
     */
    @RequestMapping("/add")
    public Result add(@RequestBody Scheme scheme, Integer[] foodIdss, Integer[] sportIds ) {
        try {
            schemeService.add(scheme);
            return new Result(true, "新增干预方案成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "新增干预方案失败");
        }
    }

    /**
     * 根据id查询方案 实现数据回显
     * @param id  干预方案的id值
     * @return  返回干预方案
     */
    @RequestMapping("/findSchemeById")
    public Result findSchemeById(Integer id) {
        try {
            Scheme scheme = schemeService.findById(id);
            return new Result(true, MessageConstant.EDIT_CHECKITEM_SUCCESS,scheme);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.EDIT_CHECKITEM_FAIL);
        }
    }

     /**
     * 修改干预方案
     * @param scheme  接收前端传过来新的方案信息
     * @return  返回修改方案后的信息
     */
    @RequestMapping("/edit")
    public Result edit(@RequestBody Scheme scheme) {
        try {
            schemeService.edit(scheme);
            return new Result(true, "新增干预方案成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "新增干预方案失败");
        }
    }

    /**
     * 删除干预方案
     * @param id 干预方案的id值
     * @return  返回删除结果 成功|失败
     */
    @RequestMapping("/delete")
    public Result delete(Integer id) {
        try {
            schemeService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "删除干预方案成功");
        }
        return new Result(true, "删除干预方案失败");
    }
}
