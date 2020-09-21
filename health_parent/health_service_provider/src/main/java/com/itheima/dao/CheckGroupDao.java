package com.itheima.dao;

import com.github.pagehelper.Page;
import com.itheima.pojo.CheckGroup;

import java.util.List;
import java.util.Map;

public interface CheckGroupDao {
    //新增检查组
    void add(CheckGroup checkGroup);
    //新增关联关系
    void setCheckGroupIdAndCheckItemId(Map map);
    //分页、条件查询
    Page<CheckGroup> selectByCondition(String queryString);
    //根据id查询
    CheckGroup findById(Integer checkgroupId);
    //根据检查组id查询其所关联的检查项的id
    List<Integer> findCheckitemIdsByCheckgroupId(Integer checkgroupId);
    //修改检查组
    void edit(CheckGroup checkGroup);
    //清理关联关系
    void clear(Integer groupId);
    //删除检查组
    void delete(Integer id);
}
