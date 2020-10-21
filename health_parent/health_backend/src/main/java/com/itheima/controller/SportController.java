package com.itheima.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.entity.Result;;
import com.itheima.pojo.Sport;
import com.itheima.service.SportService;
import com.itheima.utils.POIUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

/**
 * 运动管理后台
 */
@RestController
@RequestMapping("/sport")
public class SportController {
    @Reference
    private SportService sportService;

    //文件上传，实现预约设置数据批量导入
    @RequestMapping("/upload")
    public Result upload(@RequestParam("excelFile") MultipartFile multipartFile) {
        try {
            List<String[]> list = POIUtils.readExcel(multipartFile); //使用POI解析文件，这种数据不直观
            if (list != null && list.size() > 0) {  //对数据进行判断
                List<Sport> sports = new ArrayList<>(); //封装成OrderSetting实体类
                for (String[] strings : list) { //stings是每一行数据
                    String helpCode = strings[0];
                    String sportname = strings[1];
                    String number = strings[2];
                    String sporttime = strings[3];

                    Sport sport = new Sport(helpCode, sportname, number, sporttime);
                    sports.add(sport);
                }
                //通过dubbo远程调用服务实现数据批量导入到数据库
                sportService.save(sports);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "批量导入运动成功！");
        }
        return new Result(true, "批量导入运动失败！");
    }

    //分页查询
    @RequestMapping("/findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return sportService.findPage(queryPageBean);
    }

    //新增运动管理
    @RequestMapping("/addSport")
    public Result addSport(@RequestBody Sport sport) {
        try {
            sportService.add(sport);
            return new Result(true, "新增运动成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "新增运动失败！");
        }
    }

    //根据id实现数据回显
    @RequestMapping("/findSportById")
    public Result findSportById(Integer id) {
        try {
            Sport sport = sportService.findById(id);
            return new Result(true, "所选运动数据回显成功！",sport);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "所选运动数据回显失败！");
        }
    }

    //修改
    @RequestMapping("/edit")
    public Result edit(@RequestBody Sport sport) {
        try {
            sportService.edit(sport);
            return new Result(true, "修改运动成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "修改运动失败！");
        }
    }


    //删除
    @RequestMapping("/delete")
    public Result delete(Integer id) {
        try {
            sportService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "删除运动成功！");
        }
        return new Result(true,"删除运动失败！");
    }

    //查询所有饮食信息
    @RequestMapping("/findAllSport")
    public Result findAllSport() {
        try {
            List<Sport> list = sportService.findAll();
            return new Result(true, "查询全部运动成功！",list);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false,"查询全部运动失败！");
        }
    }
}
