package com.itheima.controller;


import com.alibaba.dubbo.config.annotation.Reference;
import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.entity.Result;
import com.itheima.pojo.Food;
import com.itheima.service.FoodService;
import com.itheima.utils.POIUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

/**
 * 饮食管理后台
 */
@RestController
@RequestMapping("/food")
public class FoodController {
    @Reference
    private FoodService foodService;

    //文件上传，实现预约设置数据批量导入
    @RequestMapping("/upload")
    public Result upload(@RequestParam("excelFile") MultipartFile multipartFile) {
        try {
            List<String[]> list = POIUtils.readExcel(multipartFile); //使用POI解析文件，这种数据不直观
            List<Food> foods = new ArrayList<>(); //封装成OrderSetting实体类
            if (list != null && list.size() > 0) {  //对数据进行判断
                for (String[] strings : list) { //stings是每一行数据
                    String foodname = strings[0];
                    String kind = strings[1];
                    String size = strings[2];
                    String age = strings[3];
                    Food food = new Food(foodname, kind, size, age);
                    foods.add(food);
                }
                //通过dubbo远程调用服务实现数据批量导入到数据库
                foodService.save(foods);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "批量导入数据成功！");
        }
        return new Result(true, "批量导入数据失败！");
    }

    //分页查询
    @RequestMapping("/findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return foodService.findPage(queryPageBean);
    }

    //新增饮食
    @RequestMapping("/addFood")
    public Result addFood(@RequestBody Food food) {
        try {
            foodService.add(food);
            return new Result(true, "新增饮食成功！");//新增饮食成功
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "新增饮食失败！");//新增饮食失败
        }
    }

    //根据id查询饮食 实现数据回显
    @RequestMapping("/findFoodById")
    public Result findFoodById(Integer id) {
        try {
            Food food = foodService.findById(id);
            return new Result(true, "所选饮食数据回显成功！", food);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false,"所选饮食数据回显失败！");
        }
    }

    //修改
    @RequestMapping("/edit")
    public Result edit(@RequestBody Food food) {
        try {
            foodService.edit(food);
            return new Result(true, "修改饮食成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "修改饮食失败！");
        }
    }

    //删除
    @RequestMapping("/delete")
    public Result delete(Integer id) {
        try {
            foodService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "删除饮食成功！");
        }
        return new Result(true, "删除饮食失败！");
    }

    //查询所有饮食信息
    @RequestMapping("/findAllFood")
    public Result findAllFood() {
        try {
            List<Food> list = foodService.findAll();
            return new Result(true, "查询全部饮食成功！", list);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "查询全部饮食失败！");
        }
    }
}
