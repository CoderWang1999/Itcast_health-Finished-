package com.itheima.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.itheima.dao.CheckItemDao;
import com.itheima.entity.CheckItemDeleteException;
import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.pojo.CheckItem;
import com.itheima.service.CheckItemService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class CheckItemServiceImpl implements CheckItemService {
    @Autowired
    private CheckItemDao checkItemDao;
    //新增功能
    @Override
    public void add(CheckItem checkItem) {
       checkItemDao.add(checkItem);
    }

    //分页查询
    @Override
    public PageResult findPage(QueryPageBean queryPageBean) {
        Integer currentPage = queryPageBean.getCurrentPage();
        Integer pageSize = queryPageBean.getPageSize();
        String queryString = queryPageBean.getQueryString();
        //使用分页插件分页查询
        PageHelper.startPage(currentPage,pageSize);
        //调用持久层查询所有
        Page<CheckItem> page = checkItemDao.selectByCondition(queryString);
        //获取总共查询到的条目数
        long total = page.getTotal();
        //获取查询结果
        List<CheckItem> rows = page.getResult();
        return new PageResult(total,rows);
    }

    //根据id删除
    @Override
    public void deltetByid(Integer id) throws CheckItemDeleteException {
        //先查询有无关联关系
        long count=checkItemDao.findCountCheckItemID(id);
        //如何有关联关系不进行删除操作
        if (count>0){
            throw new CheckItemDeleteException();
        }
        //如果没有关联关系直接执行删除操作
        checkItemDao.deltetByid(id);
    }

    //编辑
    @Override
    public void edit(CheckItem checkItem) {
        checkItemDao.edit(checkItem);
    }

    //不带分页的查询所有
    @Override
    public List<CheckItem> findAll() {
        return checkItemDao.findAll();
    }

}
